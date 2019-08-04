 
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Maticsoft.Web
{
    public partial class member : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
          
            int tId = 7;
           
           

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
        protected string GetImage(object code)
        {

            if (code == null)
            {
                return "";
            }

            if (code.ToString() == "../../upload/blank.png")
            {

                return "";
            }
            else
            {
                return "<img src=" + code.ToString().Replace("~/", "../") + " class=\"w-100\" />";
            }
        }
    }
}