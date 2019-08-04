using Maticsoft.Web.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Maticsoft.Web.control
{
    public partial class contract : System.Web.UI.UserControl
    {
        web web = new web();
        protected Maticsoft.Model.tSet model = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Maticsoft.BLL.tSet bll = new Maticsoft.BLL.tSet();
                model = bll.GetModel(1);
                HtmlMeta keywords = new HtmlMeta();
                keywords.Name = "keywords";
                keywords.Content = model.KeyWords;
                this.Page.Header.Controls.Add(keywords);
                HtmlMeta description = new HtmlMeta();
                description.Name = "description";
                description.Content = model.Description;
                this.Page.Header.Controls.Add(description);
            }
        }
    }
}