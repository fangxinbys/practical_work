
using FineUIPro;
 
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.Articles
{
    public partial class ArticlesList : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
            if (!IsPostBack)
            {
                BindGrid();
                BindGridByTid(0);
            }
        }
        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            GetView();

            Alert.ShowInTop("操作成功!");
        }
        protected void GetView()
        {
            int Tid = 0;
            if (string.IsNullOrEmpty(TMailList.SelectedNodeID))
                Tid = 0;
            else
                Tid = int.Parse(TMailList.SelectedNodeID);

            Maticsoft.BLL.tArticle BLL = new Maticsoft.BLL.tArticle();
            if (Tid == 0)
            {
                Grid.RecordCount = BLL.GetRecordCount("");
                Grid.DataSource = BLL.GetListByPage("", " Sort desc,UpdateTime desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            else
            {
                Grid.RecordCount = BLL.GetRecordCount(" ArtTyID=" + Tid);
                Grid.DataSource = BLL.GetListByPage(" ArtTyID=" + Tid, " Sort desc,UpdateTime desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            Grid.DataBind();

        }

        protected void TMailList_NodeCommand(object sender, TreeCommandEventArgs e)
        {

            BindGridByTid(int.Parse(TMailList.SelectedNodeID));
        }
        protected void BindGridByTid(int Tid)
        {
            Maticsoft.BLL.tArticle BLL = new Maticsoft.BLL.tArticle();
            if (Tid == 0)
            {
                Grid.RecordCount = BLL.GetRecordCount("");
                Grid.DataSource = BLL.GetListByPage("", " Sort desc,UpdateTime desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            else
            {
                Grid.RecordCount = BLL.GetRecordCount(" ArtTyID=" + Tid);
                Grid.DataSource = BLL.GetListByPage(" ArtTyID=" + Tid, " Sort desc,UpdateTime desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            Grid.DataBind();
        }
     
        protected string GetName(string Tid)
        {
            Maticsoft.BLL.tArticleType BLL = new Maticsoft.BLL.tArticleType();
            return BLL.GetModel(int.Parse(Tid)).Name;
        }



        private void BindGrid()
        {

            Maticsoft.BLL.tArticleType BLL = new Maticsoft.BLL.tArticleType();

            TMailList.Nodes.Clear();
            DataSet ds = BLL.GetList(" IsEnable=1 order by Sort desc");
            ds.Relations.Add("TreeRelation", ds.Tables[0].Columns["Id"], ds.Tables[0].Columns["FatherID"], false);

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (row["FatherID"].ToString() == "0")
                {
                    FineUIPro.TreeNode node = new FineUIPro.TreeNode();
                    node.NodeID = row["Id"].ToString();
                    node.Text = row["Name"].ToString();
                    node.Expanded = true;
                    if (row.GetChildRows("TreeRelation").Length <= 0)
                    {
                        node.ToolTip = "可选择";
                    }
                    else
                    {
                        node.ToolTip = "不可选择";
                    }
                    node.EnableClickEvent = true;
                    TMailList.Nodes.Add(node);
                    ResolveSubTree(row, node);
                }

            }
        }


        private void ResolveSubTree(DataRow dataRow, FineUIPro.TreeNode treeNode)
        {
            DataRow[] rows = dataRow.GetChildRows("TreeRelation");
            if (rows.Length > 0)
            {

                treeNode.Expanded = true;
                foreach (DataRow row in rows)
                {
                    FineUIPro.TreeNode node = new FineUIPro.TreeNode();
                    node.NodeID = row["Id"].ToString();
                    node.Text = row["Name"].ToString();
                    if (row.GetChildRows("TreeRelation").Length <= 0)
                    {
                        node.ToolTip = "可选择";
                    }
                    else
                    {
                        node.ToolTip = "不可选择";
                    }
                    node.EnableClickEvent = true;
                    treeNode.Nodes.Add(node);
                    ResolveSubTree(row, node);
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
    
            if (string.IsNullOrEmpty(TMailList.SelectedNodeID))
            {
                Alert.ShowInTop("请选择文章栏目!"); return;
            }
            if (TMailList.SelectedNode.ToolTip == "不可选择")
            {
                Alert.ShowInTop("请选择子文章栏目!"); return;
            }
     
            PageContext.RegisterStartupScript(Window1.GetShowReference(string.Format("./ArticlesEdit.aspx?tyId={0}", TMailList.SelectedNodeID)) );
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {

            string txtVal = this.txtValue.Text.Trim();

            if (txtVal == "")
                GetView();


            int Tid = 0;
            if (string.IsNullOrEmpty(TMailList.SelectedNodeID))
                Tid = 0;
            else
                Tid = int.Parse(TMailList.SelectedNodeID);

            Maticsoft.BLL.tArticle BLL = new Maticsoft.BLL.tArticle();
            if (Tid == 0)
            {
                Grid.RecordCount = BLL.GetRecordCount(String.Format(" Title like '%{0}%' ", txtVal));
                Grid.DataSource = BLL.GetListByPage(String.Format(" Title like '%{0}%' ", txtVal), " Sort desc,UpdateTime desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            else
            {
                Grid.RecordCount = BLL.GetRecordCount(String.Format(" Title like '%{0}%' and ArtTyID=" + Tid, txtVal));
                Grid.DataSource = BLL.GetListByPage(String.Format(" Title like '%{0}%' and ArtTyID=" + Tid, txtVal), " Sort desc,UpdateTime desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }

            Grid.DataBind();
        }
     
        
 
   

        protected void Grid_PageIndexChange(object sender, GridPageEventArgs e)
        {
            GetView();
        }

        protected void Grid_RowCommand(object sender, GridCommandEventArgs e)
        {
            int artId = GetSelectedDataKeyID(Grid);


            if (e.CommandName == "Delete")
            {


                Maticsoft.BLL.tArticle BLL = new Maticsoft.BLL.tArticle();

                Maticsoft.Model.tArticle model = BLL.GetModel(artId);
                if (!string.IsNullOrEmpty(model.FengMian) && (model.FengMian != "../../upload/blank.png"))
                {
                    string directoryPath = Server.MapPath(model.FengMian);
                    File.Delete(directoryPath);
                    //删除掉原来的图片
                }
                BLL.Delete(artId); 
                GetView();
     
            }
            if (e.CommandName == "Edit")
            {
 
                PageContext.RegisterStartupScript(Window1.GetShowReference("ArticlesEdit.aspx?Id=" + artId));
            }
        }

    }
}