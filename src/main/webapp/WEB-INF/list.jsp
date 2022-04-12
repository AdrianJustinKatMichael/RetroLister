<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@ include file="partials/head.jsp" %>
        <style>
            <%@ include file="partials/style.jsp" %>
        </style>
    </head>
    <body>

                <c:forEach var="ad" items="${ads}">
                    <div class="card border-0" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-4">
                                <img class="card-img" src="https://via.placeholder.com/200x200.png" />
                            </div>
                            <div class="col-8">
                                <div class="card-body bg-secondary text-light">
                                    <div class="row">
                                        <h3 class="col">${ad.getTitle()}</h3>
                                        <c:choose>
                                            <c:when test="${ad.getPostType() == 'reqeust'}">
                                                <span class="col-5 text-success">${ad.getPostType()}</span>
                                            </c:when>
                                            <c:when test="${ad.getPostType() == 'post'}">
                                                <span class="col-4 text-danger">${ad.getPostType()}</span>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    <div class="row pt-2">
                                        <h6 class="col">${ad.getConsole()}</h6>
                                    </div>
                                    <p class="card-text">${ad.getDescription()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

        <%@ include file="partials/foot.jsp" %>
    </body>
</html>