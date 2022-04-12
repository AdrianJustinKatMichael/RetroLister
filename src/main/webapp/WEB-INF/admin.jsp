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
<%@ include file="partials/navbar-complex.jsp" %>

<%--<select class="form-select form-select-sm" aria-label=".form-select-sm">--%>
<%--    <c:forEach var="user" items="${users}">--%>
<%--        <option>${user.username}</option>--%>
<%--    </c:forEach>--%>
<%--</select>--%>

<div>
    <label class="title">Select a username: <br></label>
    <label>
        <select name="usernames">
            <c:forEach var="user" items="${users}">
                <option value="${user.id}">${user.username}</option>
            </c:forEach>

            <optgroup label=""></optgroup>
        </select>
    </label>
</div>
<%@ include file="partials/foot.jsp" %>
</body>
</html>