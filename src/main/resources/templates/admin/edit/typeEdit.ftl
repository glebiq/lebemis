<#import "../../parts/common.ftl" as c>

<@c.page>
<h3>Type editor</h3>
<form action="/type/upd/" method="post">
    <div class="form-group">
        <label for="type">Name:</label>
        <input type="text" name="typename" value="${type.name}">
    </div>
    <div class="form-group">
        <label for="type">Avg watt:</label>
        <input type="text" name="avgWatt" value="${type.avgWatt}">
    </div>
    <div class="form-group">
        <label for="type">Avg hours per Month:</label>
        <input type="text" pattern="[0-9]{1,3}" name="avgWattHoursPerMonth" value="${type.avgHoursPerMonth}">
    </div>
    <input type="hidden" value="${type.id}" name="typeId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/type" role="button">Back</a>
    <button class="btn btn-primary" type="submit">Save</button>
</form>

</@c.page>