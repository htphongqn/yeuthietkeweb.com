<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeAdvisory.ascx.cs" Inherits="YeuThietKeWeb.UIs.HomeAdvisory" %>


<h2 class="box_Tab"><span class="font1">Yêu cầu tư vấn</span></h2>
<div class="box_ct">
<!--Form Advisory-->
<div class="form_contact">
<p align="center"> (Quý khách điền đầy đủ thông tin, chúng tôi sẽ tư vấn miễn phí cho quý khách)</p>
<div class="row_contact">
    <label class="left_row"> Lĩnh vực:<span class="required">*</span></label>
    <div class="right_row">
        <asp:DropDownList ID="ddlLinhVuc" runat="server" class="type_option">
            <asp:ListItem Value="0" Text="-----Chọn lĩnh vực-----"></asp:ListItem>
            <asp:ListItem Value="1" Text="Dịch vụ thiết kế web"></asp:ListItem>
            <asp:ListItem Value="2" Text="Phần mềm quản lý"></asp:ListItem>
            <asp:ListItem Value="3" Text="Đăng ký tên miền (domain)"></asp:ListItem>
            <asp:ListItem Value="4" Text="Đăng ký chỗ đặt web (hosting)"></asp:ListItem>
            <asp:ListItem Value="5" Text="SEO – SEM – Email maketing"></asp:ListItem>
            <asp:ListItem Value="6" Text="Quảng cáo google Adwords"></asp:ListItem>
            <asp:ListItem Value="7" Text="Gian hàng thương mại điện tử"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa chọn lĩnh vực" InitialValue="0"
            ControlToValidate="ddlLinhVuc" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_contact">
    <label class="left_row"> Họ tên:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" class="inputbox" id="Txtname" runat="server">
        <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên"
            ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
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
    <label class="left_row"> Địa chỉ:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" class="inputbox" id="Txtaddress" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập địa chỉ"
            ControlToValidate="Txtaddress" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_contact">
    <label class="left_row"> Phone:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" class="inputbox" id="Txtphone" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập số điện thoại"
            ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_contact">
    <label class="left_row"> Tiêu đề:<span class="required">*</span></label>
    <div class="right_row">
        <input type="text" class="inputbox" id="txttitle" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập tiêu đề"
            ControlToValidate="txttitle" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_contact">
    <label class="left_row"> Nội dung:<span class="required">*</span></label>
    <div class="right_row">
        <textarea rows="5" cols="25" id="txtContent" runat="server"></textarea>
        <asp:RequiredFieldValidator ID="rfvContent" runat="server" ErrorMessage="Chưa nhập nội dung"
            ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_contact">
    <label class="left_row"> Nhập mã:<span class="required">*</span></label>
    <div class="right_row"> 
        <img id="cphMain_vi1_vi1_Image1" src="../vi-vn/CImage.aspx" style="width:180px; height: 35px; margin-left: 5%" /> <br />
        <input type="text" id="txtCapcha" class="inputbox" style="margin-top:5px;" runat="server"/>
        <asp:RequiredFieldValidator ID="rfvCaptcha" runat="server" ErrorMessage="Chưa nhập mã an toàn"
            ControlToValidate="txtCapcha" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_contact" id="send_btn">
    <label class="left_row">&nbsp;</label>
    <div class="right_row">
        <asp:LinkButton ID="Lbthanhtoan" runat="server" class="btn_web send_cmt" OnClick="Lbthanhtoan_Click"
            ValidationGroup="G40">Gửi</asp:LinkButton>
        <a class="btn_web send_cmt" onclick="reset();" href="javascript:void(0)">Xóa</a>
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
<!--end Form Advisory-->
</div>

<script type="text/javascript">
function reset() {
    var name = document.getElementById("<%= Txtname.ClientID %>");
    var email = document.getElementById("<%= txtEmail.ClientID %>");
    var add = document.getElementById("<%= Txtaddress.ClientID %>");
    var desc = document.getElementById("<%= txtContent.ClientID %>");
    var phone = document.getElementById("<%= Txtphone.ClientID %>");
    var title = document.getElementById("<%= txttitle.ClientID %>");
    var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
    name.value = email.value = add.value = desc.value = phone.value = title.value = capcha.value = "";
}
</script>
