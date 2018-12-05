<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="suppaBlock">
<h3>Редагувати тип</h3>
<div><FONT color="red">${error!}</FONT></div>
<form action="/type/upd/" method="post">
    <div class="form-group">
        <label for="type">Назва:</label>
        <input type="text" required name="typename" value="${type.name}">
    </div>
    <div class="form-group">
        <label for="type">Середні витрати ВАТТ за годину:</label>
        <input type="text" required pattern="^([1-9]|[0-9]{2,4})$" title="Цілі числа від 1 до 9999 включно" name="avgWatt" value="${type.avgWatt}">
    </div>
    <div class="form-group">
        <label for="type">Середній час використання годин за місяць:</label>
        <input type="text" required pattern="^([1-9]|[1-9][0-9]|[1-6][0-9][0-9]|7[0-1][0-9]|720)$" title="Цілі числа від 1 до 720 включно" name="avgWattHoursPerMonth" value="${type.avgHoursPerMonth}">
    </div>
    <input type="hidden" value="${type.id}" name="typeId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/type" role="button">Повернутись</a>
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