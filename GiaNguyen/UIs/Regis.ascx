<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Regis.ascx.cs" Inherits="YeuThietKeWeb.UIs.Regis" %>

<div class="inner_side">
    <div class="current_path">
    <div class="fr"><span class="breadcrum"><a href="/">Trang chủ</a><span class='spSeperator'></span> <a class='aLink1'>Đăng ký</a> </span>
        <h1 class="h1Title"> <span id="cphMain_ctl00_lbCatName">Đăng ký</span> </h1>
    </div>
    </div>
    <!--Regis Layout-->
    <!--Selected Template-->
    <div class="selected_skin fl">
        <div class="form_header" style="color: #FF0000">MẪU WEBSITE BẠN CHỌN</div>
        <asp:Repeater ID="Rpimg_small" runat="server">
            <ItemTemplate>
                <a href="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" class="zoom" rel="gallery1" id="cphMain_Linkimg">
                    <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" class="selected_skin_img" alt="" id="cphMain_Imgnews"></a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!--End Selected Template-->
    <!--Contact to register-->
    <div class="form form_regis fr">
        <div class="form_header">LIÊN HỆ QUA EMAIL</div>
        <div class="row_regis fl">
            <input type="text" class="inputbox_dk" id="Txtname" placeholder="Họ tên" runat="server">
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên"
                ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
        </div>
        <div class="row_regis fr"> 
            <img src="../vi-vn/CImage.aspx" alt="" />
            <input type="text" id="txtCapcha" class="inputbox_dk fr" placeholder="Mã bảo vệ" runat="server"/>
            <asp:RequiredFieldValidator ID="rfvCaptcha" runat="server" ErrorMessage="Chưa nhập mã an toàn"
                ControlToValidate="txtCapcha" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
        </div>
        <div class="row_regis fl">
            <input type="text" class="inputbox_dk" id="txtEmail" placeholder="Email" runat="server">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập email"
                ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
        </div>
        <div class="row_regis fr">
            <textarea rows="5" cols="25" class="fr" id="txtContent" runat="server" placeholder="Nội dung"></textarea>
            <asp:RequiredFieldValidator ID="rfvContent" runat="server" ErrorMessage="Chưa nhập nội dung"
                ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
        </div>
        <div class="row_regis fl">
            <input type="text" class="inputbox_dk" id="Txtaddress" placeholder="Địa chỉ" runat="server">
        </div>
        <div class="row_regis fl">
            <input type="text" class="inputbox_dk" id="Txtphone" placeholder="Điện thoại/Điện thoại di động" runat="server">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại"
                ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
        </div>
        <div class="row_regis fr"> 
            <asp:LinkButton ID="Lbthanhtoan" runat="server" class="btn_web send_cmt" OnClick="Lbthanhtoan_Click"
                ValidationGroup="G40">Gửi</asp:LinkButton>
            <a class="btn_web send_cmt reset" onclick="reset();" href="javascript:void(0)">Xóa</a> 
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
    <!--End Contact to register-->
    <!--End Regis Layout-->
</div>
<script type="text/javascript">
    function reset() {
        var name = document.getElementById("<%= Txtname.ClientID %>");
        var email = document.getElementById("<%= txtEmail.ClientID %>");
        var add = document.getElementById("<%= Txtaddress.ClientID %>");
        var desc = document.getElementById("<%= txtContent.ClientID %>");
        var phone = document.getElementById("<%= Txtphone.ClientID %>");
        var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
        name.value = email.value = add.value = desc.value = phone.value = title.value = capcha.value = "";
    }
    </script>