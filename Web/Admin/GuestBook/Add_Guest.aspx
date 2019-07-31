<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Guest.aspx.cs" Inherits="Maticsoft.Web.Admin.GuestBook.Add_Guest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server" />
        <f:Form ID="SimpleForm1" ShowBorder="false" ShowHeader="false" AutoScroll="true" BodyPadding="10px" runat="server">

            <Toolbars>
                <f:Toolbar ID="Toolbar2" runat="server" ToolbarAlign="right" Position="Bottom">
                    <Items>

                        <f:Button ID="btnClose" EnablePostBack="false" Text="取消" runat="server" Icon="SystemClose">
                        </f:Button>
                        <f:Button ID="btnSave" ValidateForms="SimpleForm1" EnablePostBack="true" Text="回复" runat="server" Icon="SystemSave" OnClick="btnSave_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Rows>


                <f:FormRow>
                    <Items>

                        <f:TextArea ID="GuestContent" Label="留言内容" Required="true" ShowRedStar="true" runat="server" Height="120" Enabled="false"></f:TextArea>

                    </Items>
                </f:FormRow>
                <f:FormRow>

                    <Items>
                        <f:DatePicker runat="server" Required="true" EnableEdit="false" Label="回复日期" EmptyText="请选择日期"
                            ID="Calendar1" ShowRedStar="True">
                        </f:DatePicker>

                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="ReplayContent" Label="回复内容" Required="true" ShowRedStar="true" runat="server" Height="120"></f:TextArea>

                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>

    </form>

</body>
</html>
