<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PicturesEdit.aspx.cs" Inherits="Maticsoft.Web.Admin.Picture.PicturesEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                        <f:Button ID="btnSave" ValidateForms="SimpleForm1" EnablePostBack="true" Text="保存" runat="server" Icon="SystemSave" OnClick="btnSave_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Rows>


                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtTile" Label="名称" Required="true" ShowRedStar="true" runat="server" MaxLength="60" />

                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea runat="server" ID="txtRemark" Label="备注"   AutoGrowHeight="true" AutoGrowHeightMin="60" AutoGrowHeightMax="60">
                        </f:TextArea>

                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtUrl" Label="链接" Required="true" ShowRedStar="true" runat="server" Text="#" />

                    </Items>

                </f:FormRow>

                <f:FormRow>
                    <Items>
                        <f:DropDownList Label="所属栏目" AutoPostBack="false" EnableSimulateTree="true"
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
                            <textarea name="editor1" id="editor1"  >  </textarea>
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
                toolbars: [['fullscreen', 'simpleupload', 'insertimage']],
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
