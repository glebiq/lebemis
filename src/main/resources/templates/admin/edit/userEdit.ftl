<#import "../../parts/common.ftl" as c>

<@c.page>


<h3>User editor</h3>

<form action="/user" method="post">
    <div class="form-group">
        <label for="usr">Name:</label>
        <input type="text" name="username" value="${user.username}">
    </div>

    <#list roles as role>
    <div>
        <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
    </div>
    </#list>

    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <a class="btn btn-primary" href="/user/" role="button">Back</a>
    <button class="btn btn-primary" type="submit">Save</button>
</form>

</@c.page>