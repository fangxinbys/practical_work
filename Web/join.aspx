<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="join.aspx.cs" Inherits="Maticsoft.Web.join" %>

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
    <title>会员申请</title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/common.css" />
    <style>
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
                                <span class=" article-title">会员申请</span>
                            </div>
                        </div>
                        <div class=" ptb-10">
                            <div class="df f-ac tab-content">
                                <div class="fs-1 fw-b">
                                    <img src="images/list-icon.png" alt="" srcset="" />
                                </div>
                                <div class="tab-title">入盟须知</div>
                            </div>
                            <div class="df f-ac tab-content tab-active">
                                <div class="fs-1 fw-b">
                                    <img src="images/list-icon-active.png" alt="" srcset="" />
                                </div>
                                <div class="tab-title">申请加盟</div>
                            </div>
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
                    <img src="images/application-banner.png" alt="" class="w-100" srcset="" />
                    <span class="application-banner-title">会员申请</span>
                </div>
                <div id="list" class="input-content">
                    <div class="df article-title-content pt-20">
                        <div class="fg-3">
                            <span class=" article-title">会员申请</span>
                        </div>

                    </div>
                    <form runat="server" id="sub">
                        <div>
                            <div class="df f-ac ipt-content">
                                <div class="fs-1-5 ipt-title">单位名称：</div>
                                <div class="fg-1 fs-1-5">
                                    <asp:TextBox ID="txt_name" runat="server" class="ipt-590"></asp:TextBox>

                                </div>
                            </div>
                            <div class="df f-ac ipt-content">
                                <div class="fs-1-5 ipt-title">单位地址：</div>
                                <div class="fg-1 fs-1-5">
                                    <asp:TextBox ID="txt_address" runat="server" class="ipt-590"></asp:TextBox>

                                </div>
                            </div>
                            <div class="df f-ac ipt-content">
                                <div class="fs-1-5 ipt-title">邮政编码：</div>
                                <div class="fg-1 fs-1-5">
                                    <asp:TextBox ID="txt_code" runat="server" class="ipt-590"></asp:TextBox>
                                </div>
                            </div>

                            <div class="df f-ac ipt-content">
                                <div class="fs-1-5 ipt-title">注册资本：</div>
                                <div class="fg-1 fs-1-5">
                                    <asp:TextBox ID="txt_money" runat="server" class="ipt-590"></asp:TextBox>
                                </div>
                            </div>

                            <div class="df f-ac ipt-content">
                                <div class="fs-1-5 ipt-title">企业类型：</div>
                                <div class="fg-1 fs-1-5">
                                    <asp:TextBox ID="txt_type" runat="server" class="ipt-590"></asp:TextBox>
                                </div>
                            </div>

                            <div class="df f-ac ipt-content">
                                <div class="fs-1-5 ipt-title">法定代表人：</div>
                                <div class="fg-1 fs-1-5">
                                    <asp:TextBox ID="txt_peo" runat="server" class="ipt-590"></asp:TextBox>
                                </div>
                            </div>
                            <div class="df f-ac ipt-content">
                                <div class="fs-1-5 ipt-title">联系邮箱：</div>
                                <div class="fg-1 fs-1-5">
                                    <asp:TextBox ID="txt_em" runat="server" class="ipt-590"></asp:TextBox>
                                </div>
                            </div>
                            <div class="df f-ac ipt-content">
                                <div class="fs-1-5 ipt-title">联系电话：</div>
                                <div class="fg-1 fs-1-5">
                                    <asp:TextBox ID="txt_phone" runat="server" class="ipt-590"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <asp:Button ID="btn" runat="server" Text="提交" class="applicatione-btn" OnClick="btn_Click" />
                 
                    </form>
                </div>
                <!-- 内容 -->
                <div id="details" class="pt-20 uhide pb-20">
                    <div class="bb-E0E0E0 pb-20">
                        <h3 class="tx-c">入盟须知</h3>
                        <div class="tx-c fs-0-95 c-666666 pt-5">07/04/2019</div>
                    </div>
                    <div class="article-details t-n-30">
                        2019年7月4日下午，国家新材料产业发展专家咨询委员会委员、石墨烯产业技术创新战略联盟秘书长李义春博士应邀出席中关村企业信用促进会CEO私享会，并做“走中国特色的石墨烯产业发展之路”的主题分享。
                        本次会议由中关村企业信用促进会和石墨烯产业技术创新战略联盟（CGIA）共同主办，聚焦中国石墨烯产业现状、应用及市场机会，中关村企业信用促进会秘书长张九红客串本次活动的主持人并着重介绍了即将启动的北京市企业创新信用领跑行动，希望与会的优质企业和投资、金融机构共同参与这一针对信用“0瑕疵”高精尖企业的社会化激励行动。中兴通集团董事长朱元涛、北京石墨烯技术研究院院长王旭东、东旭光电产业集团史晨星等嘉宾进行了分享和交流。
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
        $(function () {
            $("#nav_5").addClass("nav-active").siblings().removeClass("nav-active");
            $('.tab-content').click(function () {
                var tabIdx = $(this).index();
                if (tabIdx == 0) {
                    $("#list").hide();
                    $("#details").show();
                } else {
                    $("#list").show();
                    $("#details").hide();
                }
                $(this).addClass('tab-active').siblings().removeClass('tab-active');
                $(this).children('.fs-1').children('img').attr('src', 'images/list-icon-active.png');
                $(this).siblings().children('.fs-1').children('img').attr('src',
                    'images/list-icon.png');
            });
        });
    </script>
</body>
</html>
