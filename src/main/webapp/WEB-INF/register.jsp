<%--
  Created by IntelliJ IDEA.
  User: Michael-Envy
  Date: 4/9/2022
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Registration Page</title>

        <%@ include file="/WEB-INF/partials/head.jsp" %>
        <%@ include file="/WEB-INF/partials/style.jsp" %>
    </head>
    <body>
        <%@ include file="/WEB-INF/partials/navbar.jsp" %>

        <div class="container d-flex justify-content-center align-items-center">
            <form id="register-form" class="col-5 bg-light d-flex flex-column justify-content-center p-5 rounded">

                <h1 class="text-center pb-4">Sign Up</h1>

                <div class="input-group mb-4">
                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                </div>

                <div class="input-group mb-4">
                    <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Email">
                </div>

                <div class="input-group mb-4">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                </div>

                <div class="input-group mb-4">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    <input type="password" id="password-repeat" name="password-repeat" class="form-control" placeholder="Repeat Password">
                </div>

                <div class="d-flex justify-content-center pt-3">
                    <button type="submit" class="btn btn-dark" formaction="/register" formmethod="post">Register</button>
                </div>

            </form>
        </div>

        <%@ include file="/WEB-INF/partials/foot.jsp" %>
    </body>
</html>
