<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="YeuThietKeWeb.vi_vn.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../vi-vn/Styles/contact.css" rel="stylesheet" type="text/css" />
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="current_path">
    <div class="fr"> 
        <span class="breadcrum"><a href="/">Trang chủ</a><span class="spSeperator"></span> <a href="/lien-he.html">Liên hệ</a></span>
        <h1 id="cphMain_ctl00_htitle" class="h1Title"> <span id="cphMain_ctl00_lbCatName">Liên hệ</span> </h1>
    </div>
</div>
<!--Contact Us-->
<div class="nine columns" id="contactus">
    <div class="row_contact">
    <label class="left_row"> Họ tên:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" class="inputbox" id="Txtname" runat="server">
        <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên"
            ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
    </div>
    <div class="row_contact">
    <label class="left_row"> Công ty:</label>
    <div class="right_row">
        <input type="text" class="inputbox" id="txtCompany" runat="server">
    </div>
    </div>
    <div class="row_contact">
    <label class="left_row"> Địa chỉ:</label>
    <div class="right_row">
        <input type="text" class="inputbox" id="Txtaddress" runat="server">
    </div>
    </div>
    <div class="row_contact">
    <label class="left_row"> Điện thoại:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" class="inputbox" id="Txtphone" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại"
            ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
    </div>
    <div class="row_contact">
    <label class="left_row"> Email:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" class="inputbox" id="txtEmail" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập email"
            ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
    </div>
    <div class="row_contact">
    <label class="left_row"> Tiêu đề:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" class="inputbox" id="txttitle" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập tiêu đề"
            ControlToValidate="txttitle" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
    </div>
    <div class="row_contact">
    <label class="left_row"> Nội dung liên hệ:<span class="required">*</span></label>
    <div class="right_row">
        <textarea rows="8" cols="45" id="txtContent" runat="server"></textarea>
        <asp:RequiredFieldValidator ID="rfvContent" runat="server" ErrorMessage="Chưa nhập nội dung"
            ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
    </div>
    <div class="row_contact">
    <label class="left_row"> Mã an toàn:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" id="txtCapcha" class="inputbox" style="float: left; width: 160px;margin-right: 10px" runat="server"/>
        <asp:RequiredFieldValidator ID="rfvCaptcha" runat="server" ErrorMessage="Chưa nhập mã an toàn"
            ControlToValidate="txtCapcha" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
        <div class='left' style='background-color:White;width:160px;' >
            <img src="../vi-vn/CImage.aspx" border="0" alt="Captcha" width="160" height="35" />
        </div>
    </div>
    </div>
    <div class="row_contact">
    <label class="left_row">&nbsp;</label>
    <div class="right_row"> 
        <asp:LinkButton ID="Lbthanhtoan" runat="server" class="btn_web send_cmt" OnClick="Lbthanhtoan_Click"
            ValidationGroup="G40">Gửi</asp:LinkButton>
        <a class="btn_web send_cmt reset_cmt" onclick="reset();" href="javascript:void(0)">Nhập lại</a> 
    </div>
    </div>
    <div style="text-align: center">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="G40" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txtphone"
            ErrorMessage="Số điện thoại định dạng chưa đúng" SetFocusOnError="True" ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$"
            ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    </div>
</div>
<div class="seven columns">
    <div class="inner_side">
    <div class="contact_info fr">
        <div class="ct_inner">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <div class="cf">&nbsp;</div>
        </div>
    </div>
    <div class="contact_note fr">
        <div class="ct_inner"> <strong>Lưu ý:</strong><br>
        Thông tin quý khách cung cấp sẽ chỉ được dùng để liên hệ với quý khách và sẽ không
        được chia sẻ với một bên thứ ba nào khác mà không có sự đồng ý của quý khách. Vui
        lòng tham khảo <a style="color: #ff0000;" target="_blank" href="chinh-sach-bao-mat.html"> Chính sách bảo mật</a> của chúng tôi để biết thêm chi tiết.
        <p>&nbsp; </p>
        <p> Những ô có dấu (<span class="required">*</span>) là thông tin bắt buộc phải cung cấp.</p>
        </div>
    </div>
    </div>
</div>
<!--End Contact Us-->
    <script type="text/javascript">
        function reset() {
            var name = document.getElementById("<%= Txtname.ClientID %>");
            var email = document.getElementById("<%= txtEmail.ClientID %>");
            var add = document.getElementById("<%= Txtaddress.ClientID %>");
            var desc = document.getElementById("<%= txtContent.ClientID %>");
            var phone = document.getElementById("<%= Txtphone.ClientID %>");
            var title = document.getElementById("<%= txttitle.ClientID %>");
            var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
            var company = document.getElementById("<%= txtCompany.ClientID %>>")
            name.value = email.value = add.value = desc.value = phone.value = title.value = capcha.value = company.value = "";
        }
    </script>
</asp:Content>
