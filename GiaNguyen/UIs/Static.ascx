<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Static.ascx.cs" Inherits="YeuThietKeWeb.UIs.Static" %>


<div class="eleven columns">
    <div id="access_static">
        <span>Đang online: <asp:Literal EnableViewState="false" runat="server" ID="lblOnline" /></span> 
        <span>Hôm nay: <asp:Literal EnableViewState="false" runat="server" ID="lblToDay" /></span> 
        <span>Hôm qua: <asp:Literal EnableViewState="false" runat="server" ID="lblYesterday" /></span> 
        <span>Tổng truy cập: <asp:Literal EnableViewState="false" runat="server" ID="lblSum" /></span> 
    </div>
</div>