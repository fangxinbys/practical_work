 
using System;
using System.Collections.Generic;
using System.Text;

namespace Maticsoft.Web
{
    public partial class pagenews_info : System.Web.UI.Page
    {
 
        protected string typeName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["tId"] == null && Request.QueryString["Id"] == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            int tId = 0;
            try
            {

                tId = int.Parse(Request.QueryString["tId"].ToString());

            }
            catch
            {
                Response.Redirect("index.aspx");
                return;
            }
            if (!IsPostBack)
            { 
           
                getNav(tId);
            }
            Maticsoft.Model.tArticle model = null;
            Maticsoft.BLL.tArticle BLL = new Maticsoft.BLL.tArticle();
            model = BLL.GetModel(int.Parse(Request.QueryString["Id"]));
            model.Click = (model.Click + 1);
            BLL.Update(model);
            lit_title.Text = model.Title;
            this.Title += "-" + model.Title;
            lit_content.Text = model.ArticleContent;
            lit_edit.Text = model.Editor;
            lit_click.Text = model.Click.ToString();
            lit_time.Text = Convert.ToDateTime(model.UpdateTime).ToString("yyyy-MM-dd");

        }

        protected void getNav(int tId)
        {

            StringBuilder sb = new StringBuilder();
            BLL.tArticleType bll = new Maticsoft.BLL.tArticleType();
            List<Model.tArticleType> list = null;
            if (tId == 7)
            {
                list = bll.GetModelList(" IsEnable=1 and Id=7 ");
            }
            else
            {
                list = bll.GetModelList(" IsEnable=1 and Id<>7 ");
            }
            foreach (Model.tArticleType m in list)
            {
                if (m.Id == tId)
                {
                    typeName =m.Name;
                    this.Title = m.Name;
                    sb.Append("<div class=\"df f-ac tab-content tab-active\" data-title=\"" + m.Name + "\">");
                }
                else
                {
                    sb.Append("<div class=\"df f-ac tab-content\" data-title=\"" + m.Name + "\">");
                }

                sb.Append("<div class=\"fs-1 fw-b\">");
                sb.Append("<img src=\"images/list-icon-active.png\" />");
                sb.Append("</div>");
                if (tId == 7)
                {
                    sb.Append("<div class=\"tab-title\"><a href=\"member.aspx\">" + m.Name + "</a></div>");
                }
                else
                {
                    sb.Append("<div class=\"tab-title\"><a href=\"pagenews.aspx?tId=" + m.Id + "\">" + m.Name + "</a></div>");
                }
                sb.Append("</div>");
            }
            lit_nav.Text = sb.ToString();
        }

    }
}