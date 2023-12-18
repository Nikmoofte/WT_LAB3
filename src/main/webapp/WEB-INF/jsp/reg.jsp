<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<tags:links pageTitle="REG">
<tags:header />
<div class="mt-3 p-5">
    <form name="reg" action="/registration" method="POST" class="p-2 border rounded border-dark">
        <input type="hidden" name="command" value="REG_COMMAND" />
        <div class="form-group row mb-3">
            <label for="name" class="col-5 col-form-label">Name</label>
            <div class="col-7">
                <input id="name" name="name" type="text" required="required" class="form-control">
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="surname" class="col-5 col-form-label">Surname</label>
            <div class="col-7">
                <input id="surname" name="surname" type="text" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="login" class="col-5 col-form-label">Login</label>
            <div class="col-7">
                <div class="input-group">

                    <input id="login" name="login" type="text" required="required" class="form-control">
                </div>
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="password" class="col-5 col-form-label">Password</label>
            <div class="col-7">
                <input id="password" name="password" type="password" required="required" class="form-control">
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="email" class="col-5 col-form-label">Email</label>
            <div class="col-7">
                <div class="input-group">
                    <input id="email" name="email" type="email" class="form-control">
                </div>
            </div>

        </div>
        <div class="form-group row">
            <div class="offset-5 col-7">
                <button name="submit" type="submit" class="btn btn-primary">Sing In</button>
            </div>
        </div>
    </form>
</div>

</tags:links>