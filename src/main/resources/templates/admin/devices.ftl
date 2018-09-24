<#import "../parts/common.ftl" as c>

<@c.page>
    <#include "../parts/adminpanel.ftl">
<a class="btn btn-primary mb-2 p-1" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Add new Device
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" name="model" placeholder="Введите модель девайса"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="wattPlay" placeholder="Введите затраты вкл режим"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="wattWait" placeholder="Введите затраты режим ожид"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="since" placeholder="Введите год выпуска"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="country" placeholder="Введите страну производителя"/>
            </div>
            <div class="form-group">
                <label for="device">Company:</label>
                <select name="company">
        <#list companies as companny>
            <option value="${companny.id}">${companny.name}</option>
        </#list>
                </select>
            </div>
            <div class="form-group">
                <label for="device">Type:</label>
                <select name="type">
        <#list types as typ>
            <option value="${typ.id}">${typ.name}</option>
        </#list>
                </select>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

<h4>List of devices</h4>

<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Model</th>
    <th scope="col">Watt Play</th>
    <th scope="col">Watt Wait</th>
    <th scope="col">Since</th>
    <th scope="col">Country</th>
    <th scope="col">Company</th>
    <th scope="col">Type</th>
    <th scope="col">Editing</th>
    <th scope="col">Deleting</th>
    </thead>
    <tbody>
    <#list devices as device>
    <tr>
        <td>${device.model}</td>
        <td>${device.wattPlay}</td>
        <td>${device.wattWait}</td>
        <td>${device.since}</td>
        <td>${device.country}</td>
        <td>${device.company.name}</td>
        <td>${device.type.name}</td>
        <td><a class="btn btn-warning" href="/device/${device.id}" role="button">Edit</a></td>
        <td><a class="btn btn-danger" href="/device/remove/${device.id}" role="button"
               onclick="if (!confirm('Are you sure?')) return false;">Delete</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>