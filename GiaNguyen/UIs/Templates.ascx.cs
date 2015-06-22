using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;

namespace YeuThietKeWeb.UIs
{
    public partial class Templates : System.Web.UI.UserControl
    {
        #region Declare
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        Attfile att = new Attfile();
        Comment cm = new Comment();
        public clsFormat fm = new clsFormat();
        string _sNewsSeoUrl = string.Empty;
        public string comment_url = "";
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNewsSeoUrl = Utils.CStrDef(Request.QueryString["purl"]);
            if (!IsPostBack)
            {
                Loadimgbig(100, 0, ref Rpimg_small);
                Getlinkattfile();
            }
        }

        #region Loaddata
        public void Getlinkattfile()
        {
            int _newsID = Utils.CIntDef(Session["news_id"]);
            //   Hpattfile.NavigateUrl = pro_detail.Getnameattfile(_newsID);
        }
        public void Loadimgbig(int take, int skip, ref Repeater rp)
        {
            try
            {
                var getId = pro_detail.Load_Product_Detail("kho-giao-dien");
                if (getId.Count > 0)
                {
                    int id = getId[0].NEWS_ID;
                    //int _newsID = Utils.CIntDef(Session["news_id"]);
                    var list = pro_detail.Load_albumimg(id).Skip(skip).Take(take).ToList();
                    if (list.Count > 0)
                    {
                        rp.DataSource = list;
                        rp.DataBind();
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion
        #region function

        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageT(object News_Id, object News_Image1)
        {
            try
            {
                return fun.GetImageT_News1(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }

        public string getnamecate(object newsid)
        {
            try
            {
                return pro_detail.getnamecate(newsid);
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
    }
}