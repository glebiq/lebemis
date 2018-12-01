<#import "../parts/common.ftl" as c>
<#import "../parts/pager.ftl" as p>

<@c.page>
    <#include "../parts/adminpanel.ftl">
    <h4>Список користувачів</h4>

    <table class="table table-hover" >
    <thead class="thead-light">
    <th scope="col">Ім'я</th>
    <th scope="col">Роль</th>
    <th scope="col">Редагування</th>
    <th scope="col">Видалення</th>
    </thead>
    <tbody>
    <#list page.content as user>
        <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a class="btn btn-warning" href="/user/${user.id}" role="button">Редагувати</a></td>
        <td><a
    class="btn btn-danger" href="/user/remove/${user.id}" role="button" onclick="if (!confirm('Ви впевнені?')) return false;">Видалити</a></td>
        </tr>
    </#list>
    </tbody>
    </table>
    <@p.pager url page />
</@c.page>