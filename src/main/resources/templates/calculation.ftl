<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl" as p>
<@c.page>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary mb-2 p-1" data-toggle="modal" data-target="#exampleModal">
        Додати новий девайс
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Оберіть девайс</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
    <form method="post" enctype="multipart/form-data">
    <div class="form-group">
    <label for="usersdevice">Модель девайсу:</label>
<#list devices>
    <select id="sel" name="device"
            onchange="isPassive(this.options[this.selectedIndex].getAttribute('watts'));">
        <option disabled>Оберіть девайс</option>
        <#items as devicee>
        <option watts="${devicee.wattWait}" value="${devicee.id}">${devicee.model}</option>
        <script>
            function isPassive(e) {
                var passiveField = document.getElementById("pass");

                if (e == 0) {
                    passiveField.setAttribute("type", "hidden");

                } else {
                    passiveField.setAttribute("type", "text");
                }
            }
        </script>
        </#items>
        </#list>
    </select>
    </div>
<div class="form-group">
    <input type="text" required pattern="^([1-9]|[1-9][0-9]|[1-6][0-9][0-9]|7[0-1][0-9]|720)$"
           title="Цілі числа від 1 до 720 включно" class="form-control" name="activeTime"
           placeholder="Вкажіть кількісь годин використання за місяць"/>
</div>
<div class="form-group">
    <input id="pass" type="text" required pattern="^([0-9]|[1-9][0-9]|[1-6][0-9][0-9]|7[0-1][0-9]|720)$"
           title="Цілі числа від 0 до 720 включно" class="form-control" name="passiveTime"
           placeholder="Введіть середню кількість годин Зарядки за місяць"/>
</div>
<input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрити</button>
                    <button type="submit" class="btn btn-primary">Додати</button>
            </div>
        </form>
            </div>
        </div>
    </div>

<h4>Ваші девайси</h4>
<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Тип</th>
    <th scope="col">Компанія</th>
    <th scope="col">Модель</th>
    <th scope="col">Час активного використання</th>
    <th scope="col">Час пасивного використання</th>
    <th scope="col">Видалення</th>
    </thead>
    <tbody>
    <#list page.content as usersdevicee>
    <tr>
    <td>${usersdevicee.device.type.name}</td>
    <td>${usersdevicee.device.company.name}</td>
    <td>${usersdevicee.device.model}</td>
    <td>${usersdevicee.activeTimeUsage}</td>
    <td>${usersdevicee.passiveTimeUsage!}</td>
    <td><a
class="btn btn-danger" href="/calculation/remove/${usersdevicee.id}" role="button" onclick="if (!confirm('Ви впевнені?')) return false;">Видалити</a></td>
    </tr>
<#else>
    Ви поки що не обрали жодного приладу.
</#list>
    </tbody>
    </table>
    <p>Ваші витрати на електроенергію ${costs} грн на місяць</p>
    <p>Ви використовуєте ${watts} КВАТТ на місяць.</p>

    <@p.pager url page />

</@c.page>