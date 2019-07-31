using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Model;
using Web;
using FineUIPro;


namespace Maticsoft.Web.Admin.LinkType
{
    public partial class LinkTypeList : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       

            if (!IsPostBack)
            {
                GetFen();
                IniGrid();
            } 
        }
        
        protected string GetPNmae(string PID)
        {
            if (PID == "0") { return "根目录"; }
            else
            {
                Maticsoft.BLL.tLinkType bll = new Maticsoft.BLL.tLinkType();
                Maticsoft.Model.tLinkType model = bll.GetModel(int.Parse(PID));
                if (model == null)
                {
                    return "";
                }
                else
                {
                    return model.Name;
                }
            }
        }
        protected void GetFen()
        {
            ddlfatherId.Items.Clear();
            Maticsoft.BLL.tLinkType bll = new Maticsoft.BLL.tLinkType();
            DataTable table = bll.GetList(" FatherID=0 order by Sort desc").Tables[0];
            ddlfatherId.DataTextField = "Name";
            ddlfatherId.DataValueField = "Id";
            ddlfatherId.DataSource = table;
            ddlfatherId.DataBind();
            ddlfatherId.Items.Insert(0,new FineUIPro.ListItem ("加载全部",""));
            ddlfatherId.SelectedIndex = 0;
        }
     
        protected void IniGrid()
        {
            Maticsoft.BLL.tLinkType BLL = new Maticsoft.BLL.tLinkType();
            DataTable table = null;
            if (ddlfatherId.SelectedValue == "")
            {
                table = BLL.GetList(" Id >0 order by FatherID,Sort desc").Tables[0];
            }
            else { table = BLL.GetList(string.Format(" FatherID={0} order by FatherID, Sort desc", ddlfatherId.SelectedValue)).Tables[0]; }
            GridMenu.DataSource = table;
            GridMenu.DataBind();
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            Alert.ShowInTop("保存成功");
            GetFen();
            IniGrid();
        
        }

 

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Window1.Title = "编辑分类";
            PageContext.RegisterStartupScript(Window1.GetShowReference("./LinkTypeEdit.aspx"));
        }

        protected void ddlfatherId_SelectedIndexChanged(object sender, EventArgs e)
        {
            IniGrid();
        }

        protected void GridMenu_RowCommand(object sender, GridCommandEventArgs e)
        {
            int deptID = GetSelectedDataKeyID(GridMenu);


            if (e.CommandName == "Delete")
            {
              
                Maticsoft.BLL.tLinkType BLL = new Maticsoft.BLL.tLinkType();
                if (BLL.GetModelList(string.Format(" FatherID={0}", deptID)).Count > 0)
                {
                    Alert.ShowInTop("请先删除该分类下子分类！"); return;
                }

                if (BLL.Delete(deptID) == true)
                {
                    Alert.ShowInTop("删除成功！"); GetFen(); IniGrid();
                }
            }
            if (e.CommandName == "Edit")
            {
                Window1.Title = "编辑分类";
                string openUrl = String.Format("./LinkTypeEdit.aspx?ArtGuid={0}", HttpUtility.UrlEncode(deptID.ToString()));
                PageContext.RegisterStartupScript(Window1.GetSaveStateReference(deptID.ToString())
                        + Window1.GetShowReference(openUrl));
            }
        }
    }
}