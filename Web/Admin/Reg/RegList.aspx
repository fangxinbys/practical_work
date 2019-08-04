<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegList.aspx.cs" Inherits="Maticsoft.Web.Admin.Reg.RegList" %>

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
                    DataKeyNames="Id" EnableMultiSelect="false" ShowPagingMessage="true" AllowPaging="true" IsDatabasePaging="true"
                    OnRowCommand="GridDpt_RowCommand" AllowSorting="true" SortField="Id" SortDirection="asc" OnSort="GridDpt_Sort">

                    <Columns>


                        <f:BoundField DataField="tName" HeaderText="客户名称" Width="150px" SortField="tName" />
                        <f:BoundField DataField="tAdress" HeaderText="客户地址" Width="150px" />
                        <f:BoundField DataField="tCode" HeaderText="邮编" />
                        <f:BoundField DataField="tMoney" HeaderText="注册资金" />
                        <f:BoundField DataField="tType" HeaderText="注册性质" />
                        <f:BoundField DataField="tPeo" HeaderText="联系人" />
                        <f:BoundField DataField="tPhone" HeaderText="联系电话" />
                        <f:BoundField DataField="tEm" HeaderText="邮箱" />
                        <f:BoundField DataField="tTime" HeaderText="提交时间" />
                        <f:BoundField DataField="tDo" HeaderText="状态" />
                        <f:LinkButtonField ColumnID="deleteField" TextAlign="Center" Icon="Pencil" ToolTip="编辑"
                            ConfirmText="确定标注为已处理？" ConfirmTarget="Top" CommandName="Edit" Width="50px" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>


    </form>
</body>
</html>
