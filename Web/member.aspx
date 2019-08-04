<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="Maticsoft.Web.member" %>

<%@ Register Src="~/control/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/control/contract.ascx" TagPrefix="uc1" TagName="contract" %>




<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>联盟成员</title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/common.css" />
    <style>
        .page_num a {
            margin: 5px;
        }

        .current {
            color: #ff0000;
        }
    </style>
</head>
<body>
    <uc1:header runat="server" ID="header" />
    <div class="am-container">
        <div class="am-g">
            <div class="col-lg-3 pt-10">
                <div class="">
                    <div class="join-content no-p">
                        <div class="df article-title-content p-10">
                            <div class="fg-3">
                                <span class=" article-title">联盟成员</span>
                            </div>
                        </div>
                        <div class=" ptb-10">
                            <div class="df f-ac tab-content tab-active">
                                <div class="fs-1 fw-b">
                                    <img src="images/list-icon-active.png" alt="" srcset="" />
                                </div>
                                <div class="tab-title">联盟成员</div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- 加入我们 -->

                <a href="join.aspx" class="join">
                    <img src="images/join.png" alt="" srcset="" class="w-100" />
                </a>
                <!-- 联系我们 -->
                <div class="mt-15">
                    <uc1:contract runat="server" ID="contract" />
                </div>
            </div>
            <div class="col-lg-9 pt-10">
                <div class="application-banner">
                    <img src="images/application-banner.png" alt="" class="w-100" srcset="" />
                    <span class="application-banner-title">联盟成员</span>
                </div>
                <div class="df article-title-content pt-20">
                    <div class="fg-3">
                        <span class=" article-title">联盟成员</span>
                    </div>
                    <!-- <div class="fg-1 tx-r article-more">更多></div> -->
                </div>
                <ul class="sm-block-grid-2 md-block-grid-3 lg-block-grid-5 people-content">

                    <asp:Repeater runat="server" ID="DataList1">
                        <ItemTemplate>
                            <li>
                                <div class="people-list-icon">
                                    <%#GetImage(Eval("FengMian"))%>

                                    <div class="people-name"><a href="pagenews_info.aspx?tId=<%#Eval("ArtTyID").ToString()%>&Id=<%#Eval("Id").ToString()%>"><%#Eval("Title").ToString()%></a></div>
                                </div>
                            </li>


                        </ItemTemplate>
                    </asp:Repeater>



                </ul>
                <div class="page_num">
                    <asp:Literal ID="PageView" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
    <uc1:footer runat="server" ID="footer" />
    <script src="js/zepto.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/amazeui.min.js"></script>
    <script src="js/common.js"></script>
    <script>
        $(function () {
            $("#nav_4").addClass("nav-active").siblings().removeClass("nav-active");

        });
    </script>
</body>
</html>
