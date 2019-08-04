<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="Maticsoft.Web.control.header" %>

<header class="">
    <div class="am-container header-bc">
        <div class="am-g">
            <div class="col-lg-6 col-md-10">
                <div class="logo-content df f-ac">
                    <div>
                        <a href="index.aspx">
                            <img src="images/logo.png" class="logo" alt="" srcset="" /></a>
                    </div>
                    <div class="logo-text-content">
                        <div class="logo-title">中国高温合金产业技术创新战略联盟</div>
                        <div class="logo-title-en">China Superalloy Innovation Strategic Alliance</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-10 tx-r header-right-content">
                <div class="header-link">
                    <a href="index.aspx">
                        <span>
                            <img class="home-icon" src="images/home-icon_05.png" alt="" srcset="" /></span>
                        <span class="header-link-text">首&nbsp&nbsp&nbsp页</span>
                    </a>
                    <a class="header-link-text">|</a>
                    <a class="header-link-text" href="single.aspx?Id=9">联系我们</a>
                </div>
                <div class="header-ipt">
                    <div class="w-100 df f-ac">
                        <div class="w-100">
                            <input type="text" id="search_text">
                        </div>
                        <div>
                            <button  onclick="buttonClick();" id="btn_search">搜索</button>
                        </div>
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
                    <div class="col-lg-2 col-sm-3 col-md-2 nav-title" id="nav_1">
                        <a data-index="0" href="index.aspx">关于联盟</a>
                        <div data-index="0" class="nav-title-childer tx-l uhide">
                            <a href="single.aspx?Id=2">理事长致辞</a>
                            <a href="single.aspx?Id=3">联盟简介</a>
                            <a href="single.aspx?Id=4">联盟章程</a>
                            <a href="single.aspx?Id=5">组织结构</a>
                            <a href="single.aspx?Id=6">专家委员会</a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-sm-3 col-md-2 nav-title" id="nav_2">
                        <a data-index="1" href="single.aspx?Id=7">业务介绍</a>
                    </div>
                    <div class="col-lg-2 col-sm-3 col-md-2 nav-title" id="nav_3">
                        <a data-index="2" href="javascript:void(0)">资讯中心</a>
                        <div data-index="0" class="nav-zixun-title-childer tx-l uhide">
                            <a href="pagenews.aspx?tId=3">联盟动态</a>
                            <a href="pagenews.aspx?tId=4">行业新闻</a>
                            <a href="pagenews.aspx?tId=5">政策法规</a>
                            <a href="pagenews.aspx?tId=6">展会资讯</a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-sm-3 col-md-2 nav-title" id="nav_4">
                        <a data-index="3" href="member.aspx">联盟成员</a>
                    </div>
                    <div class="col-lg-2 col-sm-3 col-md-2 col-end nav-title" id="nav_5">
                        <a data-index="4" href="join.aspx">会员申请</a>
                    </div>
                    <!-- <div class="col-lg-2 col-sm-3 col-md-2 col-end nav-title">
                            <a data-index="5" href="other.html">其他栏目</a>
                        </div> -->
                </div>
            </div>
        </div>

    </div>

</nav>
 <script>  
        function buttonClick(){  

            if (document.getElementById("search_text").value == "") {
                return false;
            }
            window.location.href = 'search.aspx?keys='+document.getElementById("search_text").value;
 
        }  
    </script> 
