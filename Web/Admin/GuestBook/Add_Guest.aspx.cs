
using FineUIPro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.GuestBook
{
    public partial class  Add_Guest :  PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
            if (!IsPostBack)
            {
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
           
                Calendar1.SelectedDate = DateTime.Now;
               
                if (!String.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                 
                    Maticsoft.BLL.tGuestBook bll = new Maticsoft.BLL.tGuestBook();
                    Maticsoft.Model.tGuestBook model = bll.GetModel(int.Parse(Request.QueryString["Id"]));
                    GuestContent.Text = model.GuestContent;
                    ReplayContent.Text = model.ReplayContent;
                    Calendar1.SelectedDate = (model.Replay_time==null?DateTime.Now:model.Replay_time);
                    
                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Maticsoft.BLL.tGuestBook bll = new Maticsoft.BLL.tGuestBook();
            
            if (Calendar1.SelectedDate == null)
            {
                Calendar1.SelectedDate = DateTime.Now;
            }
          
            if (!String.IsNullOrEmpty(Request.QueryString["Id"]))
            {

                Maticsoft.Model.tGuestBook model = bll.GetModel(int.Parse(Request.QueryString["Id"]));

                model.ReplayContent = ReplayContent.Text;
                
                model.Replay_time = Calendar1.SelectedDate;
              
                bll.Update(model);
                PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
            }
        }
    }
}