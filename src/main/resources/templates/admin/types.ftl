<#import "../parts/common.ftl" as c>
<#import "../parts/pager.ftl" as p>

<@c.page>
    <#include "../parts/adminpanel.ftl">
    <div><FONT color="red">${error!}</FONT></div>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary mb-2 p-1" data-toggle="modal" data-target="#exampleModal">
        Додати новий тип
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Додавання нового типу</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
    <form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <input type="text" class="form-control" required name="name" placeholder="Вкажіть назву типу"/>
    </div>
    <div class="form-group">
        <input type="text" required pattern="^([1-9]|[0-9]{2,3})$" title="Цілі числа від 1 до 999 включно"
               class="form-control" name="avgWatt" placeholder="Вкажіть середні затрати за годину"/>
    </div>
    <div class="form-group">
        <input type="text" required pattern="^([1-9]|[1-9][0-9]|[1-6][0-9][0-9]|7[0-1][0-9]|720)$"
               title="Цілі числа від 1 до 720 включно" class="form-control" name="avgHoursPerMonth"
               placeholder="Вкажіть середній час використання за місяць"/>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрити</button>
                    <button type="submit" class="btn btn-primary">Додати</button>
                </div>
                </form>
            </div>
        </div>
    </div>




<h4>Список типів</h4>

<table class="table table-hover">
    <thead class="thead-light">
    <th scope="col">Назва</th>
    <th scope="col">Середня к-сть ВАТТ</th>
    <th scope="col">Середня к-сть годин на місяць</th>
    <th scope="col">Редагування</th>
    <th scope="col">Видалення</th>
    </thead>
    <tbody>
    <#list page.content as type>
    <tr>
    <td>${type.name}</td>
    <td>${type.avgWatt}</td>
    <td>${type.avgHoursPerMonth}</td>
    <td><a class="btn btn-warning" href="/type/${type.id}" role="button">Редагувати</a></td>
    <td><a
class="btn btn-danger" href="/type/remove/${type.id}" role="button" onclick="if (!confirm('Ви впевнені?')) return false;">Видалити</a>
    </td>
    </tr>
</#list>
    </tbody>
    </table>
    <@p.pager url page />
</@c.page>