<#import "parts/common.ftl" as c>
<@c.page>
<h5>Hello, friend</h5>

        <form method="post" enctype="multipart/form-data">

            <label for="usersdevice">Device model:</label>
<#list devices>
                <select id="sel" name="device">
        <option disabled>Оберіть девайс</option>
<#items as devicee>
            <option value="${devicee.id}">${devicee.model}</option>

</#items>
</#list>
        </select>

        </form>

</@c.page>