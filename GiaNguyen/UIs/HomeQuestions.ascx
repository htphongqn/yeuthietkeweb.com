<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeQuestions.ascx.cs" Inherits="YeuThietKeWeb.UIs.HomeQuestions" %>

<div class="four columns">
    <!--Questions-->
    <div class="inside_row" id="questions">
    <h2 class="box_Tab"><span class="font1">Câu hỏi thường gặp</span></h2>
    <div class="box_ct" style="overflow-y: scroll;height: 500px;">
        <ul>
            <asp:Literal ID="lblLoadNews" runat="server"></asp:Literal>
        </ul>
    </div>
    </div>
    <!--end Questions-->
</div>