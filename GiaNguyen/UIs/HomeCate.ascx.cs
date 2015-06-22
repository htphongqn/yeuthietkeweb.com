using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace YeuThietKeWeb.UIs
{
    public partial class HomeCate : System.Web.UI.UserControl
    {
        #region Declare
        Config cf = new Config();
        Function fun = new Function();
        Controller.Home index = new Controller.Home();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Loadlist_news();
        }

        public void Loadlist_news()
        {
            var list = index.Load_cate_index_all(4);
            int count = 0;
            string str = "";
            count = list.Count;
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                {
                    string img = GetImageT(list[i].CAT_ID, list[i].CAT_IMAGE1);
                    string link = GetLink(list[i].CAT_URL, list[i].CAT_SEO_URL);
                    str += String.Format(@"<div class='item_fw'>
                        <div class='func_ct'> <span class='cate_icon'><img src='{0}' alt=''/></a></span>
                        <h2 class='col_title'><a href='{1}'>{2}</a></h2>
                        <p>{3}</p></div></div>"
                        , img, link, list[i].CAT_NAME, list[i].CAT_DESC);
                }
            }
            lblLoadNews.Text = str;
        }

        public string GetLink(object Cat_Url, object Cat_Seo_Url)
        {
            try
            {
                string temp = fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
                return temp;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string GetImageT(object News_Id, object News_Image1)
        {
            try
            {
                return fun.Getimages_Cat(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
    }
}