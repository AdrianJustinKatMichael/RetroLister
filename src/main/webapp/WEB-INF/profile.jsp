<%--
  Created by IntelliJ IDEA.
  User: Michael-Envy
  Date: 4/9/2022
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Profile Page</title>

        <%@ include file="partials/head.jsp" %>
        <style>
            <%@ include file="partials/style.jsp" %>
        </style>

    </head>
    <body>

    <jsp:include page="/WEB-INF/partials/navbar-complex.jsp">
        <jsp:param name="username" value="${username}" />
    </jsp:include>

    <div class="container">

        <div class="row">

            <div class="col-4 d-flex justify-content-end pt-4">
                <div class="d-flex flex-column align-items-center">
                    <img class="profile-img rounded-circle mt-4" src="https://via.placeholder.com/300x300.png" />
                    <ul class="list-group border-0 bg-transparent mt-2" style="width: 200px;">
                        <li class="list-group-item border-0 bg-transparent"><a class="text-decoration-none" href="/profile">Account Information</a></li>
                        <li class="list-group-item border-0 bg-transparent"><a class="text-decoration-none" href="/profile-posts">Posts</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-8">
                <div class="container-fluid mt-4">
                    <div class="row mb-3">
                        <div class="col">
                            <div class="d-flex justify-content-end">
                                <button class="btn btn-light" type="button" value="Edit"><i class="fa fa-pencil px-1"></i>Edit</button>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <div class="container d-flex justify-content-center align-items-center">
                                <form id="profile-form" class="col-9 bg-light d-flex flex-column justify-content-center p-5 rounded">

                                    <div class="input-group mb-4">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                        <input type="text" id="username" name="username" class="form-control shadow " placeholder="Username">
                                    </div>

                                    <div class="input-group mb-4">
                                        <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                        <input type="email" id="email" name="email" class="form-control shadow" placeholder="Email">
                                    </div>

                                    <div class="input-group mb-4">
                                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                        <input type="password" id="password-current" name="password-current" class="form-control shadow" placeholder="Current Password">
                                    </div>

                                    <div class="input-group mb-4">
                                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                        <input type="password" id="password-new" name="password-new" class="form-control shadow" placeholder="New Password">
                                    </div>

                                    <div class="input-group mb-4">
                                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                        <input type="password" id="password-confirm" name="password-confirm" class="form-control shadow" placeholder="Confirm Password">
                                    </div>

                                    <div class="d-flex justify-content-around pt-3">
                                        <button type="button" class="btn btn-dark" formaction="/profile" formmethod="post">Update</button>
                                        <button type="button" class="btn btn-dark" formaction="/profile" formmethod="post">Cancel</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <div class="d-flex justify-content-end mt-2">
                                <button class="btn btn-light" type="button" value="Edit"><i class="fa fa-trash px-1"></i>Delete Profile</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="partials/foot.jsp" %>
    </body>
</html>
