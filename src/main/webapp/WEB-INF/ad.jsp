<%--
  Created by IntelliJ IDEA.
  User: kathrynrodriguez
  Date: 4/11/22
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${ad.getTitle()}</title>
    <%@ include file="partials/head.jsp" %>
    <style>
        <%@ include file="partials/style.jsp" %>
    </style>
</head>
<body>
<%@ include file="partials/navbar-online.jsp" %>
<div class="container d-flex justify-content-center align-items-center">
    <div class="col">
        <div class="row d-flex justify-content-center align-items-center">
            <h2>${ad.getTitle()}</h2>
            <h4>${ad.getConsole()}</h4>
            <p>${ad.getDescription()}</p>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/partials/foot.jsp" %>
</body>
</html>
