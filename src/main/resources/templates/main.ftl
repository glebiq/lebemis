<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                   placeholder="Search by text">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>

<a class="btn btn-primary mb-2 p-1" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Add new Message
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" required pattern="(\w|\s|\S){0,255}" title="Будь-які символи до 255 штук" class="form-control" name="text" placeholder="Введите сообщение"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
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
        .card{
            background-color: transparent;
            border: none;
        }
        .card-title{
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
        .name-date-wrap{
            width: 50%;
            margin: 0 auto;
            text-align: left;
        }
        .card-name{
            display: inline-block;
            padding: 0 15px 0 10px;
            font-size: 16px;
            font-weight: bold;
            color: #005b8b;
            border-radius: 10px;
        }
        .card-date{
            display: inline-block;
            font-size: 14px;
            font-weight: lighter;
            color: #828382;
        }
        .card-body{
            padding: 5px;
        }
    </style>
<#else>
    No message
</#list>
</div>

</@c.page>