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

        <title>Index Page</title>

        <%@ include file="partials/head.jsp" %>
        <style>
            <%@ include file="partials/style.jsp" %>
        </style>

    </head>
    <body>
    <%@ include file="partials/navbar-index.jsp" %>

    <div class="jumbotron jumbotron-fluid">
        <img id="splash" src="https://via.placeholder.com/1200x300.png" />
    </div>

    <div class="d-flex flex-row justify-content-center">
        <div class="m-5">
            <img class="feature" src="https://via.placeholder.com/250x200.png" />
        </div>
        <div class="m-5">
            <img class="feature" src="https://via.placeholder.com/250x200.png" />
        </div>
        <div class="m-5">
            <img class="feature" src="https://via.placeholder.com/250x200.png" />
        </div>
    </div>

    <div class="row">
        <div class="col-5">
            <div id="search-index" class="input-group w-75 ms-auto p-2 border-0 bg-light">
                <input type="text" class="form-control" placeholder="Search">
                <div class="input-group-append">
                    <button class="btn btn-secondary dropdown-toggle shadow-none" type="button" data-toggle="dropdown">Name</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                        <div role="separator" class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Separated link</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-7 d-flex flex-column">
            <c:forEach var = "i" begin = "1" end = "4">
                <div class="card border-0 mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img class="card-img" src="https://via.placeholder.com/200x200.png" />
                        </div>
                        <div class="col-md-8">
                            <div class="card-body bg-secondary text-light">
                                <div class="row">
                                    <h3 class="col">Title</h3>
                                    <button class="btn btn-light btn-sm col-3 mx-2" type="submit">Request</button>
                                </div>
                                <div class="row pt-2">
                                    <h6 class="col">Console</h6>
                                    <div class="price col-3">$10.00</div>
                                </div>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut ultrices nibh, vel tincidunt arcu. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>

    <footer></footer>

    <%@ include file="partials/foot.jsp" %>
    </body>
</html>
