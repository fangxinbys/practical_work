using FineUIPro;
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;
 

namespace Maticsoft.Web.Admin.SinglePage
{
    public partial class SingleMsg :PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
   
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {

                    Maticsoft.BLL.tAbout bll = new Maticsoft.BLL.tAbout();
                    Maticsoft.Model.tAbout model = bll.GetModel(int.Parse(Request.QueryString["Id"]));
                    if (model == null) return;
                    hfEditorInitValue.Text = model.AboutContent;
                    txtRemark.Text = model.Remark;
                    btnSave.Text = model.Title + "-" + "保存";
    
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] == null)
            {
                return;
            }
            string content = Request.Form["editor1"] == null ? "" : Request.Form["editor1"];
            Maticsoft.BLL.tAbout bll = new Maticsoft.BLL.tAbout();
            Maticsoft.Model.tAbout model = bll.GetModel(int.Parse(Request.QueryString["Id"]));
            if (model == null) return;
            model.AboutContent = content;
            model.Remark = txtRemark.Text;
            if (bll.Update(model))
            {
                Alert.ShowInTop("保存成功！");
            }
            else
            {
                Alert.ShowInTop("保存失败！");
            }
        }
    }
}