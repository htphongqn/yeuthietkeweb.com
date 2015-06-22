using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Controller;

namespace YeuThietKeWeb.UIs
{
    public partial class InfoContact : System.Web.UI.UserControl
    {
        Config cf = new Config();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show_File_HTML("contact-vi.htm");
                Show_File_Map();
            }
        }

        private void Show_File_HTML(string HtmlFile)
        {
            string pathFile;
            string strHTMLContent;
            pathFile = Server.MapPath("/Data/contact/" + HtmlFile);

            if ((File.Exists(pathFile)))
            {
                StreamReader objNewsReader;
                objNewsReader = new StreamReader(pathFile);
                strHTMLContent = objNewsReader.ReadToEnd();
                objNewsReader.Close();

                Literal1.Text = strHTMLContent;
            }
            else
                Literal1.Text = "";

        }
        private void Show_File_Map()
        {
            liLoadMap.Text = cf.Show_File_HTML("map-vi.htm", "/Data/contact/");
        }
    }
}