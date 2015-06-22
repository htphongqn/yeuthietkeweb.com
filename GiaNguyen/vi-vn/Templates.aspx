<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="Templates.aspx.cs" Inherits="YeuThietKeWeb.vi_vn.Templates" %>
<%@ Register src="../UIs/Templates.ascx" tagname="Templates" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Templates ID="Templates1" runat="server" />
</asp:Content>

