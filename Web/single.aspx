<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="single.aspx.cs" Inherits="Maticsoft.Web.single" %>

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
    <title>其他栏目</title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/common.css" />
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
                                <span class=" article-title">网站服务</span>
                            </div>
                        </div>
                        <div class=" ptb-10">
                            <asp:Literal ID="lit_nav" runat="server"></asp:Literal>
                        </div>

                    </div>
                </div>
                <!-- 加入我们 -->
                <a href="join.aspx" class="join">
                    <img src="images/join.png" alt="" srcset="" class="w-100">
                </a>
                <!-- 联系我们 -->
                <div class="mt-15">
                    <uc1:contract runat="server" ID="contract" />
                </div>
            </div>
            <div class="col-lg-9 pt-10">
                <div class="application-banner">
                    <img src="images/application-banner.png" alt="" class="w-100" srcset=""/>
                    <span class="application-banner-title active-title"><%=typeName %></span>
                </div>
                <div class="df article-title-content pt-20">
                    <div class="fg-3">
                        <span class="article-title active-title"><%=typeName %></span>
                    </div>
                    <!-- <div class="fg-1 tx-r article-more">更多></div> -->
                </div>
                <div class="c-333333">
                     
                    <asp:Literal ID="lit_content" runat="server"></asp:Literal>

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

            if (GetQueryString("Id") == "7") {
                $("#nav_2").addClass("nav-active").siblings().removeClass("nav-active");
            }
            else {
                $("#nav_1").addClass("nav-active").siblings().removeClass("nav-active");
            }
          
        });
    </script>
</body>
</html>
