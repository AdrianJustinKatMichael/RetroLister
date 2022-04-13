<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Create Ad</title>

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

            <div class="row justify-content-center mb-4">
                <div class="col-9 mt-4">

                    <form id="create-form" class=" bg-light p-5 rounded mb-4">
                        <h1>Create Ad</h1><hr><br>

                        <div class="container">
                            <div class="row mb-5">
                                <div class="col-5">
                                    <div>
                                        <img src="https://via.placeholder.com/200x200.png" />
                                    </div>
                                </div>
                                <div class="col-7">
                                    <div class="input-group mb-4">
                                        <span class="input-group-text"><i class="fa fa-pencil"></i></span>
                                        <input type="text" id="title" name="title" class="form-control shadow" placeholder="Title">
                                    </div>
                                    <div class="input-group mb-4">
                                        <span class="input-group-text"><i class="fa fa-pencil"></i></span>
                                        <input type="text" id="console" name="console" class="form-control shadow" placeholder="Console">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fa fa-pencil"></i></span>
                                        <input type="text" id="post-type" name="post-type" class="form-control shadow" placeholder="Ad Type">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-group mb-4">
                                    <span class="input-group-text"><i class="fa fa-pencil"></i></span>
                                    <textarea type="text" id="description" name="description" class="form-control shadow" placeholder="Description"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="d-flex justify-content-around pt-3">
                                    <button type="submit" class="btn btn-dark" formaction="/create-ad?userId=${sessionScope.user.getId()}" formmethod="post">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>

        </div>

        <%@ include file="partials/foot.jsp" %>
    </body>
</html>