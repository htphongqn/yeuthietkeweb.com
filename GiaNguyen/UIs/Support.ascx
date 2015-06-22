<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Support.ascx.cs" Inherits="YeuThietKeWeb.UIs.Support" %>


<script type='text/javascript'>
function showContact(type) {
$(".title-spp").css("left", "50px");
$(".title-spp").css("opacity", 0);
setTimeout(function () {
    $(".container-spp").css("right", "0");
    $(".container-spp").css("opacity", 1);
}, 200);
if (type == 0) {
    $(".content-yahoo").css("opacity", 1);
    $(".content-yahoo").css("z-index", 1);
} else {
    $(".content-yahoo").css("opacity", 0);
    $(".content-yahoo").css("z-index", 0);
}
}

function closeContact(type) {
$(".container-spp").css("right", "-185px");
//$(".content-yahoo").css("opacity", 0);

setTimeout(function () {
    $(".title-spp").css("left", "-35px");
    $(".title-spp").css("opacity", 1);
}, 200);
} 
</script>
<div class="container-box container-spp">
  <div class="title-contact title-spp">
    <p onclick="showContact(0)"> </p>
  </div>
  <div class="content-yahoo">
    <div class="tab-support"> Hỗ trợ trực tuyến <span class="close-contact" onclick="closeContact(0)"></span> </div>
    <div class="who-contact">
      <asp:Label ID="lblHotline" runat="server"></asp:Label>
      <asp:Label ID="lblSupport" runat="server"></asp:Label>
    </div>
  </div>
</div>