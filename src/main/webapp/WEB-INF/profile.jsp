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

    <title>${profileUser.getUsername()}'s Page</title>

    <%@ include file="partials/head.jsp" %>
    <style>
        <%@ include file="partials/style.jsp" %>
    </style>

</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar-complex.jsp">
    <jsp:param name="username" value="${username}"/>
</jsp:include>

<div class="container">
    <div class="row">
        <div class="col-4 d-flex justify-content-end pt-4">
            <div class="d-flex flex-column align-items-center">
                <img class="profile-img border-dark bg-light p-3 rounded-circle mt-4" src="https://i.pravatar.cc/300"/>
                <ul class="list-group border-0 bg-transparent mt-4" style="width: 200px;">
                    <li class="list-group-item border-0 bg-light"><a
                            class="text-decoration-none text-dark">${profileUser.getUsername()}</a></li>
                    <c:if test='${canEdit.equals(true)}'>
                        <li class="list-group-item border-0 bg-light">
                            <button type="button" class="editUserButton btn btn-outline-success btn-sm"
                                    data-bs-toggle="modal" data-bs-target="#editUserModal">
                                Edit account info
                            </button>
                        </li>
                        <li class="list-group-item border-0 bg-light">
                            <button type="button" class="deleteUserButton btn btn-outline-danger btn-sm"
                                    data-bs-toggle="modal" data-bs-target="#deleteUserModal">
                                Delete account
                            </button>
                        </li>
                    </c:if>
                    <c:if test='${admin.equals("true")}'>
                        <li class="list-group-item border-0 bg-light"><a class="text-decoration-none text-dark"
                                                                         href="/admin">Admin Page</a></li>
                    </c:if>
                </ul>
            </div>
        </div>

        <div class="col-7">
            <div class="card mt-3 mb-3 justify-content-center align-items-center">
                <h2>${profileUser.getUsername()}'s ad listings</h2>
            </div>
            <c:forEach var="ad" items="${profileAds}">
                <div class="card mb-3">
                    <a class="text-decoration-none text-dark" href="/ad?id=${ad.id}">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="${ad.getImageUrl()}" class="img-fluid rounded-start" alt="ad img">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h1 class="card-title">${ad.getTitle()}</h1>
                                    <h4 class="card-subtitle mb-2 text-muted">${ad.getConsole()}</h4>
                                    <p class="card-text">${ad.getDescription()}</p>
                                    <span class="text-muted text-right">Post: ${ad.getPostType()}</span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<%-- modals go here --%>
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Edit account information</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>WARNING: To update account information, you will be logged out and required to log back in with the
                    newly updated information to see your changes.</p>
                <form id="profile-form" class="row">
                    <div class="col-12 input-group mb-4">
                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                        <input type="text" id="username" name="username" class="form-control shadow "
                               placeholder="Username" value="${profileUser.getUsername()}">
                    </div>

                    <div class="col-12 input-group mb-4">
                        <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                        <input type="email" id="email" name="email" class="form-control shadow" placeholder="Email"
                               value="${profileUser.getEmail()}">
                    </div>

                    <div class="col-12 input-group mb-4">
                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                        <input type="password" id="password-current" name="password-current" class="form-control shadow"
                               placeholder="Enter current Password">
                    </div>

                    <div class="col-12 input-group mb-4">
                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                        <input type="password" id="password-new" name="password-new" class="form-control shadow"
                               placeholder="Enter new Password">
                    </div>

                    <div class="col-12 input-group mb-4">
                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                        <input type="password" id="password-confirm" name="password-confirm" class="form-control shadow"
                               placeholder="Confirm new Password">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" id="editUserButton" name="editUserButton" class="btn btn-primary"
                                formaction="/profile"
                                formmethod="post">Update
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteUserModalLabel">Delete account?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you wish to delete your account?<br><br>All ad listings you have created will also be
                    deleted, and you will need to create a new account to continue using RetroLister.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <form action="${pageContext.request.contextPath}/profile" method="post">
                    <button type="submit" class="btn btn-danger" name="delete-button" formaction="/profile"
                            formmethod="post">Delete account
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="partials/foot.jsp" %>

</body>
</html>
