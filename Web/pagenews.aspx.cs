using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace Maticsoft.Web
{
    public partial class pagenews : System.Web.UI.Page
    {
 
        protected string typeName = "";
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Request.QueryString["tId"] == null)
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
             

            Maticsoft.BLL.tArticle BLLT = new Maticsoft.BLL.tArticle();
            DataTable dt = BLLT.GetList(" IsEnable=1 and ArtTyID=" + tId + " order by Sort desc,UpdateTime desc ").Tables[0];

            PagedDataSource objPds = new PagedDataSource();
            objPds.DataSource = dt.DefaultView;
            objPds.AllowPaging = true;
            objPds.PageSize = 10;//  每页多少条
            int PageSum = objPds.PageCount;
            if (PageSum == 1)
            {
                PageView.Text = "";

            }

            else
            {
                int CurPage;
                if (Request.QueryString["Page"] != null)
                {
                    CurPage = Convert.ToInt32(Request.QueryString["Page"]);
                }
                else
                {
                    CurPage = 1;
                }
                objPds.CurrentPageIndex = CurPage - 1;

                if (CurPage < PageSum + 1)
                {
                    PageView.Text += " <a  href='?tId=" + tId + "'  >&lt;&lt;</a> ";
                    if (!objPds.IsFirstPage)
                    {
                        PageView.Text += "<a  href='?Page=" + (CurPage - 1) + "&tId=" + tId + "' >上一页</a>";
                    }
                    else
                    {
                        PageView.Text += "<a  title='已是第一页' >上一页</a>";
                    }
                    for (int i = CurPage - 5; i < CurPage + 5; i++)
                    {
                        if (i < 0 || i >= PageSum)
                        {
                            continue;
                        }

                        else
                        {
                            if (CurPage == (i + 1))
                            {
                                PageView.Text += " <span class=\"current\">" + (i + 1) + "</span>";
                            }
                            else
                                PageView.Text += "<a  href='?Page=" + (i + 1) + "&tId=" + tId + "' >" + (i + 1) + "</a>";
                        }
                    }
                }
                
                if (!objPds.IsLastPage)
                {
                    PageView.Text += "<a  href='?Page=" + (CurPage + 1) + "&tId=" + tId + "'  >下一页</a>";
                }
                else
                {
                    PageView.Text += "<a  title='已是最后页' >下一页</a>";
                }
                PageView.Text += "<a  href='?Page=" + PageSum + "&tId=" + tId + "' title='末页'>&gt;&gt;</a>";

            }

            DataList1.DataSource = objPds;
            DataList1.DataBind();
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