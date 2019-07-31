<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestBook.aspx.cs" Inherits="Maticsoft.Web.Admin.GuestBook.GuestBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <f:PageManager ID="PageManager2" runat="server" AutoSizePanelID="Panel1" />
        <f:Panel ID="Panel1" CssClass="blockpanel" Margin="10px" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
            <Items>

                <f:Grid ID="Grid" runat="server" ShowBorder="false" ShowHeader="false" OnPageIndexChange="Grid_PageIndexChange"
                    DataKeyNames="Id" EnableMultiSelect="false" ShowPagingMessage="true" AllowPaging="true" IsDatabasePaging="true"
                    OnRowCommand="GridDpt_RowCommand">
                    <Toolbars>
                        <f:Toolbar runat="server">
                            <Items>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server">
                                </f:ToolbarFill>
                                <f:TextBox runat="server" ID="txtValue" Label="留言人"></f:TextBox>
                                <f:Button runat="server" ID="btnSelect" Text="查询" OnClick="btnSelect_Click" Icon="Zoom"></f:Button>

                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>

                        <f:BoundField DataField="Leave_name" HeaderText="留言人" Width="100" />
                        <f:BoundField DataField="Telphone" HeaderText="手机号" Width="130" />
                        <f:BoundField DataField="GuestContent" HeaderText="留言内容" ExpandUnusedSpace="true" />
                        <f:BoundField DataField="Leave_time" HeaderText="留言时间" />

                        <f:BoundField DataField="ReplayContent" HeaderText="回复内容" ExpandUnusedSpace="true" />
                        <f:BoundField DataField="Replay_time" HeaderText="回复时间" />
                        <f:LinkButtonField ColumnID="editField" TextAlign="Center" Icon="Pencil" ToolTip="编辑" ConfirmTarget="Top" CommandName="Edit" Width="50px" />
                        <f:LinkButtonField ColumnID="deleteField" TextAlign="Center" Icon="Delete" ToolTip="删除"
                            ConfirmText="确定删除留言？" ConfirmTarget="Top" CommandName="Delete" Width="50px" />
                    </Columns>

                </f:Grid>


            </Items>
        </f:Panel>




        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server" OnClose="Window1_Close"
            EnableMaximize="true" EnableResize="true" Target="Top" IsModal="True" Width="620px" Title="留言管理"
            Height="380px">
        </f:Window>
    </form>
</body>
</html>
