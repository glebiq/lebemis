<#import "../parts/common.ftl" as c>
<#import "../parts/pager.ftl" as p>

<@c.page>
    <#include "../parts/adminpanel.ftl">

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary mb-2 p-1" data-toggle="modal" data-target="#exampleModal">
        Додати новий девайс
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Додавання нового девайсу</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
    <form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <input type="text" class="form-control" required name="model" placeholder="Вкажіть модель девайсу"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" required pattern="^([1-9]|[0-9]{2,3})$"
               title="Цілі числа від 1 до 999 включно" name="wattPlay"
               placeholder="Вкажіть витрати в активному режимі"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" required pattern="^([0-9]{1,2})$" title="Цілі числа від 0 до 99 включно"
               name="wattWait" placeholder="Вкажіть витрати в режимі очікування"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" required pattern="^(19[789]\d|20[01]\d)$"
               title="Рік з 1970 до 2019 включно" name="since" placeholder="Вкажіть рік випуску"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" required name="country" placeholder="Вкажіть країну виробництва"/>
    </div>
    <div class="form-group">
    <label for="device">Компанія:</label>
    <select name="company">
    <#list companies as companny>
        <option value="${companny.id}">${companny.name}</option>
    </#list>
    </select>
    </div>
    <div class="form-group">
<label for="device">Тип:</label>
    <select name="type">
    <#list types as typ>
        <option value="${typ.id}">${typ.name}</option>
    </#list>
    </select>
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

<h4>Список девайсів</h4>
<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Модель</th>
    <th scope="col">ВАТТ активні</th>
    <th scope="col">ВАТТ пасивні</th>
    <th scope="col">Рік вир-ва</th>
    <th scope="col">Країна</th>
    <th scope="col">Компанія</th>
    <th scope="col">Тип</th>
    <th scope="col">Редагування</th>
    <th scope="col">Видалення</th>
    </thead>
    <tbody>
    <#list page.content as device>
    <tr>
    <td>${device.model}</td>
    <td>${device.wattPlay}</td>
    <td>${device.wattWait}</td>
    <td>${device.since}</td>
    <td>${device.country}</td>
    <td>${device.company.name}</td>
    <td>${device.type.name}</td>
    <td><a class="btn btn-warning" href="/device/${device.id}" role="button">Редагувати</a></td>
    <td><a class="btn btn-danger" href="/device/remove/${device.id}" role="button"
           onclick="if (!confirm('Ви впевнені?')) return false;">Видалити</a></td>

<#--<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModals">-->
<#--Видалити-->
<#--</button>-->

<#--<!-- Modal &ndash;&gt;-->
<#--<div class="modal fade" id="exampleModals" tabindex="-1" role="dialog" aria-labelledby="exampleModalsLabel"-->
<#--aria-hidden="true">-->
<#--<div class="modal-dialog" role="document">-->
<#--<div class="modal-content">-->
<#--<div class="modal-header">-->
<#--<h5 class="modal-title" id="exampleModalsLabel">Видалення девайсу</h5>-->
<#--<button type="button" class="close" data-dismiss="modal" aria-label="Close">-->
<#--<span aria-hidden="true">&times;</span>-->
<#--</button>-->
<#--</div>-->
<#--<div class="modal-body">-->
<#--Ви впевнені що хочете видалити девайс ${device.model}?-->
<#--</div>-->
<#--<div class="modal-footer">-->
<#--<button type="button" class="btn btn-secondary" data-dismiss="modal">Закрити</button>-->
<#--<a href="/device/remove/${device.id}" class="btn btn-primary">Видалити</a>-->
<#--</div>-->
<#--</div>-->
<#--</div>-->
<#--</div>-->
<#--</td>-->
    </tr>
</#list>
    </tbody>
    </table>

    <@p.pager url page />
</@c.page>