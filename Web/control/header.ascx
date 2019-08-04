<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="Maticsoft.Web.control.header" %>

    <header class="">
        <div class="am-container header-bc">
            <div class="am-g">
                <div class="col-lg-6 col-md-10">
                    <div class="logo-content df f-ac">
                        <div>
                            <img src="images/logo.png" class="logo" alt="" srcset="">
                        </div>
                        <div class="logo-text-content">
                            <div class="logo-title">中国高温合金产业技术创新战略联盟</div>
                            <div class="logo-title-en">China Superalloy Innovation Strategic Alliance</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-10 tx-r header-right-content">
                    <div class="header-link">
                        <a>
                            <span><img class="home-icon" src="images/home-icon_05.png" alt="" srcset=""></span>
                            <a class="header-link-text" href="index.html">首&nbsp&nbsp&nbsp页</a>
                        </a>
                        <a class="header-link-text">|</a>
                        <a class="header-link-text" href="other.html">联系我们</a>
                    </div>
                    <div class="header-ipt">
                        <div class="w-100 df f-ac">
                            <div class="w-100"><input type="text"></div>
                            <div><button onclick="window.location.href= 'information.html'">搜索</button></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </header>
    <!-- 导航 -->
    <nav>
        <div class="am-container">
            <div class="am-g">
                <div class="col-lg-10">
                    <div class="am-g nav-content ">
                        <div class="col-lg-2 col-sm-3 col-md-2 nav-title nav-active">
                            <a data-index="0" href="index.html">关于联盟</a>
                            <div data-index="0" class="nav-title-childer tx-l uhide">
                                <a href="information.html?active=0">理事长致辞</a>
                                <a href="information.html?active=0">联盟简介</a>
                                <a href="information.html?active=0">联盟章程</a>
                                <a href="information.html?active=0">组织结构</a>
                                <a href="information.html?active=0">专家委员会</a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-3 col-md-2 nav-title">
                            <a data-index="1" href="business.html">业务介绍</a>
                        </div>
                        <div class="col-lg-2 col-sm-3 col-md-2 nav-title">
                            <a data-index="2" href="information.html">资讯中心</a>
                            <div data-index="0" class="nav-zixun-title-childer tx-l uhide">
                                <a href="information.html?list=list&active=0">联盟动态</a>
                                <a href="information.html?list=list&active=1">行业新闻</a>
                                <a href="information.html?list=list&active=2">政策法规</a>
                                <a href="information.html?list=list&active=3">展会资讯</a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-3 col-md-2 nav-title">
                            <a data-index="3" href="member.html">联盟成员</a>
                        </div>
                        <div class="col-lg-2 col-sm-3 col-md-2 col-end nav-title">
                            <a data-index="4" href="application.html">会员申请</a>
                        </div>
                        <!-- <div class="col-lg-2 col-sm-3 col-md-2 col-end nav-title">
                            <a data-index="5" href="other.html">其他栏目</a>
                        </div> -->
                    </div>
                </div>
            </div>

        </div>

    </nav>