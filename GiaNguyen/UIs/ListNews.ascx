﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListNews.ascx.cs" Inherits="YeuThietKeWeb.UIs.ListNews" %>

<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc1" %>
<%@ Register src="HomeAdvisory.ascx" tagname="HomeAdvisory" tagprefix="uc2" %>
<%@ Register src="MenuLeft.ascx" tagname="MenuLeft" tagprefix="uc3" %>

<div class="current_path">
    <div class="fr"> 
        <uc1:Path ID="Path1" runat="server" />
        <h1 class="h1Title"> <asp:Label ID="lbNewsTitle" runat="server" /> </h1>
    </div>
</div>
<!--Right_col-->
<div id="main_content" class="twelve columns fr">
    <div class="inner_side">
    <!--List News Page-->
    <div id="list_news">
        <ul>
            <asp:Repeater ID="Rplistnews" runat="server">
                <ItemTemplate>
                <%#GetHtmlItemNews(Eval("NEWS_URL"), Eval("NEWS_SEO_URL"), Eval("CAT_SEO_URL"), Eval("NEWS_ID"), Eval("NEWS_IMAGE3"), Eval("NEWS_TITLE"), Eval("NEWS_DESC"))%>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></div>
    <!--End List News Page-->
    </div>
</div>
<!--End Right_col-->
<!--Left_col-->
<div id="sidebar" class="four columns fl">
    <div class="inner_side">
    <!--MenuLeft-->
    <uc3:MenuLeft ID="MenuLeft1" runat="server" />
    <!--End MenuLeft-->
    <!--Advisory-->
    <div id="advisory">
        <uc2:HomeAdvisory ID="HomeAdvisory1" runat="server" />
    </div>
    <!--end Advisory-->
    </div>
</div>
<!--End Left_col-->