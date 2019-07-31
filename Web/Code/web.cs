using FineUIPro;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Maticsoft.Web.Code
{
    public class web
    {
        public string GetPic(int tid, int top)
        {
            Maticsoft.BLL.tPicture BLL = new Maticsoft.BLL.tPicture();
            DataTable dt = BLL.GetListByPage(" PicTyID=" + tid, " Sort desc,Id desc ", 0, top).Tables[0];
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                sb.Append("<img src=" + dt.Rows[i]["Code"].ToString().Replace("~/", "../") + " />");

            }

            return sb.ToString();
        }
        public Maticsoft.Model.tAbout About(int id)
        {
            Maticsoft.BLL.tAbout BLL = new Maticsoft.BLL.tAbout();
            Maticsoft.Model.tAbout model = BLL.GetModel(id);
            model.Click = (model.Click + 1);
            BLL.Update(model);
            return model;

        }
        public DataTable GetArtByTid(int tid, int top)
        {
            Maticsoft.BLL.tArticle BLL = new Maticsoft.BLL.tArticle();
            DataTable dt = BLL.GetListByPage(" IsEnable=1 and ArtTyID=" + tid, " Sort desc,UpdateTime desc ", 0, top).Tables[0];
            return dt;
        }
        public void SetWebHeader(Page page)
        {
            Maticsoft.BLL.tSet bll = new Maticsoft.BLL.tSet();
            Maticsoft.Model.tSet model = bll.GetModel(1);
            HtmlMeta keywords = new HtmlMeta();
            keywords.Name = "keywords";
            keywords.Content = model.KeyWords;
            page.Header.Controls.Add(keywords);
            HtmlMeta description = new HtmlMeta();
            description.Name = "description";
            description.Content = model.Description;
            page.Header.Controls.Add(description);
        }


        public void AddStyle(Page page, int index)
        {
            Literal li = new Literal();

            li.Text = "<style type=\"text/css\"> </style>";
            page.Header.Controls.AddAt(index, li);
        }

        public string GetLink(int tid, int top)
        {

            Maticsoft.BLL.tLink BLL = new Maticsoft.BLL.tLink();
            DataTable dt = BLL.GetListByPage(" TyID=" + tid, " id desc,Sort desc ", 0, top).Tables[0];
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sb.Append(" <a href='" + dt.Rows[i]["Url"] + "' target='_blank' title='" + dt.Rows[i]["Name"] + "' > " + dt.Rows[i]["Name"] + "</a> ");

            }
            return sb.ToString();
        }



 

 

    }
}