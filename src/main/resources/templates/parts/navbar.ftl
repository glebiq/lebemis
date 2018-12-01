<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFFF46;">
    <a class="navbar-brand" href="/">Lebemis</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Головна</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Повідомлення</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/calculation">Розрахувати витрати</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">Панель адміністрування</a>
            </li>
            </#if>

        </ul>

        <div class="navbar-text mr-3">${name}</div>
        <#if known>
            <div class="form-inline">
                <@l.logout/>
            </div>
        <#else >
            <button class="btn btn-primary" type="submit" onClick='location.href="/login"'>Вхід</button>
        </#if>﻿
    </div>
</nav>