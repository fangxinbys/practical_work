using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maticsoft.Web.control
{
    public partial class footer : System.Web.UI.UserControl
    {

        protected Maticsoft.Model.tSet model = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Maticsoft.BLL.tSet bll = new Maticsoft.BLL.tSet();
                model = bll.GetModel(1);

            }
        }
    }
}