﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;

using System.Data;
using System.Web.UI.HtmlControls;
using vpro.eshop.cpanel.ucControls;
using System.IO;
using System.Net.Mail;

namespace vpro.eshop.cpanel.page
{
    public partial class page_video : System.Web.UI.Page
    {
        #region Declare

        int _count = 0;
        eshopdbDataContext DB = new eshopdbDataContext();
        private int m_mail_id = 0;
        #endregion

        #region properties

        public SortDirection sortProperty
        {
            get
            {
                if (ViewState["SortingState"] == null)
                {
                    ViewState["SortingState"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["SortingState"];
            }
            set
            {
                ViewState["SortingState"] = value;
            }
        }

        #endregion

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                m_mail_id = Utils.CIntDef(Request["MAIL_ID"]);
                ucHeader.HeaderLevel1 = "Video Trang chủ";
                ucHeader.HeaderLevel1_Url = "../page/page-video.aspx";
                ucHeader.HeaderLevel2 = "Danh sách";
                ucHeader.HeaderLevel2_Url = "../page/page-video.aspx";

                SearchResult();

                txtKeyword.Attributes.Add("onKeyPress", Common.getSubmitScript(lbtSearch.ClientID));
            }

        }

        #endregion
        private void SearchResult()
        {
            try
            {
                string keyword = txtKeyword.Value;

                var AllList = (from g in DB.Products
                               where "" == keyword || g.product_name.Contains(keyword)
                               orderby g.product_id descending
                               select g);


                if (AllList.ToList().Count > 0)
                    Session["NewsList"] = DataUtil.LINQToDataTable(AllList);

                GridItemList.DataSource = AllList;
                if (AllList.ToList().Count > GridItemList.PageSize)
                    GridItemList.AllowPaging = true;
                else
                    GridItemList.AllowPaging = false;
                GridItemList.DataBind();


            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string getOrder()
        {
            _count = _count + 1;
            return _count.ToString();
        }

        private void EventDelete(DataGridCommandEventArgs e)
        {
            try
            {
                int NewsId = Utils.CIntDef(GridItemList.DataKeys[e.Item.ItemIndex]);

                var g_delete = DB.Products.Where(n => n.product_id == NewsId);

                DB.Products.DeleteAllOnSubmit(g_delete);
                DB.SubmitChanges();

                //delete folder
                string fullpath = Server.MapPath(PathFiles.GetPathNews(NewsId));
                if (Directory.Exists(fullpath))
                {
                    DeleteAllFilesInFolder(fullpath);
                    Directory.Delete(fullpath);
                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                Response.Redirect("page-video.aspx");
            }
        }
        private void DeleteAllFilesInFolder(string folderpath)
        {
            foreach (var f in System.IO.Directory.GetFiles(folderpath))
                System.IO.File.Delete(f);
        }
        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            SearchResult();
        }


        private void DeleteInfo()
        {
            int i = 0;
            int j = 0;
            HtmlInputCheckBox check = new HtmlInputCheckBox();
            int[] items = new int[GridItemList.Items.Count];

            try
            {
                foreach (DataGridItem item in GridItemList.Items)
                {
                    check = new HtmlInputCheckBox();
                    check = (HtmlInputCheckBox)item.Cells[1].FindControl("chkSelect");

                    if (check.Checked)
                    {
                        items[j] = Utils.CIntDef(GridItemList.DataKeys[i]);
                        j++;
                    }

                    i++;
                }

                //delete 
                var g_delete = DB.GetTable<Product>().Where(g => items.Contains(g.product_id));

                DB.Products.DeleteAllOnSubmit(g_delete);
                DB.SubmitChanges();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                items = null;
                SearchResult();
            }

        }
        #region Grid Events

        protected void GridItemList_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            string sortingDirection = string.Empty;
            if (sortProperty == SortDirection.Ascending)
            {
                sortProperty = SortDirection.Descending;
                sortingDirection = "Desc";
            }
            else
            {
                sortProperty = SortDirection.Ascending;
                sortingDirection = "Asc";
            }

            DataTable dataTable = Session["NewsList"] as DataTable;
            DataView sortedView = new DataView(dataTable);
            sortedView.Sort = e.SortExpression + " " + sortingDirection;
            GridItemList.DataSource = sortedView;
            GridItemList.DataBind();
        }

        //protected void GridItemList_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        //{
        //    GridItemList.CurrentPageIndex = e.NewPageIndex;
        //    _count = (Utils.CIntDef(GridItemList.CurrentPageIndex, 0) * GridItemList.PageSize);
        //    GridItemList.DataSource = Session["NewsList"] as DataTable;
        //    GridItemList.DataBind();
        //}

        protected void GridItemList_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (((LinkButton)e.CommandSource).CommandName == "Delete")
            {
                EventDelete(e);
            }
        }

        protected void GridItemList_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if ((((e.Item.ItemType == ListItemType.Item) | (e.Item.ItemType == ListItemType.AlternatingItem)) | (e.Item.ItemType == ListItemType.SelectedItem)))
            {
                e.Item.Cells[3].Attributes.Add("onClick", "return confirm('Bạn có chắc chắn Delete?');");
            }

        }

        #endregion

        protected void GridItemList_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            GridItemList.CurrentPageIndex = e.NewPageIndex;
            _count = (Utils.CIntDef(GridItemList.CurrentPageIndex, 0) * GridItemList.PageSize);
            GridItemList.DataSource = Session["NewsList"] as DataTable;
            GridItemList.DataBind();
        }

        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            DeleteInfo();
        }

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            Product pro = new Product();
            pro.product_name = txtvideo.Value;
            pro.category_id = 1;
            DB.Products.InsertOnSubmit(pro);
            DB.SubmitChanges();
            SearchResult();
            txtvideo.Value = "";
        }
    }
}