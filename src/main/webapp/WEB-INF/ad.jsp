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
<%@ include file="partials/navbar-complex.jsp" %>
<div class="container d-flex justify-content-center align-items-center">
    <div class="card mb-3">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="${ad.getImageUrl()}" class="img-fluid rounded-start" alt="ad img">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h1 class="card-title">${ad.getTitle()}</h1>
                    <h4 class="card-subtitle mb-2 text-muted">${ad.getConsole()}</h4>
                    <p class="card-text">${ad.getDescription()}</p>
                    <p class="card-text"><small class="text-muted">Listing created by <a href="/profile?id=${creator.getId()}">${creator.getUsername()}</a></small></p>
                </div>
            </div>
        </div>
    </div>
</div>

<a href=""></a>
<%@ include file="/WEB-INF/partials/foot.jsp" %>
</body>
</html>
