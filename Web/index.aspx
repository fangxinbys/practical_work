<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Maticsoft.Web.index" %>

<%@ Register Src="~/control/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/control/contract.ascx" TagPrefix="uc1" TagName="contract" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>首页</title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/common.css" />
    <style>
        .am-slider-default .am-control-nav {
            bottom: 40px;
        }

            .am-slider-default .am-control-nav li a {
                width: 50px;
                height: 4px;
            }

                .am-slider-default .am-control-nav li a.am-active {
                    background-color: #fff;
                }

            .am-slider-default .am-control-nav li a {
                background-color: #356aae;
            }

        @media screen and (max-width: 300px) {
        }

        @media screen and (min-width: 301px) and (max-width: 1000px) {
            .am-slider-default {
                margin-top: 1.5em;
                background: #000;
            }
        }

        .am-slides img {
            height: 450px;
        }
    </style>
</head>
<body>
    <uc1:header runat="server" ID="header" />
    <div>
        <!-- 轮播 -->
        <div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{}'>
            <ul class="am-slides">
                <asp:Literal ID="lit_banner" runat="server"></asp:Literal>
            </ul>
        </div>
    </div>
    <!-- 内容 -->
    <div class="am-container">
        <div class="am-g">
            <div class="col-lg-9 pt-10">
                <!-- 列表 -->
                <div class="df article-title-content">
                    <div class="fg-3">
                        <span class=" article-title">联盟简介</span>
                    </div>
                    <div class="fg-1 tx-r article-more"><a href="single.aspx?Id=3">更多></a></div>
                </div>
                <div class="am-g pt-15 no-m">
                    <div class="col-lg-4 no-p">
                        <img src="images/index-img_10.png" class="left-img" alt="" />
                    </div>
                    <div class="col-lg-8">
                        <!-- 列表 -->
                        <div class="list">
                            <div class="article-detalis line-h-25 t-n-30">
                                <asp:Literal ID="lit_about" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 列表2 -->
                <div class="am-g " style="padding-bottom: 20px;">

                    <asp:Literal ID="lit_article" runat="server"></asp:Literal>
                </div>
            </div>
            <!-- 加入联盟 -->
            <div class="col-lg-3 mt-35">
                <div class="">
                    <a href="join.aspx" class="join">
                        <img src="images/join.png" alt="" srcset="" class="w-100" />
                    </a>
                    <div class="join-content">
                        <div class="df article-title-content">
                            <div class="fg-3">
                                <span class=" article-title">联盟成员</span>
                            </div>

                            <div class="fg-1 tx-r article-more">
                                <a href="member.aspx">更多></a>
                            </div>
                        </div>
                        <div>
                            <ul class="join-list">
                                <asp:Literal ID="lit_me" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- 联系我们 -->
            <div class="col-lg-3 mt-15">
                <div class="">

                    <uc1:contract runat="server" ID="contract" />
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
            $("#nav_1").addClass("nav-active").siblings().removeClass("nav-active"); 
        })

    </script>

</body>
</html>
