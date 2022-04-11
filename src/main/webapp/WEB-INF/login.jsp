<%--
  Created by IntelliJ IDEA.
  User: Michael-Envy
  Date: 4/9/2022
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Login Page</title>

        <%@ include file="/WEB-INF/partials/head.jsp" %>
        <style>
            <%@ include file="/WEB-INF/partials/style.jsp" %>
        </style>
    </head>
    <body>
        <%@ include file="/WEB-INF/partials/navbar-login.jsp" %>

        <div class="container d-flex justify-content-center align-items-center">
            <form id="login-form" class="col-5 bg-light d-flex flex-column justify-content-center px-5 rounded">

                <div class="input-group mb-4 pt-5">
                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                </div>

                <div class="input-group mb-4">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                </div>

                <div class="d-flex justify-content-center pt-3">
                    <button type="submit" class="btn btn-dark" formaction="/login" formmethod="post">Login</button>
                </div>

                <a class="pt-2 text-center">Forgot Password?</a>

            </form>
        </div>

        <%@ include file="/WEB-INF/partials/foot.jsp" %>
    </body>
</html>
