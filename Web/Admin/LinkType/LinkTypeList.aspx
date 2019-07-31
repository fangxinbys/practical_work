<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkTypeList.aspx.cs" Inherits="Maticsoft.Web.Admin.LinkType.LinkTypeList" %>

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
                <f:Grid ID="GridMenu" runat="server" ShowBorder="false" EnableMultiSelect="false" KeepCurrentSelection="true" ShowHeader="false" DataKeyNames="Id" OnRowCommand="GridMenu_RowCommand">

                    <Toolbars>
                        <f:Toolbar ID="Toolbar" runat="server">

                            <Items>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server">
                                </f:ToolbarFill>
                                <f:Button ID="btnAdd" runat="server" Text="添加分类" OnClick="btnAdd_Click" Icon="Add">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>

                        <f:BoundField DataField="Name" Width="150px" HeaderText="分类名称" ExpandUnusedSpace="true" />
                        <f:BoundField Width="150px" DataField="Sort" HeaderText="排序ID" />
                        <f:TemplateField Width="150px" HeaderText="上级分类">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#GetPNmae(Eval("FatherID").ToString())%>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
                        
                        <f:LinkButtonField ColumnID="editField" TextAlign="Center" Icon="Pencil" ToolTip="编辑" ConfirmTarget="Top" CommandName="Edit" Width="100px" />
                        <f:LinkButtonField ColumnID="deleteField" TextAlign="Center" Icon="Delete" ToolTip="删除"
                            ConfirmText="确定删除该分类及其链接？" ConfirmTarget="Top" CommandName="Delete" Width="100px" />
                    </Columns>
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Right">
                            <Items>
                                <f:DropDownList Label="分类组" AutoPostBack="true" Required="false"
                                    ShowRedStar="true" runat="server" ID="ddlfatherId" OnSelectedIndexChanged="ddlfatherId_SelectedIndexChanged">
                                </f:DropDownList>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:Grid>
            </Items>
        </f:Panel>
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server" OnClose="Window1_Close"
            EnableMaximize="true" EnableResize="true" Target="Top" IsModal="True" Width="620px" Title="分类管理"
            Height="380px">
        </f:Window>



    </form>
</body>
</html>
