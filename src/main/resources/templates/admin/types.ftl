<#import "../parts/common.ftl" as c>

<@c.page>
    <#include "../parts/adminpanel.ftl">
<div><FONT color="red">${error!}</FONT></div>
<a class="btn btn-primary mb-2 p-1" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Додати новий тип
</a>

<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" required name="name" placeholder="Введите тип" />
            </div>
            <div class="form-group">
                <input type="text" required pattern="^([1-9]|[0-9]{2,3})$" title="Цілі числа від 1 до 999 включно" class="form-control" name="avgWatt" placeholder="Введите среднее за час" />
            </div>
            <div class="form-group">
                <input type="text" required pattern="^([1-9]|[1-9][0-9]|[1-6][0-9][0-9]|7[0-1][0-9]|720)$" title="Цілі числа від 1 до 720 включно" class="form-control" name="avgHoursPerMonth" placeholder="Введите средние часы за месяц" />
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Додати</button>
            </div>
        </form>
    </div>
</div>

<h4>Список типів</h4>

<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Назва</th>
    <th scope="col">Середня к-сть ВАТТ</th>
    <th scope="col">Середня к-сть годин на місяць</th>
    <th scope="col">Редагування</th>
    <th scope="col">Видалення</th>
    </thead>
    <tbody>
    <#list types as type>
    <tr>
        <td>${type.name}</td>
        <td>${type.avgWatt}</td>
        <td>${type.avgHoursPerMonth}</td>
        <td><a class="btn btn-warning" href="/type/${type.id}" role="button">Редагувати</a></td>
        <td><a class="btn btn-danger" href="/type/remove/${type.id}" role="button" onclick="if (!confirm('Ви впевнені?')) return false;">Видалити</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>