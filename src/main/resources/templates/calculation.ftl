<#import "parts/common.ftl" as c>
<@c.page>
<a class="btn btn-primary mb-2 p-1" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Add your Device
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="usersdevice">Device model:</label>
                <select name="device">
        <#list devices as devicee>
            <option value="${devicee.id}">${devicee.model}</option>
        </#list>
                </select>
            </div>
            <div class="form-group">
                <input type="text" required pattern="^([1-9]|[1-9][0-9]|[1-6][0-9][0-9]|7[0-1][0-9]|720)$"
                       title="Цілі числа від 1 до 720 включно" class="form-control" name="activeTime"
                       placeholder="Введите средние часы использования в месяц"/>
            </div>
            <div class="form-group">
                <input type="text" required pattern="^([1-9]|[1-9][0-9]|[1-6][0-9][0-9]|7[0-1][0-9]|720)$"
                       title="Цілі числа від 1 до 720 включно" class="form-control" name="passiveTime"
                       placeholder="Введите средние часы зарядки в месяц"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>
<h4>Your devices</h4>
<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Type</th>
    <th scope="col">Company</th>
    <th scope="col">Model</th>
    <th scope="col">Active time usage</th>
    <th scope="col">Passive time usage</th>
    </thead>
    <tbody>
    <#list usersdevice as usersdevicee>
    <tr>
        <td>${usersdevicee.device.type.name}</td>
        <td>${usersdevicee.device.company.name}</td>
        <td>${usersdevicee.device.model}</td>
        <td>${usersdevicee.activeTimeUsage}</td>
        <td>${usersdevicee.passiveTimeUsage}</td>
    </tr>
    <#else>
    You haven't chosen any devices yet.
    </#list>
    </tbody>
</table>
</@c.page>