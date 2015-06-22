<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Templates.ascx.cs" Inherits="YeuThietKeWeb.UIs.Templates" %>


<div class="inner_side">
      <div class="current_path">
        <div class="fr">
            <span class="breadcrum"><a href="/">Trang chủ</a><span class='spSeperator'></span> <a href='kho-giao-dien.html' class='aLink1'>Kho giao diện</a> </span>
          <h1 class="h1Title"> <span id="cphMain_ctl00_lbCatName">Kho giao diện</span> </h1>
        </div>
      </div>
      <!--List Layout-->
      <!--Fancybox-->
      <link href="/vi-vn/Styles/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" />
      <script type="text/javascript" src="/vi-vn/Scripts/jquery.fancybox.js"></script>
      <script type='text/javascript'>//<![CDATA[
          $(window).load(function () {
              (function ($) {
                  // VERTICALLY ALIGN FUNCTION
                  $.fn.vAlign = function () {
                      return this.each(function (i) {
                          var ah = $(this).height();
                          var ph = $(this).parent().height();
                          var mh = Math.ceil((ph - ah) / 2);
                          $(this).css('margin-top', mh);
                      });
                  };
              })(jQuery);
              $(document).ready(function () {
                  $(".img_gallery").vAlign();
              });
          });//]]>  

</script>
<div id="list_gallery_img">
    <asp:Repeater ID="Rpimg_small" runat="server">
        <ItemTemplate>
            <div class="img_item">
                <a href="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" rel="gallery1" class="zoom"> 
                    <img class="img_gallery" alt="" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" /></a> 
                <span class="regis_btn"><a href="dang-ky.html?id=<%# Eval("NEWS_IMG_ID")%>">Đăng ký</a></span> 
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<!--End List Layout-->
</div>