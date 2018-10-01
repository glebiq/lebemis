<#import "../../parts/common.ftl" as c>

<@c.page>
<h3>Type editor</h3>
<form action="/device/upd/" method="post">
    <div class="form-group">
        <label for="device">Model:</label>
        <input type="text" required name="modelName" value="${device.model}">
    </div>
    <div class="form-group">
        <label for="device">Play watt:</label>
        <input type="text" required pattern="^([1-9]|[0-9]{2,3})$" title="Цілі числа від 1 до 999 включно"
               name="wattPlay" value="${device.wattPlay}">
    </div>
    <div class="form-group">
        <label for="device">Wait watt:</label>
        <input type="text" required pattern="^([0-9]{1,2})$" title="Цілі числа від 0 до 99 включно" name="wattWait"
               value="${device.wattWait!}">
    </div>
    <div class="form-group">
        <label for="device">Since:</label>
        <input type="text" required pattern="^(19[789]\d|20[01]\d)" title="Рік з 1970 до 2019 включно" name="since"
               value="${device.since}">
    </div>
    <div class="form-group">
        <label for="device">Country:</label>
        <input type="text" required name="country" value="${device.country}">
    </div>
    <div class="form-group">
        <label for="device">Company</label>
        <select name="company">
        <#list companies as companny>
            <option value="${companny.id}" <#if device.company.id == companny.id>selected</#if>>${companny.name}</option>
        </#list>
        </select>
    </div>
    <div class="form-group">
        <label for="device">Type</label>
        <select name="type">
        <#list types as typ>
            <option value="${typ.id}" <#if device.type.id == typ.id>selected</#if>>${typ.name}</option>

        </#list>
        </select>
    </div>
    <input type="hidden" value="${device.id}" name="deviceId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/device" role="button">Back</a>
    <button class="btn btn-primary" type="submit">Save</button>
</form>

</@c.page>