<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsDetail.ascx.cs" Inherits="YeuThietKeWeb.UIs.NewsDetail" %>

<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc1" %>
<%@ Register src="HomeAdvisory.ascx" tagname="HomeAdvisory" tagprefix="uc2" %>
<%@ Register src="MenuLeft.ascx" tagname="MenuLeft" tagprefix="uc3" %>
<%@ Register src="Toolbar.ascx" tagname="Toolbar" tagprefix="uc4" %>
<uc4:Toolbar ID="Toolbar1" runat="server" />
<div class="current_path">
    <div class="fr">
        <uc1:Path ID="Path1" runat="server" />        
    </div>
</div>
<!--Right_col-->
<div id="main_content" class="twelve columns fr">
    <div class="inner_side">
    <!--Detail News-->
    <div id="news_detail">
		<h1 id="cphMain_ctl00_htitle" class="h1Title"><asp:Label ID="lbNewsTitle" runat="server" /></h1>        
        <p id="cphMain_ctl00_pdate" class="date"> <span id="cphMain_ctl00_lbDate"></span> </p>
        <div class="detail_info">
            <asp:Literal ID="liHtml" runat="server"></asp:Literal>
        </div>
        <div class="attachment">
        <ul>
            <asp:Repeater ID="Rpfiledinhkem" runat="server">
                <ItemTemplate>
                    <li><%#BindAttItems(Eval("NEWS_ID"), Eval("EXT_ID"), Eval("NEWS_ATT_NAME"), Eval("NEWS_ATT_URL"), Eval("NEWS_ATT_FILE"), Eval("EXT_FILE_IMAGE"))%></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        </div>
		<!--Comment-->
        <div id="idFace" runat="server">
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<div class="fb-comments" data-href="<%=getUrlface() %>" data-numposts="5" data-colorscheme="light" data-width="100%"></div>
        </div>
        <div class="function">
        <div class="like_face">
            <div class="addthis_toolbox addthis_default_style like_face">
                <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                </a>
                <script type="text/javascript">
                    var addthis_config = { "data_track_addressbar": true };
                    addthis_config = addthis_config || {};
                    addthis_config.data_track_addressbar = false;
                </script>
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50d418ab2d45f0aa"></script>
            </div>
        </div>
        <div class="toolbar"> 
            <a id="hplSendEmail" href="#" class="email" runat="server">Gửi email</a> <a href="#"
                id="hplPrint" target="_blank" runat="server" class="print">Bản In</a> <a href="#"
                    id="hplFeedback" runat="server" class="opinion">Phản hồi</a>
        </div>
        </div>
        <!--Other News-->
        <div class="other_news_sub" id="dvOtherNews" runat="server">
        <div class="other_newsT">Tin bài khác</div>
        <ul>
            <asp:Repeater ID="Rptinkhac" runat="server">
                <ItemTemplate>
                    <li><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                        <%# Eval("NEWS_TITLE") %>
                        <span class="date">(<%# getDate(Eval("NEWS_PUBLISHDATE")) %>)</span>
                        </a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <div style="overflow: hidden;margin-left: 10px;">
            <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                <ItemTemplate>
                        <asp:LinkButton ID="btnPage" style="padding:8px; margin:2px; background:#999999; font:8pt tahoma;" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                            runat="server" ForeColor="White" Font-Bold="True"><%# Container.DataItem %>
                        </asp:LinkButton>
               </ItemTemplate>
            </asp:Repeater>
       </div>
        <a id="hplViewmore" runat="server" class="view_all" href="">Xem tất cả &raquo;</a>
        </div>
        <!--Other News-->
    </div>
    <!--End Detail News-->
    </div>
</div>
<!--End Right_col-->
<!--Left_col-->
<div id="sidebar" class="four columns fl">
    <div class="inner_side">
    <!--Left Menu-->
    <uc3:MenuLeft ID="MenuLeft1" runat="server" />
    <!--End Left Menu-->
    <!--Advisory-->
    <div id="advisory">
        <uc2:HomeAdvisory ID="HomeAdvisory1" runat="server" />
    </div>
    <!--end Advisory-->
    </div>
</div>
<!--End Left_col-->