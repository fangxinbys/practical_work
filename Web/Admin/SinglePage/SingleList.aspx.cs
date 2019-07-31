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


namespace Maticsoft.Web.Admin.SinglePage
{
    public partial class SingleList : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                IniGrid();
            }
        }


        protected void IniGrid()
        {
            Maticsoft.BLL.tAbout BLL = new Maticsoft.BLL.tAbout();
            DataTable table = null;

            table = BLL.GetList(" Id >0 order by Sort desc").Tables[0];

            GridMenu.DataSource = table;
            GridMenu.DataBind();
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            Alert.ShowInTop("保存成功");

            IniGrid();

        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {

            PageContext.RegisterStartupScript(Window1.GetShowReference("./SingleEdit.aspx"));
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

                Maticsoft.BLL.tAbout BLL = new Maticsoft.BLL.tAbout();


                if (BLL.Delete(deptID) == true)
                {
                    Alert.ShowInTop("删除成功！"); IniGrid();
                }
            }
            if (e.CommandName == "Edit")
            {

                string openUrl = String.Format("./SingleEdit.aspx?pageId={0}", HttpUtility.UrlEncode(deptID.ToString()));
                PageContext.RegisterStartupScript(Window1.GetSaveStateReference(deptID.ToString())
                        + Window1.GetShowReference(openUrl));
            }
        }
    }
}