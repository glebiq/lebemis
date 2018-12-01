<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="suppaBlock">
<h3>Редагувати девайс</h3>
<form action="/device/upd/" method="post">
    <div class="form-group">
        <label for="device">Модель:</label>
        <input type="text" required name="modelName" value="${device.model}">
    </div>
    <div class="form-group">
        <label for="device">Режим активного використання ВАТТ:</label>
        <input type="text" required pattern="^([1-9]|[0-9]{2,3})$" title="Цілі числа від 1 до 999 включно"
               name="wattPlay" value="${device.wattPlay}">
    </div>
    <div class="form-group">
        <label for="device">Режим пасивного використання ВАТТ:</label>
        <input type="text" required pattern="^([0-9]{1,2})$" title="Цілі числа від 0 до 99 включно" name="wattWait"
               value="${device.wattWait!}">
    </div>
    <div class="form-group">
        <label for="device">Рік виробництва:</label>
        <input type="text" required pattern="^(19[789]\d|20[01]\d)" title="Рік з 1970 до 2019 включно" name="since"
               value="${device.since}">
    </div>
    <div class="form-group">
        <label for="device">Країна:</label>
        <input type="text" required name="country" value="${device.country}">
    </div>
    <div class="form-group">
        <label for="device">Компанія</label>
        <select name="company">
        <#list companies as companny>
            <option value="${companny.id}" <#if device.company.id == companny.id>selected</#if>>${companny.name}</option>
        </#list>
        </select>
    </div>
    <div class="form-group">
        <label for="device">Тип</label>
        <select name="type">
        <#list types as typ>
            <option value="${typ.id}" <#if device.type.id == typ.id>selected</#if>>${typ.name}</option>

        </#list>
        </select>
    </div>
    <input type="hidden" value="${device.id}" name="deviceId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/device" role="button">Повернутись</a>
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