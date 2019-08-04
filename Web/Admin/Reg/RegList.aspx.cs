using FineUIPro;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.Reg
{
    public partial class RegList : PageBase
    {
        Maticsoft.BLL.tReg BLL = new Maticsoft.BLL.tReg();
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


            if (e.CommandName == "Edit")
            {


                Model.tReg model = BLL.GetModel(roleID);
                model.tDo = "已处理";
                if (BLL.Update(model))
                {
                    LoadData();
                }
                else
                {
                    Alert.ShowInTop("更新失败！");
                }
            }
        }

        protected void GridDpt_Sort(object sender, GridSortEventArgs e)
        {
            LoadData();
        }
 
 
    }
}