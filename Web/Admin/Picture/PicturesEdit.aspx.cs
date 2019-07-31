using FineUIPro;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.Picture
{
    public partial class PicturesEdit: PageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                BindGrid();

                if (!String.IsNullOrEmpty(Request.QueryString["tyId"]))
                {
                    ddlfatherId.SelectedValue = Request.QueryString["tyId"];
                    ddlfatherId.Enabled = false;
                }
                if (!String.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    ddlfatherId.Enabled = true;
                    Maticsoft.BLL.tPicture bll = new Maticsoft.BLL.tPicture();
                    Maticsoft.Model.tPicture model = bll.GetModel(int.Parse(Request.QueryString["Id"]));

                    txtTile.Text = model.Name;
                    txtRemark.Text = model.Remark;

                    ddlfatherId.SelectedValue = model.PicTyID.ToString();
                    txtSort.Text = model.Sort.ToString();
                    hfEditorInitValue.Text = "<img src=" + "'" + model.Code + "'" + "/>";

                }
            }
        }
        private void BindGrid()
        {
            Maticsoft.BLL.tPictureType bll = new Maticsoft.BLL.tPictureType();
            DataSet ds = bll.GetList("");
            ds.Relations.Add("TreeRelation", ds.Tables[0].Columns["Id"], ds.Tables[0].Columns["FatherId"], false);
            ddlfatherId.Items.Clear();
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (row["FatherId"].ToString() == "0")
                {

                    FineUIPro.ListItem it = new FineUIPro.ListItem();
                    it.Text = row["Name"].ToString();
                    it.Value = row["Id"].ToString();
                    it.SimulateTreeLevel = 1;
                    if (row.GetChildRows("TreeRelation").Length <= 0)
                    {
                        it.EnableSelect = true;
                    }
                    else
                    {
                        it.EnableSelect = false;
                    }
                    ddlfatherId.Items.Add(it);
                    ResolveSubTree(row, ddlfatherId);
                }

            }

        }


        private void ResolveSubTree(DataRow dataRow, FineUIPro.DropDownList drp)
        {
            DataRow[] rows = dataRow.GetChildRows("TreeRelation");
            if (rows.Length > 0)
            {

                foreach (DataRow row in rows)
                {
                    FineUIPro.ListItem it = new FineUIPro.ListItem();
                    it.Text = row["Name"].ToString();
                    it.Value = row["Id"].ToString();
                    it.SimulateTreeLevel = 2;
                    drp.Items.Add(it);
                    ResolveSubTree(row, ddlfatherId);
                }
            }
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Maticsoft.BLL.tPicture bll = new Maticsoft.BLL.tPicture();

            string content = Request.Form["editor1"] == null ? "" : Request.Form["editor1"];
            if (string.IsNullOrEmpty(content))
            {
                Alert.ShowInTop("图片为空！"); return;
            }
            string[] picList = GetHtmlImageUrlList(content);
            if (picList.Length <= 0)
            {
                Alert.ShowInTop("图片为空！"); return;
            }


            if (!String.IsNullOrEmpty(Request.QueryString["tyId"]))
            {
                int k = 0;
                for (int i = 0; i < picList.Length; i++)
                {
                    Maticsoft.Model.tPicture model = new Maticsoft.Model.tPicture();
                    model.Code = picList[i];
                    model.Name = txtTile.Text;
                    model.Remark = txtRemark.Text;
                    model.ImageUrl = txtUrl.Text;
                    model.PicTyID = int.Parse(ddlfatherId.SelectedValue);
                    model.Sort = int.Parse(txtSort.Text);

                    if (bll.Add(model) > 0)
                    {
                        k++;
                    }
                }
                if (k > 0)
                {
                    PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
                }
                else
                {
                    Alert.ShowInTop("添加失败！"); return;
                }
            }
            if (!String.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                if (picList.Length > 1)
                {
                    Alert.ShowInTop("请上传一张图片！"); return;
                }
                Maticsoft.Model.tPicture model = bll.GetModel(int.Parse(Request.QueryString["Id"]));
                if (picList[0] != model.Code)
                {
                    string directoryPath = Server.MapPath(model.Code);
                    File.Delete(directoryPath);
                }
                model.Code = picList[0];
                model.Name = txtTile.Text;
                model.Remark = txtRemark.Text;
                model.ImageUrl = txtUrl.Text;
                model.PicTyID = int.Parse(ddlfatherId.SelectedValue);
                model.Sort = int.Parse(txtSort.Text);
                bll.Update(model);
                PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
            }
        }
    }
}