using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace YeuThietKeWeb.vi_vn
{
    public partial class Templates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlHead header = base.Header;
            header.Title = "Kho giao diện";
        }
    }
}