<#import "../../parts/common.ftl" as c>

<@c.page>
<h3>Type editor</h3>
<form action="/device/upd/" method="post">
    <div class="form-group">
        <label for="device">Model:</label>
        <input type="text" name="modelName" value="${device.model}">
    </div>
    <div class="form-group">
        <label for="device">Play watt:</label>
        <input type="text" name="wattPlay" value="${device.wattPlay}">
    </div>
    <div class="form-group">
        <label for="device">Wait watt:</label>
        <input type="text" name="wattWait" value="${device.wattWait}">
    </div>
    <div class="form-group">
        <label for="device">Since:</label>
        <input type="text" name="since" value="${device.since}">
    </div>
    <div class="form-group">
        <label for="device">Country:</label>
        <input type="text" name="country" value="${device.country}">
    </div>
    <div class="form-group">
        <label for="device">Type</label>
        <select name="type">
        <#list types as typ>
            <option value="${typ.id}">${typ.name}</option>
        </#list>
        </select>
    </div>
    <div class="form-group">
        <label for="type">Company</label>
        <select name="company">
        <#list companies as companny>
            <option value="${companny.id}">${companny.name}</option>
        </#list>
        </select>
    </div>
    <input type="hidden" value="${device.id}" name="deviceId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/device" role="button">Back</a>
    <button class="btn btn-primary" type="submit">Save</button>
</form>

</@c.page>