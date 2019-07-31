using FineUIPro;
 
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.Articles 
{
    public partial class ArticlesEdit : PageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                BindGrid();
                Calendar1.SelectedDate = DateTime.Now;
                if (!String.IsNullOrEmpty(Request.QueryString["tyId"]))
                {
                    ddlfatherId.SelectedValue = Request.QueryString["tyId"];
                    ddlfatherId.Enabled = false;
                }
                if (!String.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    ddlfatherId.Enabled = true;
                    Maticsoft.BLL.tArticle bll = new Maticsoft.BLL.tArticle();
                    Maticsoft.Model.tArticle model = bll.GetModel(int.Parse(Request.QueryString["Id"]));
                    imgPhoto.ImageUrl = model.FengMian;
                    txtTile.Text = model.Title;
                    txtRemark.Text = model.Remark;
                    txtEdit.Text = model.Editor;
                    Calendar1.SelectedDate = model.UpdateTime;
                    ddlfatherId.SelectedValue = model.ArtTyID.ToString();
                    txtSort.Text = model.Sort.ToString();
                    hfEditorInitValue.Text = model.ArticleContent;
                }
            }
        }
        private void BindGrid()
        {
            Maticsoft.BLL.tArticleType bll = new Maticsoft.BLL.tArticleType();
            DataSet ds = bll.GetList(" IsEnable=1");
            ds.Relations.Add("TreeRelation", ds.Tables[0].Columns["Id"], ds.Tables[0].Columns["FatherID"], false);
            ddlfatherId.Items.Clear();
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (row["FatherID"].ToString() == "0")
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

        protected void filePhoto_FileSelected(object sender, EventArgs e)
        {
            if (filePhoto.HasFile)
            {
                string fileName = filePhoto.ShortFileName;
                string type = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();    //获取文件类型  
                if (type == "jpg" || type == "gif" || type == "bmp" || type == "png")
                {

                    fileName = DateTime.Now.Ticks.ToString() + "." + type;

                    filePhoto.SaveAs(Server.MapPath("~/upload/" + fileName));

                    imgPhoto.ImageUrl = "~/upload/" + fileName;
                    filePhoto.Reset();
                }


                else
                {
                    Alert.ShowInTop("无效的文件类型！");
                    return;
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Maticsoft.BLL.tArticle bll = new Maticsoft.BLL.tArticle();
            if (imgPhoto.ImageUrl == "")
            {
                filePhoto.MarkInvalid("请先上传封面图片！");

                Alert.ShowInTop("请先上传封面图片！");
                return;
            }
            if (Calendar1.SelectedDate == null)
            {
                Calendar1.SelectedDate = DateTime.Now;
            }
            string content = Request.Form["editor1"] == null ? "" : Request.Form["editor1"];
            if (!String.IsNullOrEmpty(Request.QueryString["tyId"]))
            {
                Maticsoft.Model.tArticle model = new Maticsoft.Model.tArticle();
                model.FengMian = imgPhoto.ImageUrl;
                model.Title = txtTile.Text;
                model.Remark = txtRemark.Text;
                model.Editor = txtEdit.Text;
                model.UpdateTime = Calendar1.SelectedDate;
                model.ArtTyID = int.Parse(ddlfatherId.SelectedValue);
                model.Sort = int.Parse(txtSort.Text);
                model.ArticleContent = content;
                model.IsEnable = 1;
                int k = bll.Add(model);



                if (k > 0)
                {
                    PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
                }

            }
            if (!String.IsNullOrEmpty(Request.QueryString["Id"]))
            {

                Maticsoft.Model.tArticle model = bll.GetModel(int.Parse(Request.QueryString["Id"]));
                if (imgPhoto.ImageUrl != model.FengMian)
                {
                    if (!string.IsNullOrEmpty(model.FengMian) && (model.FengMian != "../../upload/blank.png"))
                    {
                        string directoryPath = Server.MapPath(model.FengMian);
                        File.Delete(directoryPath);
                        //删除掉原来的图片
                    }
                }
                model.FengMian = imgPhoto.ImageUrl;
                model.Title = txtTile.Text;
                model.Remark = txtRemark.Text;
                model.Editor = txtEdit.Text;
                model.UpdateTime = Calendar1.SelectedDate;
                model.ArtTyID = int.Parse(ddlfatherId.SelectedValue);
                model.Sort = int.Parse(txtSort.Text);
                model.ArticleContent = content;
                model.IsEnable = 1;
                bll.Update(model);
                PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
            }
        }
    }
}