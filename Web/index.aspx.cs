using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Web.Code;

namespace Maticsoft.Web
{
    public partial class index : System.Web.UI.Page
    {
        web web = new web();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                getBanner();
                getAbout();
                getArticle();
                getArticleMe();
            }
        }

        protected void getBanner()
        {
            lit_banner.Text= web.GetPic(2, 6); 
        }
        protected void getAbout()
        {
            Model.tAbout about = web.About(3);
            lit_about.Text = about==null? "": about.Remark;
        }
        protected void getArticleMe()
        {
            StringBuilder sb = new StringBuilder();
            DataTable dt = web.GetArtByTid(7, 10);

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                sb.Append("<li>");
                string str=dt.Rows[i]["Title"].ToString().Length > 16 ? dt.Rows[i]["Title"].ToString().Substring(0, 15) : dt.Rows[i]["Title"].ToString();
      
                sb.Append("<a href=\"pagenews_info.aspx?tId=" + dt.Rows[i]["ArtTyID"] + "&Id=" + dt.Rows[i]["Id"] + "\">"+str+"</a>");
       
                sb.Append("</li>"); 
            }
            lit_me.Text = sb.ToString();
        }
        protected void getArticle()
        {
            StringBuilder sb = new StringBuilder();
            BLL.tArticleType bll = new Maticsoft.BLL.tArticleType();
            List<Model.tArticleType> list = bll.GetModelList(" IsEnable=1 and Id<>7");
            foreach (Model.tArticleType m in list)
            {
                sb.Append("<div class=\"col-lg-6 pt-15\">");

                sb.Append("<div class=\"df article-title-content\">");
                sb.Append("<div class=\"fg-3\">");
                sb.Append("<span class=\"article-title\">" + m.Name + "</span>");
                sb.Append("</div>");
                sb.Append("<div class=\"fg-1 tx-r article-more\">");
                sb.Append("<a href=\"pagenews.aspx?tId=" + m.Id + "\">更多></ a >");
                sb.Append("</div >");
                sb.Append("</div >");

                DataTable dt = web.GetArtByTid(m.Id, 6);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (i == 0)
                    {
                        sb.Append("<div class=\"am-g pt-15 no-m\">");
                        sb.Append("<div class=\"col-lg-4 no-p\">");
                        sb.Append("<img src=" + dt.Rows[i]["FengMian"].ToString().Replace("~/", "../") + " class=\"left-img\" alt='" + dt.Rows[i]["Title"] + "' />");
                        sb.Append("</div>");
                        sb.Append("<div class=\"col-lg-8 no-pr\">");
                        sb.Append("<div class=\"article-detalis\">");
                        sb.Append("<p class=\"t-n-30 tx-o-3 line-h-23\">");
                        sb.Append(dt.Rows[i]["Title"].ToString().Length > 52 ? dt.Rows[i]["Title"].ToString().Substring(0, 52) : dt.Rows[i]["Title"].ToString());
                        sb.Append("</p>");
                        sb.Append("<div class=\"df f-ac more_detail\">");
                        sb.Append("<div class=\"\">...</div>");
                        sb.Append("<div class=\"fg-1 more_detail-text tx-r\">");
                        sb.Append("<a href=\"pagenews_info.aspx?tId=" + dt.Rows[i]["ArtTyID"] + "&Id=" + dt.Rows[i]["Id"] + "\">详情</a>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");

                    }
                    else
                    {
                        if (i == 1)
                        {
                            sb.Append("<div class=\"details-list-content\">");

                        }
                        sb.Append("<a href=\"pagenews_info.aspx?tId=" + dt.Rows[i]["ArtTyID"] + "&Id=" + dt.Rows[i]["Id"] + "\" class=\"tx-o-1\">");
                        sb.Append("<i class=\"circular\"></i><span class=\"pl-10\">");
                        sb.Append(dt.Rows[i]["Title"].ToString().Length > 29 ? dt.Rows[i]["Title"].ToString().Substring(0, 28) + "..." : dt.Rows[i]["Title"].ToString());
                        sb.Append("</span></a>");
                        if (i == dt.Rows.Count - 1)
                        {
                            sb.Append("</div>");

                        }
                    }
                }

                sb.Append("</div>");
            }


            lit_article.Text = sb.ToString();

        }
    }
}