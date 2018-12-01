<#import "../../parts/common.ftl" as c>

<@c.page>

    <div class="suppaBlock">
    <h3>Редагувати компанію</h3>
    <div><FONT color="red">${error!}</FONT></div>
    <form action="/company/upd/" method="post">
    <div class="form-group">
<label for="company">Назва:</label>
<input type="text" required name="companyname" value="${company.name}">
    </div>
<input type="hidden" value="${company.id}" name="companyId">
<input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/company/" role="button">Повернутись</a>
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