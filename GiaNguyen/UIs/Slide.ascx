<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slide.ascx.cs" Inherits="YeuThietKeWeb.UIs.Slide" %>

<div class="slider-wrapper theme-default cf">
    <div id="slider" class="nivoSlider"> 
        <asp:Repeater ID="Rpslider" runat="server">
            <ItemTemplate>
                <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>