﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLeftmenu.ascx.cs"
    Inherits="vpro.eshop.cpanel.ucControls.ucLeftmenu" %>
<script type="text/javascript">

    /***********************************************
    * Switch Menu script- by Martial B of http://getElementById.com/
    * Modified by Dynamic Drive for format & NS4/IE4 compatibility
    * Visit http://www.dynamicdrive.com/ for full source code
    ***********************************************/

    var persistmenu = "yes" //"yes" or "no". Make sure each SPAN content contains an incrementing ID starting at 1 (id="sub1", id="sub2", etc)
    var persisttype = "sitewide" //enter "sitewide" for menu to persist across site, "local" for this page only

    if (document.getElementById) { //DynamicDrive.com change
        document.write('<style type="text/css">\n')
        document.write('.submenu{display: none;}\n')
        document.write('</style>\n')
    }

    function SwitchMenu(obj) {
        if (document.getElementById) {
            var el = document.getElementById(obj);
            var ar = document.getElementById("masterdiv").getElementsByTagName("span"); //DynamicDrive.com change
            if (el.style.display != "block") { //DynamicDrive.com change
                for (var i = 0; i < ar.length; i++) {
                    if (ar[i].className == "submenu") //DynamicDrive.com change
                        ar[i].style.display = "none";
                }
                el.style.display = "block";
            } else {
                el.style.display = "none";
            }
        }
    }

    function get_cookie(Name) {
        var search = Name + "="
        var returnvalue = "";
        if (document.cookie.length > 0) {
            offset = document.cookie.indexOf(search)
            if (offset != -1) {
                offset += search.length
                end = document.cookie.indexOf(";", offset);
                if (end == -1) end = document.cookie.length;
                returnvalue = unescape(document.cookie.substring(offset, end))
            }
        }
        return returnvalue;
    }

    function onloadfunction() {
        if (persistmenu == "yes") {
            var cookiename = (persisttype == "sitewide") ? "switchmenu" : window.location.pathname
            var cookievalue = get_cookie(cookiename)
            if (cookievalue != "")
                document.getElementById(cookievalue).style.display = "block"
        }
    }

    function savemenustate() {
        var inc = 1, blockid = ""
        while (document.getElementById("sub" + inc)) {
            if (document.getElementById("sub" + inc).style.display == "block") {
                blockid = "sub" + inc
                break
            }
            inc++
        }
        var cookiename = (persisttype == "sitewide") ? "switchmenu" : window.location.pathname
        var cookievalue = (persisttype == "sitewide") ? blockid + ";path=/" : blockid
        document.cookie = cookiename + "=" + cookievalue
    }

    if (window.addEventListener)
        window.addEventListener("load", onloadfunction, false)
    else if (window.attachEvent)
        window.attachEvent("onload", onloadfunction)
    else if (document.getElementById)
        window.onload = onloadfunction

    if (persistmenu == "yes" && document.getElementById)
        window.onunload = savemenustate

</script>
<div id="contentpr_menu">
<!-- Keep all menus within masterdiv-->
<div id="masterdiv">
    <div class="menuleftMain">
    <div class="menutitleMain">
        <img src="../Images/Button_Admin/my_projects_folder.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Thông tin tài khoản</div>
	<span class="submenuMain">
        <i class="iinfo"></i>Xin chào <a href="../page/user_changepass.aspx"><asp:Label runat="server" ID="lblUser" EnableViewState="false" ForeColor="#000099"></asp:Label></a><br />
        <i class="ipass"></i><a href="../page/user_changepass.aspx">Thay đổi mật khẩu</a><br />
        <i class="ihome"></i><a href="default.aspx">Trang chủ</a><br />
        <i class="iout"></i><a href="logout.aspx">Thoát</a><br />
	</span>
    </div>

	<div class="menutitle" onclick="SwitchMenu('sub1')">
        <img src="../Images/Button_Admin/my_projects_folder.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Chuyên mục</div>
	<span class="submenu" id="sub1">
		<i class="ilist"></i><a href="category_list.aspx">Danh sách chuyên mục</a><br />
        <i class="iedit"></i><a href="category.aspx">Thêm mới chuyên mục</a>
	</span>

    <div class="menutitle" onclick="SwitchMenu('sub2')">
        <img src="../Images/Button_Admin/c_news.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Tin tức</div>
	<span class="submenu" id="sub2">
		<i class="ilist"></i><a href="news_list.aspx?type=0">Danh sách Tin tức</a><br />
        <i class="iedit"></i><a href="news.aspx?type=0">Thêm mới Tin tức</a>
	</span>

    <div class="menutitle" onclick="SwitchMenu('sub3')">
        <img src="../Images/Button_Admin/c_products.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Sản phẩm</div>
	<span class="submenu" id="sub3">
		<i class="ilist"></i><a href="news_list.aspx?type=1">Danh sách Sản phẩm</a><br />
        <i class="iedit"></i><a href="news.aspx?type=1">Thêm mới Sản phẩm</a>
	</span>

    <div class="menutitle" onclick="SwitchMenu('sub4')">
        <img src="../Images/Button_Admin/advertising.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Banner quảng cáo</div>
	<span class="submenu" id="sub4">
		<i class="ilist"></i><a href="aditem_list.aspx">Danh sách banner</a><br />
        <i class="iedit"></i><a href="aditem.aspx">Thêm mới banner</a>
	</span>

    <div class="menutitle" onclick="SwitchMenu('sub5')">
        <img src="../Images/Button_Admin/ThongTinLienHe.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Thông tin liên hệ</div>
	<span class="submenu" id="sub5">
		<i class="ilist"></i><a href="contact_list.aspx">Danh sách liên hệ</a><br />
        <i class="iconfig"></i><a href="contact_config.aspx">Cấu hình liên hệ</a>
	</span>

    <div class="menutitle" onclick="SwitchMenu('sub6')">
        <img src="../Images/Button_Admin/c_support.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Hỗ trợ trực tuyến</div>
	<span class="submenu" id="sub6">
		<i class="ilist"></i><a href="online_list.aspx">Danh sách HTTT</a><br />
        <i class="iedit"></i><a href="online.aspx">Thêm mới HTTT</a>
	</span>

    <div class="menutitle" onclick="SwitchMenu('sub7')">
        <img src="../Images/Button_Admin/CauHinh.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Cấu hình chung</div>
	<span class="submenu" id="sub7">
		<i class="iconfig"></i><a href="config_meta.aspx">Cấu hình Meta</a><br />
        <i class="iconfig"></i><a href="Config_footer.aspx">Cấu hình Footer</a><br />
        <i class="iconfig"></i><a href="Config_banner.aspx">Cấu hình Logo</a><br />
        <i class="iconfig"></i><a href="config_email_list.aspx">Cấu hình Email</a>
	</span>

    <div class="menutitle" onclick="SwitchMenu('sub8')">
        <img src="../Images/Button_Admin/NguoiQuanTri.png" width="15" height="15" style="padding-right: 5px;border: 0px;" />
        Người quản trị</div>
	<span class="submenu" id="sub8">
		<i class="ilist"></i><a href="group_list.aspx">DS nhóm quản trị</a><br />
        <i class="iedit"></i><a href="groups.aspx">Thêm nhóm quản trị</a><br />
        <i class="ilist"></i><a href="user_list.aspx">DS người quản trị</a><br />
        <i class="iedit"></i><a href="user.aspx">Thêm người quản trị</a>
	</span>
</div>
</div>
