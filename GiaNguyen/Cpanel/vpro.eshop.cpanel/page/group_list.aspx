﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="group_list.aspx.cs" Inherits="vpro.eshop.cpanel.page.group_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>DS nhóm người dùng | Vpro.Eshop </title>
    <script language="javascript">
				<!--
        function ToggleAll(e, action) {
            if (e.checked) {
                CheckAll();
            }
            else {
                ClearAll();
            }
        }

        function CheckAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = true;
            }
            ml.MainContent_GridItemList_toggleSelect.checked = true;
        }

        function ClearAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = false;
            }
            ml.MainContent_GridItemList_toggleSelect.checked = false;
        }
				    
				// -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click"> <img src="../Images/ICON_EDIT.jpg" width="30" height="30" style="border: 0px" /><div>
                            Edit</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="groups.aspx">
                <img src="../Images/ICON_ADD.png" width="30" height="30" border="0" style="border: 0px" /><div>
                    Add New</div>
            </a>
        </div>
        <div class="icon_function_Child" id="dvDelete" runat="server">
            <asp:LinkButton ID="lbtDelete" runat="server" OnClientClick="return confirm('Do you want delete?');"
                CausesValidation="false" OnClick="lbtDelete_Click"> <img src="../Images/ICON_DELETE.png" width="30" height="30" style="border: 0px" /><div>
                    Delete</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="group_list.aspx">
                <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Refesh</div>
            </a>
        </div>
        <div class="boxinput">
            <input name="txtKeyword" type="text" id="txtKeyword" style="width: 300px" runat="server" />
            <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click">
                <div class="divKeyword" tabindex="0" aria-label="Tìm kiếm" style="display: block;"></div>
            </asp:LinkButton>
        </div>
    </div>
    <!--icon_function_parent-->
    <div id="field">
        <table width="100%" border="0">
            <tr>
                <td colspan="3">
                    <asp:DataGrid ID="GridItemList" CellPadding="0" runat="server" AutoGenerateColumns="False"
                        Width="100%" DataKeyField="GROUP_ID" CssClass="tdGridTable" SelectedIndex="0"
                        PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right"
                        AllowPaging="false" PageSize="15" PagerStyle-CssClass="PageClass" AllowSorting="true"
                        OnItemCommand="GridItemList_ItemCommand" OnItemDataBound="GridItemList_ItemDataBound"
                        OnPageIndexChanged="GridItemList_PageIndexChanged" OnSortCommand="GridItemList_SortCommand" GridLines="None" >
                        <AlternatingItemStyle BackColor="#f3f3f3" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="#" HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow"
                                HeaderStyle-Wrap="False">
                                <HeaderStyle Width="1%"></HeaderStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblSTT" runat="server" EnableViewState="False" Text='<%# getOrder() %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderStyle-Width="1%" ItemStyle-Wrap="False" HeaderStyle-CssClass="tdGridHeader"
                                ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <HeaderTemplate>
                                    <input type="checkbox" id="toggleSelect" runat="server" onclick="javascript: ToggleAll(this,0);"
                                        style="border-top-style: none; border-right-style: none; border-left-style: none;
                                        border-bottom-style: none" name="toggleSign">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input id="chkSelect" type="checkbox" name="chkSelect" runat="server" style="border-top-style: none;
                                        border-right-style: none; border-left-style: none; border-bottom-style: none">
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Mã nhóm" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="GROUP_CODE">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "GROUP_ID")) %>'>
                                        <%# DataBinder.Eval(Container.DataItem, "GROUP_CODE")%>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Tên nhóm" HeaderStyle-Width="95%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="GROUP_NAME">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "GROUP_ID")) %>'>
                                        <%# DataBinder.Eval(Container.DataItem, "GROUP_NAME")%>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="95%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="#" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "GROUP_ID")) %>'>Edit
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Delete">
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnDel" runat="server" CommandName="Delete">
                                <img src="../images/delete_icon.gif" title="Delete" border="0">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
                    </asp:DataGrid>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
