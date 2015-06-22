<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuMobile.ascx.cs" Inherits="YeuThietKeWeb.UIs.MenuMobile" %>

<div id="menu_button">
<div class="menu_icon"></div>
<div class="mobile_menu">
    <div class="fly_menu">
    <div class="main_nav" id="box_category">
        <ul>
            <asp:Repeater ID="Rpmenu" runat="server">
            <ItemTemplate>
                <li class='cat-header <%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'>
                    <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>"><%#Eval("cat_name")%></a>
                    <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                <%#Eval("cat_name")%>
                                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                            <%#Eval("cat_name")%></a></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        <div class="close_menu">Đóng Menu</div>
    </div>
    </div>
</div>
</div>