using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;
using System.Collections;

namespace YeuThietKeWeb.UIs
{
    public partial class NewsDetail : System.Web.UI.UserControl
    {
        #region Declare

        public clsFormat _clsFormat = new clsFormat();
        News_details ndetail = new News_details();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        SendMail send = new SendMail();

        string _sNewsSeoUrl = string.Empty;
        Attfile att = new Attfile();
        Product_Details pro_detail = new Product_Details();

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            Show_File_HTML();
            hplPrint.HRef = "/in/" + _sNews_Seo_Url + ".html";
            Get_ViewMore();
            Tinkhac();
            gettitle();
            BindRepeater();
            Rpfiledinhkem.DataSource = att.Load_att(_sNews_Seo_Url);
            Rpfiledinhkem.DataBind();

            if (_sNews_Seo_Url == "gioi-thieu")
                idFace.Visible = false;
        }
        #region My Function
        public void gettitle()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                lbNewsTitle.Text = ndetail.gettitle(_sCat_Seo_Url, _sNews_Seo_Url).Count > 0 ? ndetail.gettitle(_sCat_Seo_Url, _sNews_Seo_Url)[0].News_title : "";
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void Get_ViewMore()
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                hplViewmore.HRef = ndetail.Get_ViewMore(_newsID);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void Show_File_HTML()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                if (!string.IsNullOrEmpty(_sCat_Seo_Url))
                {
                    _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
                }
                liHtml.Text = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        public void Tinkhac()
        {
            try
            {
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = ndetail.Load_othernews(_sNews_Seo_Url);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        Rptinkhac.DataSource = _tinTucKhac;
                        Rptinkhac.DataBind();
                    }
                    else
                        dvOtherNews.Visible = false;
                }
                else dvOtherNews.Visible = false;
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }

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
        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
        }
        public string getUrlface()
        {
            return System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + Request.RawUrl;
        }
        #endregion

        #region Loadatt_file

        public IQueryable Loadfiledinhkem(object news_id)
        {
            try
            {
                int id = Utils.CIntDef(news_id);
                var list = att.Loadatt_file(id);
                return list.ToList().Count > 0 ? list : null;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string BindAttItems(object News_Id, object Ext_Id, object Att_Name, object Att_Url, object Att_File, object Ext_Image)
        {
            try
            {
                return att.BindAttItems(News_Id, Ext_Id, Att_Name, Att_Url, Att_File, Ext_Image);

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return "";
            }
        }
        #endregion


        #region Paging
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                {
                    return Convert.ToInt32(ViewState["PageNumber"]);
                }
                else
                {
                    return 0;
                }
            }
            set { ViewState["PageNumber"] = value; }
        }

        private void BindRepeater()
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = ndetail.Load_othernews(_sNews_Seo_Url);
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = 1;
            pgitems.CurrentPageIndex = PageNumber;
            
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }

            //Finally, set the datasource of the repeater
            Rptinkhac.DataSource = pgitems;
            Rptinkhac.DataBind();
        }

        //This method will fire when clicking on the page no link from the pager repeater
        protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            BindRepeater();
        }
        #endregion
    }
}