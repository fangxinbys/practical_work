﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Maticsoft.Web.index" %>

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
    </style>
</head>
<body>
    <uc1:header runat="server" id="header" />
        <div>
        <!-- 轮播 -->
        <div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{}'>
            <ul class="am-slides">
                <li>
                    <img src="images/slider_02.png"/>
                </li>
                <li>
                    <img src="images/slider_02.png"/>
                </li>
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
                    <div class="fg-1 tx-r article-more"><a href="information.html?list=list&active=0">更多></a></div>
                </div>
                <div class="am-g pt-15 no-m">
                    <div class="col-lg-4 no-p">
                        <img src="images/index-img_10.png" class="left-img" alt="">
                    </div>
                    <div class="col-lg-8">
                        <!-- 列表 -->
                        <div class="list">
                            <div class="article-detalis line-h-25 t-n-30">
                                非晶节能材料产业技术创新战略联盟是在2009年成立的"北京非晶产业链创新联盟"基础上，以国产非晶节能带材为纽带，汇聚国内相关行业的骨干企业或机构，整合非晶带材、非晶铁芯、非晶变压器、非晶电机及非晶电抗器研发、中试、产业化等创新资源，2012年被科技部认定为试点联盟。非晶联盟的组建和运行，对满足我国电力系统发展和节能减排对非晶合金材料及制品的需求，提升非晶节能材料产业链自主创新能力和核心竞争力，以及打破发达国家的长期垄断具有重要意义以及打破发达国家的长期垄断具有重要意义提升非晶节能材料产业链自主创新能力和核心竞争力
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 列表2 -->
                <div class="am-g " style="padding-bottom: 20px;">
                    <!-- 标题 -->
                    <div class="col-lg-6 pt-15">
                        <div class="df article-title-content">
                            <div class="fg-3">
                                <span class=" article-title">联盟动态</span>
                            </div>
                            <div class="fg-1 tx-r article-more">
                                <a href="information.html?list=list&active=0">更多></a>
                            </div>
                        </div>
                        <!-- 内容 -->
                        <div class="am-g pt-15 no-m">
                            <div class="col-lg-4 no-p">
                                <img src="images/index-img_14.png" class="left-img" alt="">
                            </div>
                            <div class="col-lg-8 no-pr">
                                <div class="article-detalis">
                                    <p class="t-n-30 tx-o-3 line-h-23">
                                        非晶节能材料产业技术创新战略联盟是在2009年成立的"北京非晶产业链创新联盟"基础上，以国产非晶节能带材为纽带，汇聚国内相关行业的骨干企业或机构，整合非晶带材、非晶铁芯、非晶变压器、非晶电机及非晶电抗器研发、中试、产业化等创新资源，2012年被科技部认定为试点联盟。非晶联盟的组建和运行，对满足我国电力系统发展和节能减排对非晶合金材料及制品的需求，提升非晶节能材料产业链自主创新能力和核心竞争力，以及打破发达国家的长期垄断具有重要意义以及打破发达国家的长期垄断具有重要意义提升非晶节能材料产业链自主创新能力和核心竞争力
                                    </p>
                                    <div class="df f-ac more_detail">
                                        <div class="">...</div>
                                        <div class="fg-1 more_detail-text tx-r">
                                            <a href="information.html?active=0">详细</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 内容中列表 联盟动态 -->
                        <div class="details-list-content">
                            <a href="information.html?active=0" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">非晶联盟第二届第二次常务理事会在南京顺利召开</span></a>
                            <a href="information.html?active=0" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">非晶联盟第二届第二次联盟大会在南京顺利召开</span></a>
                            <a href="information.html?active=0" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">关于召开第六届非晶材料产业发展研讨会暨中国金属中国金属中国金属中国金属</span>
                            </a>
                            <a href="information.html?active=0" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">关于召开非晶联盟第二届第二次联盟常务理事会暨盟大</span></a>
                            <a href="information.html?active=0" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">关于召开第六届非晶材料产业发展研讨会暨中国金属中国金属中国金属中国金属</span>
                            </a>
                            <a href="information.html?active=0" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">非晶联盟第二届第二次联盟大会在南京顺利召开</span></a>
                        </div>
                    </div>
                    <!-- 标题 -->
                    <div class="col-lg-6 pt-15">
                        <div class="df article-title-content">
                            <div class="fg-3">
                                <span class=" article-title">行业新闻</span>
                            </div>
                            <div class="fg-1 tx-r article-more">
                                <a href="information.html?list=list&active=1">更多></a>
                            </div>
                        </div>
                        <!-- 内容 -->
                        <div class="am-g pt-15 no-m">
                            <div class="col-lg-4 no-p">
                                <img src="images/index-img_16.png" class="left-img" alt="">
                            </div>
                            <div class="col-lg-8 no-pr">
                                <div class="article-detalis">
                                    <p class="t-n-30 tx-o-3 line-h-23">
                                        非晶节能材料产业技术创新战略联盟是在2009年成立的"北京非晶产业链创新联盟"基础上，以国产非晶节能带材为纽带，汇聚国内相关行业的骨干企业或机构，整合非晶带材、非晶铁芯、非晶变压器、非晶电机及非晶电抗器研发、中试、产业化等创新资源，2012年被科技部认定为试点联盟。非晶联盟的组建和运行，对满足我国电力系统发展和节能减排对非晶合金材料及制品的需求，提升非晶节能材料产业链自主创新能力和核心竞争力，以及打破发达国家的长期垄断具有重要意义以及打破发达国家的长期垄断具有重要意义提升非晶节能材料产业链自主创新能力和核心竞争力
                                    </p>
                                    <div class="df f-ac more_detail">
                                        <div class="">...</div>
                                        <div class="fg-1 more_detail-text tx-r">
                                            <a href="information.html?active=1">详细</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 内容中列表 行业新闻 -->
                        <div class="details-list-content">
                            <a href="information.html?active=1" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">非晶联盟第二届第二次常务理事会在南京顺利召开</span></a>
                            <a href="information.html?active=1" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">非晶联盟第二届第二次联盟大会在南京顺利召开</span></a>
                            <a href="information.html?active=1" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">关于召开第六届非晶材料产业发展研讨会暨中国金属中国金属中国金属中国金属</span>
                            </a>
                            <a href="information.html?active=1" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">关于召开非晶联盟第二届第二次联盟常务理事会暨盟大</span></a>
                        </div>
                    </div>
                </div>

                <!-- 列表3 -->
                <div class="am-g " style="padding-bottom: 20px;">
                    <!-- 标题 -->
                    <div class="col-lg-6 pt-15">
                        <div class="df article-title-content">
                            <div class="fg-3">
                                <span class=" article-title">政策法规</span>
                            </div>
                            <div class="fg-1 tx-r article-more">
                                <a href="information.html?list=list&active=2">更多></a>
                            </div>
                        </div>
                        <!-- 内容 -->
                        <div class="am-g pt-15 no-m">
                            <div class="col-lg-4 no-p">
                                <img src="images/index-img_21.png" class="left-img" alt="">
                            </div>
                            <div class="col-lg-8 no-pr">
                                <div class="article-detalis">
                                    <p class="t-n-30 tx-o-3 line-h-23">
                                        非晶节能材料产业技术创新战略联盟是在2009年成立的"北京非晶产业链创新联盟"基础上，以国产非晶节能带材为纽带，汇聚国内相关行业的骨干企业或机构，整合非晶带材、非晶铁芯、非晶变压器、非晶电机及非晶电抗器研发、中试、产业化等创新资源，2012年被科技部认定为试点联盟。非晶联盟的组建和运行，对满足我国电力系统发展和节能减排对非晶合金材料及制品的需求，提升非晶节能材料产业链自主创新能力和核心竞争力，以及打破发达国家的长期垄断具有重要意义以及打破发达国家的长期垄断具有重要意义提升非晶节能材料产业链自主创新能力和核心竞争力
                                    </p>
                                    <div class="df f-ac more_detail">
                                        <div class="">...</div>
                                        <div class="fg-1 more_detail-text tx-r">
                                            <a href="information.html?active=2">详细</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 内容中列表 政策法规 -->
                        <div class="details-list-content">
                            <a href="information.html?active=2" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">关于召开非晶联盟第二届第二次联盟常务理事会暨盟大</span></a>
                            <a href="information.html?active=2" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">关于召开第六届非晶材料产业发展研讨会暨中国金属中国金属中国金属中国金属</span>
                            </a>
                            <a href="information.html?active=2" class="tx-o-1"><i class="circular"></i><span
                                class="pl-10">关于召开非晶联盟第二届第二次联盟常务理事会暨盟联盟常非晶联盟第二届第二次联盟常务理晶大</span></a>
                        </div>
                    </div>
                    <!-- 标题 -->
                    <div class="col-lg-6 pt-15">
                        <div class="df article-title-content">
                            <div class="fg-3">
                                <span class=" article-title">展会资讯</span>
                            </div>
                            <div class="fg-1 tx-r article-more">
                                <a href="information.html?list=list&active=3">更多></a>
                            </div>
                        </div>
                        <!-- 内容 -->
                        <div class="am-g pt-15 no-m">
                            <div class="col-lg-4 no-p">
                                <img src="images/index-img_23.png" class="left-img" alt="">
                            </div>
                            <div class="col-lg-8 no-pr">
                                <div class="article-detalis">
                                    <p class="t-n-30 tx-o-3 line-h-23">
                                        非晶节能材料产业技术创新战略联盟是在2009年成立的"北京非晶产业链创新联盟"基础上，以国产非晶节能带材为纽带，汇聚国内相关行业的骨干企业或机构，整合非晶带材、非晶铁芯、非晶变压器、非晶电机及非晶电抗器研发、中试、产业化等创新资源，2012年被科技部认定为试点联盟。非晶联盟的组建和运行，对满足我国电力系统发展和节能减排对非晶合金材料及制品的需求，提升非晶节能材料产业链自主创新能力和核心竞争力，以及打破发达国家的长期垄断具有重要意义以及打破发达国家的长期垄断具有重要意义提升非晶节能材料产业链自主创新能力和核心竞争力
                                    </p>
                                    <div class="df f-ac more_detail">
                                        <div class="">...</div>
                                        <div class="fg-1 more_detail-text tx-r">
                                            <a href="information.html?active=3">详细</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 内容中列表 -->
                        <div class="details-list-content">
                            <a href="information.html?active=3" class="tx-o-1"><i
                                class="circular"></i><span class="pl-10">非晶联盟第二届第二次常务理事会在南京顺利召开</span> </a>
                            <a href="information.html?active=3" class="tx-o-1"><i
                                class="circular"></i><span class="pl-10">非晶联盟第二届第二次联盟大会在南京顺利召开</span></a>
                            <a href="information.html?active=3" class="tx-o-1"><i
                                class="circular"></i><span class="pl-10">关于召开第六届非晶材料产业发展研讨会暨中国金属中国金属中国金属中国金属</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 加入联盟 -->
            <div class="col-lg-3 mt-35">
                <div class="">
                    <a href="application.html" class="join">
                        <img src="images/join.png" alt="" srcset="" class="w-100">
                    </a>
                    <div class="join-content">
                        <div class="df article-title-content">
                            <div class="fg-3">
                                <span class=" article-title">联盟成员</span>
                            </div>

                            <div class="fg-1 tx-r article-more">
                                <a href="member.html">更多></a>
                            </div>
                        </div>
                        <div>
                            <ul class="join-list">
                                <li><a href="information.html?active=3">重庆市亚东亚集团变压器有限公司</a></li>
                                <li><a href="information.html?active=3">顺特电气设备有限公司</a></li>
                                <li><a href="information.html?active=3">安泰科技股份有限公司</a></li>
                                <li><a href="information.html?active=3">中兆培基(北京)电气有限公司</a></li>
                                <li><a href="information.html?active=3">中国西电集团公司</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- 联系我们 -->
            <div class="col-lg-3 mt-15">
                <div class="">

                    <uc1:contract runat="server" id="contract" />
                </div>

            </div>
        </div>
    </div>
    <uc1:footer runat="server" id="footer" />
    <script src="js/zepto.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/amazeui.min.js"></script>
    <script src="js/common.js"></script>
</body>
</html>
