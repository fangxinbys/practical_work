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

namespace Maticsoft.Web.Admin.GuestBook
{
    public partial class GuestBook :PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
    
            if (!IsPostBack)
            { 
                BindGridGuest();
            }
        }
        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            BindGridGuest();
            Alert.ShowInTop("操作成功!");
        }
        protected void GridDpt_RowCommand(object sender, GridCommandEventArgs e)
        {

            int Id = GetSelectedDataKeyID(Grid);


            if (e.CommandName == "Delete")
            {

                Maticsoft.BLL.tGuestBook BLL = new Maticsoft.BLL.tGuestBook();

                if (BLL.Delete(Id) == true)
                {
                    BindGridGuest();
                    Alert.ShowInTop("删除成功!");
                }
                else
                {
                    Alert.ShowInTop("删除失败!");
                }
            }
            if (e.CommandName == "Edit")
            {
           

                PageContext.RegisterStartupScript(Window1.GetShowReference("Add_Guest.aspx?Id=" + Id));
            }


        }

     
        protected void BindGridGuest()
        {
            Maticsoft.BLL.tGuestBook BLL = new Maticsoft.BLL.tGuestBook();

            Grid.RecordCount = BLL.GetRecordCount("");
            Grid.DataSource = BLL.GetListByPage("", " Leave_time desc,Id desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);

            Grid.DataBind();
        }

 




 
        protected void btnSelect_Click(object sender, EventArgs e)
        {

            string txtVal = this.txtValue.Text.Trim();

            if (txtVal == "")
                return ;

            Maticsoft.BLL.tGuestBook BLL = new Maticsoft.BLL.tGuestBook();

            Grid.RecordCount = BLL.GetRecordCount(String.Format(" Leave_name   like '%{0}%' ", txtVal));
            Grid.DataSource = BLL.GetListByPage(String.Format(" Leave_name  like '%{0}%' ", txtVal), " Leave_time desc,Id desc ", Grid.PageIndex * Grid.PageSize, (Grid.PageIndex + 1) * Grid.PageSize);

            Grid.DataBind();
      

        }

       
    

       

        protected void Grid_PageIndexChange(object sender, GridPageEventArgs e)
        {
            BindGridGuest();
        }
    }
}