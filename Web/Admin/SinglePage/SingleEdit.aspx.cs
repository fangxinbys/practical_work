using FineUIPro; 
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.SinglePage 
{
    public partial class SingleEdit : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                Bind();
            }
        }

        private void Bind()
        { 

            if (!String.IsNullOrEmpty(Request.QueryString["pageId"]))
            {
                string pageId = Request.QueryString["pageId"];

                UpMenuModel(pageId);
            }


        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["pageId"]))
            {
                Maticsoft.BLL.tAbout BLL = new Maticsoft.BLL.tAbout();
                int pageId = int.Parse(Request.QueryString["pageId"]);
                Maticsoft.Model.tAbout menu = BLL.GetModel(pageId);
                if (BLL.GetList(string.Format(" Title='{0}' and Id<>{1} ", txtName.Text, pageId)).Tables[0].Rows.Count >= 1)
                {
                    Alert.ShowInTop("该名称已经存在！"); return;
                }

                menu.Id = pageId;
                menu.Title = txtName.Text.ToString().Trim();

                menu.Sort = Convert.ToInt32(txtSort.Text.ToString().Trim());

                if (BLL.Update(menu) == true)
                {
                    PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
                }
                else
                {
                    Alert.ShowInTop("操作失败！");
                }
            }
            else
            {
                Maticsoft.BLL.tAbout BLL = new Maticsoft.BLL.tAbout();
                Maticsoft.Model.tAbout menu = new Maticsoft.Model.tAbout();
                if (BLL.GetList(string.Format(" Title='{0}' ", txtName.Text)).Tables[0].Rows.Count >= 1)
                {
                    Alert.ShowInTop("该名称已经存在！"); return;
                }

                menu.Title = txtName.Text.ToString().Trim();
                menu.Sort = Convert.ToInt32(txtSort.Text.ToString().Trim());

                if (BLL.Add(menu) >= 1)
                {
                    PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
                }
                else
                {
                    Alert.ShowInTop("操作失败！");
                }
            }

        }
        /// <summary>
        /// 根据ArtGuid 来给控件赋值
        /// </summary>
        /// <param name="ArtGuid"></param>
        public void UpMenuModel(string ArtGuid)
        {
            Maticsoft.BLL.tAbout BLL = new Maticsoft.BLL.tAbout();
            Maticsoft.Model.tAbout m = BLL.GetModel(int.Parse(ArtGuid));

            txtName.Text = m.Title;

            txtSort.Text = m.Sort.ToString();

        }
    }
}