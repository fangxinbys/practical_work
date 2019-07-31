using FineUIPro;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.Link
{
    public partial class LinkEdit : PageBase
    {
        BLL.tLink BLL = new BLL.tLink();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                BindGrid();
                if (!string.IsNullOrEmpty(Request.QueryString["roleId"]))
                {
                    string roleId = Request.QueryString["roleId"];
                   
                    LoadData(roleId);
                }


            }
        }
        private void BindGrid()
        {
            Maticsoft.BLL.tLinkType bll = new Maticsoft.BLL.tLinkType();
            DataSet ds = bll.GetList("");
         
            ddlfatherId.DataTextField = "Name";
            ddlfatherId.DataValueField = "Id";
            ddlfatherId.DataSource = ds;
            ddlfatherId.DataBind();

        }


        
        protected void LoadData(string roleId)
        {

            Model.tLink m = BLL.GetModel(Convert.ToInt32(roleId));
            if (m == null)
            {
                Alert.ShowInTop("出错了！"); return;

            }
            hfEditorInitValue.Text = "<img src=" + "'" + m.Code + "'" + "/>";
            txtName.Text = m.Name;
            txtUrl.Text = m.Url;
            txtSort.Text = m.Sort.ToString();
            ddlfatherId.SelectedValue = m.TyID.ToString();
 
        }

        /// <summary>   
        /// 取得HTML中所有图片的 URL。   
        /// </summary>   
        /// <param name="sHtmlText">HTML代码</param>   
        /// <returns>图片的URL列表</returns>   
        public static string[] GetHtmlImageUrlList(string sHtmlText)
        {
            // 定义正则表达式用来匹配 img 标签   
            Regex regImg = new Regex(@"<img\b[^<>]*?\bsrc[\s\t\r\n]*=[\s\t\r\n]*[""']?[\s\t\r\n]*(?<imgUrl>[^\s\t\r\n""'<>]*)[^<>]*?/?[\s\t\r\n]*>", RegexOptions.IgnoreCase);

            // 搜索匹配的字符串   
            MatchCollection matches = regImg.Matches(sHtmlText);
            int i = 0;
            string[] sUrlList = new string[matches.Count];

            // 取得匹配项列表   
            foreach (Match match in matches)
                sUrlList[i++] = match.Groups["imgUrl"].Value;
            return sUrlList;
        } 

        protected void btnSaveClose_Click(object sender, EventArgs e)
        {
            string content = Request.Form["editor1"] == null ? "" : Request.Form["editor1"];
            //if (string.IsNullOrEmpty(content))
            //{
            //    Alert.ShowInTop("图片为空！"); return;
            //}
            string[] picList = GetHtmlImageUrlList(content);
            //if (picList.Length <= 0)
            //{
            //    Alert.ShowInTop("图片为空！"); return;
            //}
            if (picList.Length > 1)
            {
                Alert.ShowInTop("图片只能为1张！"); return;
            }
            if (!string.IsNullOrEmpty(Request.QueryString["roleId"]))
            {
                string roleId = Request.QueryString["roleId"];
                Model.tLink m = BLL.GetModel(Convert.ToInt32(roleId));
                if (m == null) return;
                m.Code = picList.Length<= 0 ? "" : picList[0];
                m.Name = txtName.Text.Trim();
                m.Url = txtUrl.Text.Trim();
                m.Sort = Convert.ToInt32(txtSort.Text);
                m.TyID = Convert.ToInt32(ddlfatherId.SelectedValue);
                 

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
                Model.tLink m = new Model.tLink();
                m.Name = txtName.Text.Trim();
                m.Url = txtUrl.Text.Trim();
                m.Sort = Convert.ToInt32(txtSort.Text);
                m.TyID = Convert.ToInt32(ddlfatherId.SelectedValue);
                m.Code = picList.Length <= 0 ? "" : picList[0];

           
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