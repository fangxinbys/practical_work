<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingleMsg.aspx.cs" Inherits="Maticsoft.Web.Admin.SinglePage.SingleMsg" %>

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

                        <f:Button ID="btnSave" OnClick="btnSave_Click" ValidateForms="SimpleForm1" Text="保存" runat="server" Icon="SystemSave">
                        </f:Button>

                    </Items>
                </f:Toolbar>
            </Toolbars>

            <Rows>
                <f:FormRow runat="server">
                    <Items>
                        <f:TextArea ID="txtRemark" runat="server" Height="70" EmptyText="摘要描述">
                        </f:TextArea>
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

        <f:HiddenField runat="server" ID="hfEditorInitValue"></f:HiddenField>
    </form>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.js"></script>
    <script type="text/javascript">


        var hfEditorInitValueClientID = '<%= hfEditorInitValue.ClientID %>';
        var editor;
        F.ready(function () {
            editor = UE.getEditor('editor1', {
                initialFrameWidth: '100%',
                initialFrameHeight: '500',
                autoHeightEnabled: true,
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
