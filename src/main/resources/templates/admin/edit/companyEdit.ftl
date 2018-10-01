<#import "../../parts/common.ftl" as c>

<@c.page>
<h3>Company editor</h3>
<div><FONT color="red">${error!}</FONT></div>
<form action="/company/upd/" method="post">
    <div class="form-group">
        <label for="company">Name:</label>
        <input type="text" required name="companyname" value="${company.name}">
    </div>
    <input type="hidden" value="${company.id}" name="companyId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/company/" role="button">Back</a>
    <button class="btn btn-primary" type="submit">Save</button>
</form>

</@c.page>