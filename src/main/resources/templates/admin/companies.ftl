<#import "../parts/common.ftl" as c>

<@c.page>
    <#include "../parts/adminpanel.ftl">
<div><FONT color="red">${error!}</FONT></div>
<a class="btn btn-primary mb-2 p-1" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Company
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" required class="form-control" name="name" placeholder="Введите название компании" />
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

<h4>List of companies</h4>

<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Name</th>
    <th scope="col">Editing</th>
    <th scope="col">Deleting</th>
    </thead>
    <tbody>
    <#list companies as company>
    <tr>
        <td>${company.name}</td>
        <td><a class="btn btn-warning" href="/company/${company.id}" role="button">Edit</a></td>
        <td><a class="btn btn-danger" href="/company/remove/${company.id}" role="button" onclick="if (!confirm('Are you sure?')) return false;">Delete</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>