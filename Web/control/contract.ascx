<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="contract.ascx.cs" Inherits="Maticsoft.Web.control.contract" %>
<div class="join-content">
    <div class="df article-title-content">
        <div class="fg-3">
            <span class=" article-title">联系我们</span>
        </div>
    </div>
    <div class="address-content">
        <div class="df">
            <div class="fs-1 ddress-title">电话：</div>
            <div class="address-phone"><%=(model==null?"":model.Tel) %></div>
        </div>
        <div class="df address-list">
            <div class="fs-1 ddress-title">邮编：</div>
            <div class="fs-1"><%=(model==null?"":model.PostCpde) %></div>
        </div>
        <div class="df address-list">
            <div class="fs-1 ddress-title">邮箱：</div>
            <div class="fs-1"><%=(model==null?"":model.Email) %></div>
        </div>
        <div class="df address-list">
            <div class="fs-1 ddress-title">微信号：</div>
            <div class="fs-1"><%=(model==null?"":model.WeChart) %></div>
        </div>

        <div class="df address-list">
            <div class="address-title fs-1">地址：</div>
            <div class="fs-1"><%=(model==null?"":model.Address) %></div>
        </div>
    </div>
</div>
