using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace YeuThietKeWeb.UIs
{
    public partial class Support : System.Web.UI.UserControl
    {
        Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Loadhotline(); }
        }

        #region Hotline
        public void Loadhotline()
        {
            var list = per.Load_support().ToList();
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].ONLINE_TYPE == 0)
                {
                    lblSupport.Text += "<p class='nick_chat'><a href='ymsgr:sendim?" + list[i].ONLINE_NICKNAME + "' title='Mr. Mỹ'><img src='http://opi.yahoo.com/online?u=" + list[i].ONLINE_NICKNAME + "&m=g&t=2' width='114px' height='20px'/></a></p>";
                }
                if (list[i].ONLINE_TYPE == 1)
                {
                    lblSupport.Text += "<p class='nick_chat'><a href='skype:" + list[i].ONLINE_NICKNAME + "?chat' title=''><img src='/vi-vn/Images/skype_status.png' title=''  alt='' ></a></p>";
                }
                if (list[i].ONLINE_TYPE == 2)
                {
                    lblHotline.Text += "<p class='phone-contact'><b>" + list[i].ONLINE_NICKNAME + "</b></p>";
                }
            }
        }
        #endregion
    }
}