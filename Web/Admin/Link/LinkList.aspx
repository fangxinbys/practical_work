<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkList.aspx.cs" Inherits="Maticsoft.Web.Admin.Link.LinkList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" CssClass="blockpanel" Margin="10px" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
            <Items>


                <f:Grid ID="GridDpt" runat="server" ShowBorder="false" ShowHeader="false" OnPageIndexChange="GridDpt_PageIndexChange"
                    DataKeyNames="id" EnableMultiSelect="false" ShowPagingMessage="true" AllowPaging="true" IsDatabasePaging="true"
                    OnRowCommand="GridDpt_RowCommand" AllowSorting="true" SortField="id" SortDirection="asc" OnSort="GridDpt_Sort">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" Position="Top" runat="server">
                            <Items>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server">
                                </f:ToolbarFill>
                                <f:Button ID="btnNew" runat="server" Icon="Add" Text="新增链接" OnClick="btnNew_Click">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>


                        <f:BoundField DataField="id" HeaderText="编码" Width="150px" SortField="rCode" />
                        <f:BoundField DataField="Name" HeaderText="名称" Width="150px" />
                        <f:BoundField DataField="Url" HeaderText="链接" ExpandUnusedSpace="true" />
                        <f:BoundField DataField="Sort" HeaderText="排序" />
                        <f:TemplateField Width="100px" HeaderText="链接分类">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="tname" Text='<%#GetName(Eval("TyID").ToString()) %>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
                        <f:LinkButtonField ColumnID="editField" TextAlign="Center" Icon="Pencil" ToolTip="编辑" ConfirmTarget="Top" CommandName="Edit" Width="50px" />
                        <f:LinkButtonField ColumnID="deleteField" TextAlign="Center" Icon="Delete" ToolTip="删除"
                            ConfirmText="确定删除链接？" ConfirmTarget="Top" CommandName="Delete" Width="50px" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>

        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server" OnClose="Window1_Close"
            EnableMaximize="true" EnableResize="true" Target="Top" IsModal="True" Width="800px" Title="编辑链接"
            Height="540px">
        </f:Window>
    </form>
</body>
</html>
