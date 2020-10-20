<#macro login path isRegisterForm>
<section class="container-fluid">
<section class="row justify-content-center">
<section class="col-12 col-sm-6 col-md-3">

<form class="form-container"action="${path}" method="post">
    <div class="box">
    <div class="form-group">
        <div class="inputBox">
            <input type="text" name="username" required="" value="<#if user??>${user.username}</#if>"
                   class="form-control ${(usernameError??)?string('is-invalid', '')}"/>
                   <label>Username</label>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group">
        <div class="inputBox">
            <input type="password" name="password" required=""
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"/>
                   <label>Password:</label>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
    </div>
    <#if isRegisterForm>
        <div class="form-group">
            <div class="inputBox">
                <input type="password" name="password2" required=""
                       class="form-control ${(password2Error??)?string('is-invalid', '')}"/>
                       <label>Password:</label>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group">

            <div class="inputBox">
                <input type="email" name="email" required="" value="<#if user??>${user.email}</#if>"
                       class="form-control ${(emailError??)?string('is-invalid', '')}"/>
                       <label>Email:</label>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="g-recaptcha" data-sitekey="6LdXudgZAAAAAKJJLVi9OvmKNjJTHoNGI9d7KDqZ"></div>
            <#if captchaError??>
                <div class="alert alert-danger" role="alert">
                    ${captchaError}
                </div>
            </#if>
        </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />

    <button class="btn btn-primary btn-block" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
    <#if !isRegisterForm><div>Don`t have account? <a href="/registration">Sing in!</a></#if></div>
    </div>
</form>
</section>
</section>
</section>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit">Sign Out</button>
</form>
</#macro>