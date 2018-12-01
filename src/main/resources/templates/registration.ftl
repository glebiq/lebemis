<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div class="mb-1">Додати нового користувача</div>
    <div><FONT color="red">${message?ifExists}</FONT></div>
    <@l.login "/registration" true />
</@c.page>