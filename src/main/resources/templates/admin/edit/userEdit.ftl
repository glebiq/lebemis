<#import "../../parts/common.ftl" as c>

<@c.page>
<div class="suppaBlock">

<h3>Редагувати користувача</h3>

<form action="/user" method="post">
    <div class="form-group">
        <label for="usr">Ім'я:</label>
        <input type="text" name="username" disabled value="${user.username}">
    </div>

    <#list roles as role>
    <div>
        <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
    </div>
    </#list>

    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/user/" role="button">Повернутись</a>
    <button class="btn btn-primary" type="submit">Зберегти</button>
</form>
    </div>
    <style>
        .suppaBlock {
            width: 275px;
            padding: 10px;
            margin: auto;
            background: #aacfe2;
        }
    </style>
</@c.page>