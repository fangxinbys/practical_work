using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maticsoft.Web
{
    public partial class join : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        protected void btn_Click(object sender, EventArgs e)
        {
            if (txt_name.Text.Trim() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('客户名称不能为空！');</script>");
                txt_name.Focus();
                return;
            }
            if (txt_peo.Text.Trim() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('联系人不能为空！');</script>");
                txt_peo.Focus();
                return;
            }
            if (txt_phone.Text.Trim() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('联系电话不能为空！');</script>");
                txt_phone.Focus();
                return;
            }

            BLL.tReg bll = new BLL.tReg();
            List<Model.tReg> userList = bll.GetModelList(" tIp='" + Request.UserHostAddress + "'  order by Id desc ");
           
            Model.tReg tReg = userList.Count == 0 ? null : userList[0];
            DateTime dt = DateTime.Now;
            if (tReg != null)
            {
                if ((dt - (DateTime)tReg.tTime).Hours<1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('一个小时内不能重复注册！');</script>"); 
                    return;
                }
            }
            Model.tReg tRegNew = new Model.tReg();

            tRegNew.tName = NoHTML(txt_name.Text);
            tRegNew.tAdress= NoHTML(txt_address.Text);
            tRegNew.tCode = NoHTML(txt_code.Text);
            tRegNew.tMoney= NoHTML(txt_money.Text);
            tRegNew.tType = NoHTML(txt_type.Text);
            tRegNew.tPeo = NoHTML(txt_peo.Text);
            tRegNew.tEm = NoHTML(txt_em.Text);
            tRegNew.tPhone = NoHTML(txt_phone.Text);
            tRegNew.tIp= NoHTML(Request.UserHostAddress);
            tRegNew.tTime = dt;
            if (bll.Add(tRegNew) > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('提交成功，请耐心等待！');</script>");
                txt_name.Text = "";
                txt_address.Text = "";
                txt_code.Text = "";
                txt_money.Text = "";
                txt_type.Text = "";
                txt_peo.Text = "";
                txt_em.Text = "";
                txt_phone.Text = "";
                return;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('提交失败，请直接拨打电话联系！');</script>");
                return;
            }
        }
    }
}