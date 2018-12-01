<#import "../parts/common.ftl" as c>
<#import "../parts/pager.ftl" as p>

<@c.page>
    <#include "../parts/adminpanel.ftl">
    <div><FONT color="red">${error!}</FONT></div>
    <button type="button" class="btn btn-primary mb-2 p-1" data-toggle="modal" data-target="#exampleModal">
        Додати нову компанію
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Додавання нової компанії</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
    <form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <input type="text" required class="form-control" name="name" placeholder="Вкажіть назву компанії"/>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрити</button>
        <button type="submit" class="btn btn-primary">Додати</button>
    </div>
    </form>
    </div>
    </div>
    </div>
    </div>


    <h4>Список компаній</h4>

    <table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Назва</th>
    <th scope="col">Редагування</th>
    <#--<th scope="col">Видалення</th>-->
    </thead>
    <tbody>
    <#list page.content as company>
        <tr>
        <td>${company.name}</td>
        <td><a class="btn btn-warning" href="/company/${company.id}" role="button">Редагувати</a></td>
        <#--<td><a-->
    <#--class="btn btn-danger" href="/company/remove/${company.id}" role="button" onclick="if (!confirm('Ви впевнені?')) return false;">Видалити</a></td>-->
        </tr>
    </#list>
    </tbody>
    </table>
    <@p.pager url page />
</@c.page>