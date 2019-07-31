<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingleEdit.aspx.cs" Inherits="Maticsoft.Web.Admin.SinglePage.SingleEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server" />
        <f:Form ID="SimpleForm1" ShowBorder="false" ShowHeader="false"
            AutoScroll="true" BodyPadding="10px" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnClose" EnablePostBack="false" Text="取消" runat="server" Icon="SystemClose">
                        </f:Button>
                        <f:Button ID="btnSave" OnClick="btnSave_Click" ValidateForms="SimpleForm1" Text="保存" runat="server" Icon="SystemSave">
                        </f:Button>

                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtName" Label="单页名称" Required="true" ShowRedStar="true" runat="server" />

                    </Items>
                </f:FormRow>

                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="txtSort" Label="排序号" Required="true" ShowRedStar="true" runat="server" EmptyText="请输入数字" NoDecimal="True" NoNegative="True" Text="0" />
                    </Items>
                </f:FormRow>


            </Rows>
        </f:Form>
    </form>
</body>
</html>
