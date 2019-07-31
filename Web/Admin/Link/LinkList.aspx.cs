using FineUIPro;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.Link
{
    public partial class LinkList : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
                LoadData();

            }
        }

        protected void GridDpt_PageIndexChange(object sender, FineUIPro.GridPageEventArgs e)
        {
            LoadData();
        }
        protected string GetName(string Tid)
        {
            Maticsoft.BLL.tLinkType BLL = new Maticsoft.BLL.tLinkType();
            return BLL.GetModel(int.Parse(Tid)).Name;
        }

        protected void LoadData()
        {
            Maticsoft.BLL.tLink BLL = new Maticsoft.BLL.tLink();
            string sortField = GridDpt.SortField;
            string sortDirection = GridDpt.SortDirection;
     
           
                GridDpt.RecordCount = BLL.GetRecordCount("");
                DataView view = BLL.GetListByPage("", "", GridDpt.PageIndex * GridDpt.PageSize, (GridDpt.PageIndex + 1) * GridDpt.PageSize).Tables[0].DefaultView;
                view.Sort = String.Format("{0} {1}", sortField, sortDirection);
                GridDpt.DataSource = view.ToTable();
          
            GridDpt.DataBind();

        }

        protected void TreeDpt_NodeCommand(object sender, TreeCommandEventArgs e)
        {
            LoadData();
        }

        protected void GridDpt_RowCommand(object sender, GridCommandEventArgs e)
        {

            int roleID = GetSelectedDataKeyID(GridDpt);


            if (e.CommandName == "Delete")
            {



                BLL.tLink BLL = new Maticsoft.BLL.tLink();

                bool isTrue = BLL.Delete(roleID);

                if (!isTrue)
                {
                    Alert.ShowInTop("删除失败！");
                    return;
                }
                else
                {

                    LoadData();
                }
            }
            else
            {
                Window1.Title = "编辑链接";
                string openUrl = String.Format("./LinkEdit.aspx?roleId={0}", HttpUtility.UrlEncode(roleID.ToString()));
                PageContext.RegisterStartupScript(Window1.GetSaveStateReference(roleID.ToString()) + Window1.GetShowReference(openUrl));
            }
        }

        protected void GridDpt_Sort(object sender, GridSortEventArgs e)
        {
            LoadData();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Window1.Title = "编辑链接";
            PageContext.RegisterStartupScript(Window1.GetShowReference("./LinkEdit.aspx"));
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            Alert.ShowInTop("保存成功");
      
            LoadData();
        }
    }
}