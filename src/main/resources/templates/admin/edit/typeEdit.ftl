<#import "../../parts/common.ftl" as c>

<@c.page>
<h3>Type editor</h3>
<div><FONT color="red">${error!}</FONT></div>
<form action="/type/upd/" method="post">
    <div class="form-group">
        <label for="type">Name:</label>
        <input type="text" required name="typename" value="${type.name}">
    </div>
    <div class="form-group">
        <label for="type">Avg watt per Hour:</label>
        <input type="text" required pattern="^([1-9]|[0-9]{2,3})$" title="Цілі числа від 1 до 999 включно" name="avgWatt" value="${type.avgWatt}">
    </div>
    <div class="form-group">
        <label for="type">Avg hours per Month:</label>
        <input type="text" required pattern="^([1-9]|[1-9][0-9]|[1-6][0-9][0-9]|7[0-1][0-9]|720)$" title="Цілі числа від 1 до 720 включно" name="avgWattHoursPerMonth" value="${type.avgHoursPerMonth}">
    </div>
    <input type="hidden" value="${type.id}" name="typeId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/type" role="button">Back</a>
    <button class="btn btn-primary" type="submit">Save</button>
</form>

</@c.page>