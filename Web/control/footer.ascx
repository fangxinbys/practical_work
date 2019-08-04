<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="Maticsoft.Web.control.footer" %>
    <footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }">
        <div class="am-footer-switch">
            <a href="single.aspx?Id=9" class="am-footer-desktop">联系我们</a>
            <span class="am-footer-divider">|</span>
            <a href="single.aspx?Id=10" class="am-footer-desktop">友情链接</a>
            <span class="am-footer-divider">|</span>
            <a href="single.aspx?Id=11" class="am-footer-desktop">常见问题</a>
            <span class="am-footer-divider">|</span>
            <a href="single.aspx?Id=12" class="am-footer-desktop">版权声明</a>
            <span class="am-footer-divider">|</span>
            <a href="single.aspx?Id=13" class="am-footer-desktop">隐私及安全</a>
        </div>
        <div class="am-footer-miscs ">
            <p>电话：<%=(model==null?"":model.Tel) %></p>
            <p>邮编：<%=(model==null?"":model.PostCpde) %></p>
            <p>Email：<%=(model==null?"":model.Email) %></p>
            <p>地址：<%=(model==null?"":model.Address) %></p>
        </div>
    </footer>
 