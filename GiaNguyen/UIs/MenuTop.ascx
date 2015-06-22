<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuTop.ascx.cs" Inherits="YeuThietKeWeb.UIs.MenuTop" %>


<div id="cssmenu" class="container">
<ul>
    <asp:Repeater ID="Rpmenu" runat="server">
        <ItemTemplate>
            <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'>
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
</div>