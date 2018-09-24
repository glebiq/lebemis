<#import "../parts/common.ftl" as c>

<@c.page>
    <#include "../parts/adminpanel.ftl">
<a class="btn btn-primary mb-2 p-1" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Type
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Введите тип" />
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="avgWatt" placeholder="Введите среднее за час" />
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="avgHoursPerMonth" placeholder="Введите средние часы за месяц" />
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

<h4>List of types</h4>

<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Name</th>
    <th scope="col">Avg WATT</th>
    <th scope="col">Avg Hours per Month</th>
    <th scope="col">Editing</th>
    <th scope="col">Deleting</th>
    </thead>
    <tbody>
    <#list types as type>
    <tr>
        <td>${type.name}</td>
        <td>${type.avgWatt}</td>
        <td>${type.avgHoursPerMonth}</td>
        <td><a class="btn btn-warning" href="/type/${type.id}" role="button">Edit</a></td>
        <td><a class="btn btn-danger" href="/type/remove/${type.id}" role="button" onclick="if (!confirm('Are you sure?')) return false;">Delete</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>