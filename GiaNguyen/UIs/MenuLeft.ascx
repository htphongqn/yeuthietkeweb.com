<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuLeft.ascx.cs" Inherits="YeuThietKeWeb.UIs.MenuLeft" %>

<div id="cphMain_ctl00_vi1_box_menu" class="box">
    <ul id="vertical_menu">
    <asp:Repeater ID="Rpmenu" runat="server">
        <ItemTemplate>
            <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'>
                <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>"><%#Eval("cat_name")%></a>
            </li>
        </ItemTemplate>
    </asp:Repeater>
    </ul>
    <div class="cf"> </div>
</div>