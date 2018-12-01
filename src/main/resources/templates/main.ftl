<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
    <div class="form-group col-md-6">
    <form method="get" action="/main" class="form-inline">
    <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
    placeholder="Пошук по повідомленню">
    <button type="submit" class="btn btn-primary ml-2">Пошук</button>
    </form>
    </div>
    </div>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Додати повідомлення
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Додавання повідомлення</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
    <form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <input type="text" required pattern="(\w|\s|\S){0,255}" title="Будь-які символи до 255 штук"
               class="form-control" name="text" placeholder="Введіть повідомлення"/>
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



<div class="card text-center">
<#list messages as message>
    <div class="card-body">
    <div class="name-date-wrap">
    <span class="card-name">${message.authorName}</span>
    <span class="card-date">${message.date?datetime?string(' HH:mm:ss dd-MM-yyyy')}</span>
    </div>
    <p class="card-title">${message.text}</p>
    </div>
    <style>
        .card {
            background-color: transparent;
            border: none;
        }

        .card-title {
            padding: 15px;
            margin: 0 auto;
            width: 50%;
            min-height: 50px;
            background-color: #fff;
            text-align: left;
            border-radius: 20px;
            border: 1px solid;
            font-size: 14px;
            line-height: 1.2;
        }

        .name-date-wrap {
            width: 50%;
            margin: 0 auto;
            text-align: left;
        }

        .card-name {
            display: inline-block;
            padding: 0 15px 0 10px;
            font-size: 16px;
            font-weight: bold;
            color: #005b8b;
            border-radius: 10px;
        }

        .card-date {
            display: inline-block;
            font-size: 14px;
            font-weight: lighter;
            color: #828382;
        }

        .card-body {
            padding: 5px;
        }
    </style>
<#else>
    Немає повідомлень, будьте першим хто напише повідомлення.
</#list>
    </div>

</@c.page>