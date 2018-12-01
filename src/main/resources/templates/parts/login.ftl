<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Ім'я користувача:</label>
        <div class="col-sm-6">
            <input type="text" name="username" class="form-control" placeholder="Вкажіть ім'я користувача" required pattern="(\w|\s|\S){2,24}" title="Будь-які символи від 2 до 24 штук"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Пароль:</label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Вкажіть пароль" required pattern="(\w|\s|\S){6,24}" title="Будь-які символи від 6 до 24 штук"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm><a href="/registration">Реєстрація</a></#if>
    <button class="btn btn-primary" type="submit"><#if isRegisterForm>Зареєструватися<#else>Вхід</#if></button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit">Вийти</button>
</form>
</#macro>