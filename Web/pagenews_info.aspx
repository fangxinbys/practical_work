<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagenews_info.aspx.cs" Inherits="Maticsoft.Web.pagenews_info" %>

<%@ Register Src="~/control/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/control/contract.ascx" TagPrefix="uc1" TagName="contract" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>资讯中心</title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/common.css" />
    <style>
        h1,
        h2,
        h3 {
            padding: 0px;
            margin: 0px;
        }

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
                                <span class=" article-title">资讯中心</span>
                            </div>
                        </div>
                        <div class=" ptb-10">
                            <asp:Literal ID="lit_nav" runat="server"></asp:Literal>

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
                    <span class="application-banner-title active-title"><%=typeName %></span>
                </div>
                <div id="list">
                    <div class="df article-title-content pt-20">
                        <div class="fg-3">
                            <span class="article-title active-title"><%=typeName %></span>
                        </div>

                    </div>

                    <div class="pt-10"></div>


                </div>
                <div id="details" class="pt-20 uhide pb-20">
                    <div class="bb-E0E0E0 pb-20">
                        <h3 class="tx-c">
                            <asp:Literal ID="lit_title" runat="server"></asp:Literal></h3>
                        <div class="tx-c fs-0-95 c-666666 pt-5">
                           发布时间： <asp:Literal ID="lit_time" runat="server"></asp:Literal>&nbsp;&nbsp; 发布人：<asp:Literal ID="lit_edit" runat="server"></asp:Literal>
                           &nbsp;&nbsp;浏览次：<asp:Literal ID="lit_click" runat="server"></asp:Literal>&nbsp;&nbsp;&nbsp;<a href="javascript:history.back(-1)">返回上一页</a>
                        </div>
                    </div>
                    <div class="article-details t-n-30">
                        <asp:Literal ID="lit_content" runat="server"></asp:Literal>
                    </div>
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
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        } 
 
        $(function () {

            if (GetQueryString("tId") == "7") {
                $("#nav_4").addClass("nav-active").siblings().removeClass("nav-active");
            }
            else {
                $("#nav_3").addClass("nav-active").siblings().removeClass("nav-active");
            }
              $("#details").show();
        });
    </script>
</body>
</html>
