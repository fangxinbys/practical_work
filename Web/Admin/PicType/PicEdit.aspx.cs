using FineUIPro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.PicType
{
    public partial class PicEdit : PageBase
    {
        BLL.tPictureType BLL = new BLL.tPictureType();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnClose.OnClientClick = ActiveWindow.GetHideReference();

                if (!string.IsNullOrEmpty(Request.QueryString["PicId"]))
                {
                    string PicId = Request.QueryString["PicId"];

                    LoadData(PicId);
                }


            }
        }
        protected void LoadData(string PicId)
        {

            Model.tPictureType m = BLL.GetModel(Convert.ToInt32(PicId));
            if (m == null)
            {
                Alert.ShowInTop("出错了！"); return;

            }

            txtRoleName.Text = m.Name;
            txtRemark.Text = m.Remark;
 
        }

      

        protected void btnSaveClose_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PicId"]))
            {
                string PicId = Request.QueryString["PicId"];
                Model.tPictureType m = BLL.GetModel(Convert.ToInt32(PicId));
                if (m == null) return;

                m.Name = txtRoleName.Text.Trim();
                m.Remark = txtRemark.Text.Trim();
           



                if (BLL.Update(m) == true)
                {
                    PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
                }
                else
                {
                    Alert.ShowInTop("出错了！");
                }
            }
            else
            {
                Model.tPictureType m = new Model.tPictureType();
                m.Name = txtRoleName.Text.Trim();
                m.Remark = txtRemark.Text.Trim();
                m.FatherId = 0;
                m.Sort = 0;
           
                if (BLL.Add(m) >= 1)
                {
                    PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
                }
                else
                {
                    Alert.ShowInTop("出错了！");
                }
            }

        }
    }
}