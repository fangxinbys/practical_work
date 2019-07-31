﻿using FineUIPro; 
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace Maticsoft.Web.Admin.LinkType 
{
    public partial class LinkTypeEdit : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
   
            if (!IsPostBack)
            {
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                Bind();
            }
        }

        private void Bind()
        {
            BindGrid();

            if (!String.IsNullOrEmpty(Request.QueryString["ArtGuid"]))
            {
                string ArtGuid = Request.QueryString["ArtGuid"];
          
                UpMenuModel(ArtGuid);
            }
     

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["ArtGuid"]))
            {
                Maticsoft.BLL.tLinkType BLL = new Maticsoft.BLL.tLinkType();
                int ArtGuid = int.Parse(Request.QueryString["ArtGuid"]);
                Maticsoft.Model.tLinkType menu = BLL.GetModel(ArtGuid);
                if (BLL.GetList(string.Format(" Name='{0}' and Id<>{1} ", txtName.Text, ArtGuid)).Tables[0].Rows.Count >= 1)
                {
                    Alert.ShowInTop("该分类名称已经存在！"); return ;
                }
                if (ddlfatherId.SelectedValue == menu.Id.ToString())
                {
                    Alert.ShowInTop("上级分类不可选择！"); return;
                }
                menu.Id = ArtGuid;
                menu.Name = txtName.Text.ToString().Trim(); 
                menu.FatherID = int.Parse(ddlfatherId.SelectedValue);
                menu.Sort = Convert.ToInt32(txtSort.Text.ToString().Trim());
       
                if (BLL.Update(menu) == true)
                {
                    PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
                }
                else
                {
                    Alert.ShowInTop("操作失败！");
                }
            }
            else
            {
                Maticsoft.BLL.tLinkType BLL = new Maticsoft.BLL.tLinkType();
                Maticsoft.Model.tLinkType menu = new Maticsoft.Model.tLinkType();
                if (BLL.GetList(string.Format(" Name='{0}' ", txtName.Text)).Tables[0].Rows.Count >= 1)
                {
                    Alert.ShowInTop("该分类名称已经存在！"); return;
                }
             
                menu.Name = txtName.Text.ToString().Trim();
                menu.FatherID = int.Parse(ddlfatherId.SelectedValue);
                menu.Sort = Convert.ToInt32(txtSort.Text.ToString().Trim());
          
                if (BLL.Add(menu)>=1)
                {
                    PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
                }
                else
                {
                    Alert.ShowInTop("操作失败！");
                }
            }

        }
        /// <summary>
        /// 根据ArtGuid 来给控件赋值
        /// </summary>
        /// <param name="ArtGuid"></param>
        public void UpMenuModel(string ArtGuid)
        {
            Maticsoft.BLL.tLinkType BLL = new Maticsoft.BLL.tLinkType();
            Maticsoft.Model.tLinkType m = BLL.GetModel(int.Parse(ArtGuid));
          
            txtName.Text = m.Name;
            ddlfatherId.SelectedValue = m.FatherID.ToString(); 
            txtSort.Text = m.Sort.ToString();

        }
        #region BindGrid
        private void BindGrid()
        {
            Maticsoft.BLL.tLinkType BLL = new Maticsoft.BLL.tLinkType();
            DataTable table = BLL.GetList("  FatherID=0 order by Sort desc").Tables[0];
            ddlfatherId.DataTextField = "Name";
            ddlfatherId.DataValueField = "Id"; 
            ddlfatherId.DataSource = table;
            ddlfatherId.DataBind();
            ddlfatherId.Items.Insert(0,new FineUIPro.ListItem ("根目录","0"));
        }

        

        #endregion
    }
}