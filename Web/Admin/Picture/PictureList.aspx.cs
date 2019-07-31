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

namespace Maticsoft.Web.Admin.Picture
{
    public partial class  PictureList :  PageBase
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
             
        }
        protected void GetView()
        {
            int Tid = 0;
            if (string.IsNullOrEmpty(TMailList.SelectedNodeID))
                Tid = 0;
            else
                Tid = int.Parse(TMailList.SelectedNodeID);

            Maticsoft.BLL.tPicture BLL = new Maticsoft.BLL.tPicture();
            if (Tid == 0)
            {
                Grid.RecordCount = BLL.GetRecordCount("");
                Grid.DataSource = BLL.GetListByPage("", " Sort desc,Id desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            else
            {
                Grid.RecordCount = BLL.GetRecordCount(" PicTyID=" + Tid);
                Grid.DataSource = BLL.GetListByPage(" PicTyID=" + Tid, " Sort desc, Id desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            Grid.DataBind();

        }

        protected void TMailList_NodeCommand(object sender, TreeCommandEventArgs e)
        {
            BindGridByTid(int.Parse(TMailList.SelectedNodeID));
        }
        protected void BindGridByTid(int Tid)
        {
            Maticsoft.BLL.tPicture BLL = new Maticsoft.BLL.tPicture();
            if (Tid == 0)
            {
                Grid.RecordCount = BLL.GetRecordCount("");
                Grid.DataSource = BLL.GetListByPage("", " Sort desc,Id desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            else
            {
                Grid.RecordCount = BLL.GetRecordCount(" PicTyID=" + Tid);
                Grid.DataSource = BLL.GetListByPage(" PicTyID=" + Tid, " Sort desc, Id desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            Grid.DataBind();
        }

        protected string GetName(string Tid)
        {
            Maticsoft.BLL.tPictureType BLL = new Maticsoft.BLL.tPictureType();
            return BLL.GetModel(int.Parse(Tid)).Name;
        }



        private void BindGrid()
        {

            Maticsoft.BLL.tPictureType BLL = new Maticsoft.BLL.tPictureType();

            TMailList.Nodes.Clear();
            DataSet ds = BLL.GetList(" id>0  order by Sort desc");
            ds.Relations.Add("TreeRelation", ds.Tables[0].Columns["id"], ds.Tables[0].Columns["FatherId"], false);




            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (row["FatherId"].ToString() == "0")
                {
                    FineUIPro.TreeNode node = new FineUIPro.TreeNode();
                    node.NodeID = row["id"].ToString();
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
                    node.NodeID = row["id"].ToString();
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
                Alert.ShowInTop("请选择图片分类!"); return;
            }
            if (TMailList.SelectedNode.ToolTip == "不可选择")
            {
                Alert.ShowInTop("请选择子图片分类!"); return;
            }
            PageContext.RegisterStartupScript(Window1.GetShowReference(string.Format("PicturesEdit.aspx?tyId={0}", TMailList.SelectedNodeID)));

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

            Maticsoft.BLL.tPicture BLL = new Maticsoft.BLL.tPicture();
            if (Tid == 0)
            {
                Grid.RecordCount = BLL.GetRecordCount(String.Format(" Name like '%{0}%' ", txtVal));
                Grid.DataSource = BLL.GetListByPage(String.Format(" Name like '%{0}%' ", txtVal), " Sort desc,Id desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }
            else
            {
                Grid.RecordCount = BLL.GetRecordCount(String.Format(" Name like '%{0}%' and PicTyID=" + Tid, txtVal));
                Grid.DataSource = BLL.GetListByPage(String.Format(" Name like '%{0}%' and PicTyID=" + Tid, txtVal), " Sort desc, Id desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);
            }

            Grid.DataBind();

        }



       

        protected void Grid_RowCommand(object sender, GridCommandEventArgs e)
        {
            int artId = GetSelectedDataKeyID(Grid);


            if (e.CommandName == "Delete")
            {


                Maticsoft.BLL.tPicture BLL = new Maticsoft.BLL.tPicture();

                Maticsoft.Model.tPicture model = BLL.GetModel(artId);

                string directoryPath = Server.MapPath(model.Code);
                File.Delete(directoryPath);

                BLL.Delete(artId);
                GetView();
            }
            if (e.CommandName == "Edit")
            {
       
                PageContext.RegisterStartupScript(Window1.GetShowReference("PicturesEdit.aspx?Id=" + artId));
            }
        }


        protected void Grid_PageIndexChange(object sender, GridPageEventArgs e)
        {
            GetView();
        }
    }
}