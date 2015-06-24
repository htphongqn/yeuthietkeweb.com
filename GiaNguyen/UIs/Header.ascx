<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="YeuThietKeWeb.UIs.Header" %>


<header>
  <div class="container">
    <%--<div id="logo" class="four columns"> &nbsp;
      <div class="logo_rotate">
        <div class="CircleBlock">
          <div class="innerCircle">
            <div class="circle0 rotate"></div>
            <div class="circle1 rotate2"></div>
            <div class="circle2  rotate"></div>
            <div class="primary-circle textCircle">
              <ul class="circle-menu">
                <li class="item1"> <img src="/vi-vn/Images/text_top.png" class="img-responsive" alt="pic" /> </li>
                <li class="item2"> <img src="/vi-vn/Images/text_bottom.png" class="img-responsive" alt="pic" /> </li>
              </ul>
            </div>
            <div class="primary-circle cn-wrapper" id="cn-wrapper"> </div>
            <div class="inner-circle">
              <div class="inner"> 
                <asp:Repeater ID="Rplogo" runat="server">
                    <ItemTemplate>
                        <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
                    </ItemTemplate>
                </asp:Repeater>
                <a href="/" class="itemHover"> <span></span> </a> 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>--%>
    <asp:Repeater ID="Rpbanner" runat="server">
        <ItemTemplate>
            <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
        </ItemTemplate>
    </asp:Repeater>
    <!--Search Tool-->
    <div class="three columns" id="header_r" style="float:right;">
      <div id="search_head">
        <input name="txtSearch" type="text" id="txtSearch" alt="Search" class="input_Search" placeholder="Từ khóa tìm kiếm" runat="server"/>
        <asp:LinkButton ID="btnSearch" runat="server" class="search_btn" 
            onclick="btnSearch_Click"></asp:LinkButton>
      </div>
      <!--Hotline-->
      <div id="head_hotline">
        <asp:Literal ID="lblHotline" runat="server"></asp:Literal>
      </div>
    </div>
  </div>
</header>