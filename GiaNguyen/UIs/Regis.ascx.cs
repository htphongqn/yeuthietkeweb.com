using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GiaNguyen.Components;
using Controller;
using vpro.functions;

namespace YeuThietKeWeb.UIs
{
    public partial class Regis : System.Web.UI.UserControl
    {
        #region Declare
        Config cf = new Config();
        SendMail sm = new SendMail();
        Function fun = new Function();
        Product_Details pro_detail = new Product_Details();
        string idTemp = "";
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            idTemp = Request.QueryString["id"];
            if (idTemp == "" || idTemp == null) { Response.Redirect("/"); }
            Loadimgbig(ref Rpimg_small);
        }

        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            try
            {

                if (this.txtCapcha.Value != this.Session["CaptchaImageText"].ToString())
                {
                    string strScript = "<script>";
                    strScript += "alert(' Mã bảo vệ không đúng!');";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {

                    string _sEmailCC = string.Empty;
                    string _sEmail = txtEmail.Value;
                    string _sName = Txtname.Value;
                    string _add = Txtaddress.Value;
                    string _phone = Txtphone.Value;
                    string _content = txtContent.Value;
                    string _title = "";
                    cf.Insert_regis(_sName, _sEmail, _title, _content, _add, _phone, idTemp);
                    string _mailBody = string.Empty;
                    _mailBody += "<br/><strong>Mã giao diện</strong>: " + idTemp;
                    _mailBody += "<br/><br/><strong>Họ và tên</strong>: " + _sName;
                    _mailBody += "<br/><br/><strong>Email</strong>: " + _sEmail;
                    _mailBody += "<br/><br/><strong>Số điện thoại</strong>: " + _phone;
                    _mailBody += "<br/><br/><strong>Địa chỉ</strong>: " + _add;
                    _mailBody += "<br/><br/><strong>Nội dung</strong>: " + _content + "<br/><br/>";
                    string _sMailBody = string.Empty;
                    _sMailBody += "Cám ơn quý khách: " + _sName + " đã đặt liên hệ với chúng tôi. Đây là email được gửi từ website của " + System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"] + " <br>" + _mailBody;
                    _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
                    sm.SendEmailSMTP("Thông báo: Bạn đã đặt mẫu website thành công", _sEmail, _sEmailCC, "", _sMailBody, true, false);
                    string strScript = "<script>";
                    strScript += "alert(' Đã gửi thành công!');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        #region Img
        public void Loadimgbig(ref Repeater rp)
        {
            try
            {
                int _id = Utils.CIntDef(idTemp);
                var list = pro_detail.Load_albumimgbyId(_id).ToList();
                if (list.Count > 0)
                {
                    rp.DataSource = list;
                    rp.DataBind();
                }
                else { Response.Redirect("/"); }
            }
            catch (Exception)
            {
                Response.Redirect("/");
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
        #endregion
    }
}