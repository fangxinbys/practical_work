<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArticlesList.aspx.cs" Inherits="Maticsoft.Web.Admin.Articles.ArticlesList" %>

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

                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true" EnableCollapse="true" ShowBorder="false"
                    RegionPercent="15%" ShowHeader="false" IconFont="_PullLeft" AutoScroll="true">
                    <Items>
                        <f:Tree runat="server" ID="TMailList" OnNodeCommand="TMailList_NodeCommand" ShowHeader="false">
                            <Toolbars>
                                <f:Toolbar runat="server">
                                    <Items>

                                        <f:Label runat="server" ID="lbltext" Text="栏目列表"></f:Label>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>

                        </f:Tree>
                    </Items>
                </f:Panel>

                <f:Panel runat="server" ID="panelRightRegion" RegionPosition="Right" RegionSplit="true" EnableCollapse="true" AutoScroll="true"
                    RegionPercent="85%" ShowHeader="false" IconFont="_PullRight">
                    <Items>
                        <f:Grid ID="Grid" EnableCollapse="false" PageSize="15" ShowPagingMessage="true" AllowPaging="true" IsDatabasePaging="true" OnPageIndexChange="Grid_PageIndexChange"
                            runat="server" DataKeyNames="Id" ShowHeader="false" OnRowCommand="Grid_RowCommand">
                            <Toolbars>
                                <f:Toolbar runat="server">
                                    <Items>
                                        <f:TextBox runat="server" ID="txtValue" Label="按标题搜索" LabelWidth="150"></f:TextBox>
                                        <f:Button runat="server" ID="btnSelect" Text="刷新" OnClick="btnSelect_Click" Icon="Zoom"></f:Button>
                                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                                        </f:ToolbarFill>

                                        <f:Button runat="server" ID="btnTes" Text="添加文章" Icon="Add" OnClick="btnAdd_Click"></f:Button>

                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Columns>

                                <f:BoundField DataField="Title" HeaderText="文章标题" ExpandUnusedSpace="true" />
                                <f:TemplateField Width="100px" HeaderText="文章分类">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="tname" Text='<%#GetName(Eval("ArtTyID").ToString()) %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField Width="150px" DataField="UpdateTime" HeaderText="发布时间" />
                                <f:BoundField Width="100px" DataField="Editor" HeaderText="作者" />


                                <f:BoundField Width="80px" HeaderText="排序号" DataField="Sort" />
                                <f:LinkButtonField ColumnID="editField" TextAlign="Center" Icon="Pencil" ToolTip="编辑" ConfirmTarget="Top" CommandName="Edit" Width="50px" />
                                <f:LinkButtonField ColumnID="deleteField" TextAlign="Center" Icon="Delete" ToolTip="删除"
                                    ConfirmText="确定删除该文章？" ConfirmTarget="Top" CommandName="Delete" Width="50px" />
                            </Columns>

                        </f:Grid>
                    </Items>
                </f:Panel>

            </Items>
        </f:Panel>




        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server" OnClose="Window1_Close" Title="文章编辑"
            EnableMaximize="true" EnableResize="true" Target="Top" IsModal="True" Width="850px"
            Height="580px">
        </f:Window>
    </form>
</body>
</html>
