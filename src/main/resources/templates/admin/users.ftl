<#import "../parts/common.ftl" as c>


<@c.page>
    <#include "../parts/adminpanel.ftl">
<h4>List of users</h4>

<table class="table table-hover" >
    <thead class="thead-light">
    <th scope="col">Name</th>
    <th scope="col">Roles</th>
    <th scope="col">Editing</th>
    <th scope="col">Deleting</th>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a class="btn btn-warning" href="/user/${user.id}" role="button">Edit</a></td>
      <#--<td > <a href="/user/remove/${user.id}">Delete<a></td>-->
        <td><a class="btn btn-danger" href="/user/remove/${user.id}" role="button" onclick="if (!confirm('Are you sure?')) return false;">Delete</a></td>
       <#--<td> <a class="btn btn-primary" href="/user/remove/${user.id}" role="button">Delete</a></td>-->
    </tr>
    </#list>
    </tbody>
</table>

</@c.page>