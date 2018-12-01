<#import "../parts/common.ftl" as c>

<@c.page>
    <#include "../parts/adminpanel.ftl">
<div><FONT color="red">${error!}</FONT></div>
<a class="btn btn-primary mb-2 p-1" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Додати нову компанію
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" required class="form-control" name="name" placeholder="Введите название компании" />
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Додати</button>
            </div>
        </form>
    </div>
</div>

<h4>Список компаній</h4>

<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Назва</th>
    <th scope="col">Редагування</th>
    <th scope="col">Видалення</th>
    </thead>
    <tbody>
    <#list companies as company>
    <tr>
        <td>${company.name}</td>
        <td><a class="btn btn-warning" href="/company/${company.id}" role="button">Редагувати</a></td>
        <td><a class="btn btn-danger" href="/company/remove/${company.id}" role="button" onclick="if (!confirm('Ви впевнені?')) return false;">Видалити</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>