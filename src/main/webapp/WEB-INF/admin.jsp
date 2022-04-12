<%--
  Created by IntelliJ IDEA.
  User: adrian
  Date: 4/11/22
  Time: 1:56 PM
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
<%@ include file="partials/navbar-online.jsp" %>

<div class="container mt-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-7">
            <div class="card p-3 py-4">
                <div class="text-center mt-3"> <h1 class="header">Admin Panel</h1>
                    <div class="px-4 mt-1">
                        <p class="fonts">Delete User or Make User an Admin. <br>Caution: Deleting a User will remove all Ad Listings associated with that User. </p>
                    </div>
                    <p class="fonts">Select a username: </p>
                    <ul class="actions-list p-0">
                        <li style="list-style: none;">
                            <label>
                                <select name="usernames">
                                    <c:forEach var="user" items="${users}">
                                        <option value="${user.id}">${user.username}</option>
                                    </c:forEach>
                                    <optgroup label=""></optgroup>
                                </select>
                            </label>
                        </li>
                    </ul>
                    <div class="buttons"> <button class="btn btn-outline-primary px-4" onclick="">Delete User</button> <button class="btn btn-primary px-4 ms-3" onclick="">Make Admin</button> </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="partials/foot.jsp" %>
</body>
</html>