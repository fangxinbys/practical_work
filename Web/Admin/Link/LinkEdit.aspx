<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkEdit.aspx.cs" Inherits="Maticsoft.Web.Admin.Link.LinkEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" AutoScroll="true" runat="server">
            <Toolbars>
                <f:Toolbar ID="toolbar" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnClose" Icon="SystemClose" EnablePostBack="false" runat="server"
                            Text="关闭">
                        </f:Button>
                        <f:ToolbarSeparator ID="toolbarSe" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnSaveClose" ValidateForms="SimpleForm1" Icon="SystemSaveClose" OnClick="btnSaveClose_Click"
                            runat="server" Text="保存后关闭">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Form ID="SimpleForm1" ShowBorder="false" ShowHeader="false" runat="server" BodyPadding="10px"
                    Title="SimpleForm">
                    <Rows>
                        <f:FormRow runat="server">
                            <Items>
                                <f:TextBox ID="txtName" runat="server" Label="名称" Required="true" ShowRedStar="true">
                                </f:TextBox>

                            </Items>
                        </f:FormRow>
                        <f:FormRow runat="server">
                            <Items>
                                <f:TextBox ID="txtUrl" runat="server" Label="Url" Required="true" ShowRedStar="true">
                                </f:TextBox>

                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:DropDownList Label="所属栏目" AutoPostBack="false" EnableSimulateTree="true" Required="true"
                                    ShowRedStar="true" runat="server" ID="ddlfatherId">
                                </f:DropDownList>
                            </Items>
                            <Items>
                                <f:NumberBox runat="server" ID="txtSort" Label="发布排序" Text="0"></f:NumberBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:ContentPanel runat="server" ID="contentpan" ShowBorder="false">
                                    <textarea name="editor1" id="editor1">  </textarea>
                                </f:ContentPanel>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
        </f:Panel>

        <f:HiddenField runat="server" ID="hfEditorInitValue"></f:HiddenField>

    </form>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.js"></script>
    <script type="text/javascript">


        var hfEditorInitValueClientID = '<%= hfEditorInitValue.ClientID %>';
        var editor;
        F.ready(function () {
            editor = UE.getEditor('editor1', {
                toolbars: [['fullscreen', 'simpleupload']],
                initialFrameWidth: '100%',
                initialFrameHeight: '200',
                autoHeightEnabled: false,
                autoFloatEnabled: false,
                focus: false,
                onready: function () {
                    var editorInitValue = F('hfEditorInitValue').getValue();
                    if (editorInitValue) {
                        this.setContent(editorInitValue);
                    }

                }
            });

        });


        function updateEditor(content) {
            if (editor && editor.isReady) {
                editor.setContent(content);
            }
        }

    </script>
</body>
</html>
