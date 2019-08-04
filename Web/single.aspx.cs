 
using System;
using System.Collections.Generic;
using System.Text;
namespace Maticsoft.Web
{
    public partial class single : System.Web.UI.Page
    {
        protected string typeName = "";
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            int Id = 0;
            try
            {

                Id = int.Parse(Request.QueryString["Id"].ToString());

            }
            catch
            {
                Response.Redirect("index.aspx");
                return;
            }
            if (!IsPostBack)
            {
            
                getNav(Id);
            }
        }

        protected void getNav(int tId)
        {

            StringBuilder sb = new StringBuilder();
            BLL.tAbout bll = new Maticsoft.BLL.tAbout();
            List<Model.tAbout> list = null;
            if (tId <= 6)
            {
                list = bll.GetModelList(string.Format(" Id<={0} ", 6));
            }
            else if (tId == 7)
            {
                list = bll.GetModelList(string.Format(" Id={0} ", tId));
            }
            else if(tId>8)
            {
                list = bll.GetModelList(string.Format(" Id>{0} ", 8));
            }
            foreach (Model.tAbout m in list)
            {
                if (m.Id == tId)
                {
                    typeName = m.Title;
                    this.Title = m.Title;
                    lit_content.Text = m.AboutContent;

                    sb.Append("<div class=\"df f-ac tab-content tab-active\" data-title=\"" + m.Title + "\">");
                }
                else
                {
                    sb.Append("<div class=\"df f-ac tab-content\" data-title=\"" + m.Title + "\">");
                }

                sb.Append("<div class=\"fs-1 fw-b\">");
                sb.Append("<img src=\"images/list-icon-active.png\" />");
                sb.Append("</div>");
                sb.Append("<div class=\"tab-title\"><a href=\"single.aspx?Id=" + m.Id + "\">" + m.Title + "</a></div>");
                sb.Append("</div>");
            }
            lit_nav.Text = sb.ToString();
        }
    }
}