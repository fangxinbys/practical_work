using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
 

namespace Maticsoft.Web
{
    public partial class search : System.Web.UI.Page
    {
       
        protected string typeName = "";

        string keys = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["keys"] == null)
            {
                Response.Redirect("index.aspx");
                return;
            }


            if (!IsPostBack)
            {
                
                keys = NoHTML(Request.QueryString["keys"]);

             
                typeName = "搜索结果";
                this.Title = "搜索结果"; 
            }

            int tId = 0;
            Maticsoft.BLL.tArticle BLLT = new Maticsoft.BLL.tArticle();
            DataTable dt = BLLT.GetList(" IsEnable=1 and Title like '%"+ keys + "%' order by Sort desc,UpdateTime desc ").Tables[0];

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
                    PageView.Text += " <a  href='?tId=" + tId + "&keys=" + keys + "' >&lt;&lt;</a> ";
                    if (!objPds.IsFirstPage)
                    {
                        PageView.Text += "<a  href='?Page=" + (CurPage - 1) + "&tId=" + tId + "&keys=" + keys + "'>上一页</a>";
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
                                PageView.Text += "<a  href='?Page=" + (i + 1) + "&tId=" + tId + "&keys=" + keys + "' >" + (i + 1) + "</a>";
                        }
                    }
                }
                
                if (!objPds.IsLastPage)
                {
                    PageView.Text += "<a  href='?Page=" + (CurPage + 1) + "&tId=" + tId + "&keys=" + keys + "'>下一页</a>";
                }
                else
                {
                    PageView.Text += "<a  title='已是最后页'>下一页</a>";
                }
                PageView.Text += "<a  href='?Page=" + PageSum + "&tId=" + tId + "&keys=" + keys + "' title='末页'>&gt;&gt;</a>";

            }

            DataList1.DataSource = objPds;
            DataList1.DataBind();
        }



        /// <summary>
        /// 过滤标记
        /// </summary>
        /// <param name="NoHTML">包括HTML，脚本，数据库关键字，特殊字符的源码 </param>
        /// <returns>已经去除标记后的文字</returns>
        protected string NoHTML(string Htmlstring)
        {
            if (Htmlstring == null)
            {
                return "";
            }
            else
            {
                //删除脚本
                Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);
                //删除HTML
                Htmlstring = Regex.Replace(Htmlstring, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"([/r/n])[/s]+", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"<!--.*", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(nbsp|#160);", " ", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(iexcl|#161);", "/xa1", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(cent|#162);", "/xa2", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(pound|#163);", "/xa3", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(copy|#169);", "/xa9", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&#(/d+);", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "xp_cmdshell", "", RegexOptions.IgnoreCase);

                //删除与数据库相关的词
                Htmlstring = Regex.Replace(Htmlstring, "select", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "insert", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "delete from", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "count''", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "drop table", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "truncate", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "asc", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "mid", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "char", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "xp_cmdshell", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "exec master", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "net localgroup administrators", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, "and", "", RegexOptions.IgnoreCase);

                return Htmlstring;

            }

        }

 

    }
}