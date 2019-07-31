using FineUIPro;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.PicType
{
    public partial class PicList : PageBase
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


        protected void LoadData()
        {
            Maticsoft.BLL.tPictureType BLL = new Maticsoft.BLL.tPictureType();
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

            int PicId = GetSelectedDataKeyID(GridDpt);


            if (e.CommandName == "Delete")
            {
              


                BLL.tPictureType BLL = new Maticsoft.BLL.tPictureType();

                bool isTrue = BLL.Delete(PicId);

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
                Window1.Title = "分类编辑";
                string openUrl = String.Format("./PicEdit.aspx?PicId={0}", HttpUtility.UrlEncode(PicId.ToString()));
                PageContext.RegisterStartupScript(Window1.GetSaveStateReference(PicId.ToString()) + Window1.GetShowReference(openUrl));
            }
        }

        protected void GridDpt_Sort(object sender, GridSortEventArgs e)
        {
            LoadData();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Window1.Title = "分类编辑";
            PageContext.RegisterStartupScript(Window1.GetShowReference("./PicEdit.aspx"));
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            Alert.ShowInTop("保存成功");
      
            LoadData();
        }
    }
}