<%--
  Created by IntelliJ IDEA.
  User: kathrynrodriguez
  Date: 4/11/22
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${ad.getTitle()}</title>
    <%@ include file="partials/head.jsp" %>
    <style>
        <%@ include file="partials/style.jsp" %>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar-complex.jsp">
    <jsp:param name="username" value="${username}"/>
</jsp:include>
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
                    <p class="card-text"><small class="text-muted">Listing created by <a
                            href="/profile?id=${creator.getId()}">${creator.getUsername()}</a></small></p>
                </div>
            </div>
            <c:if test='${canEdit.equals(true)}'>
                <div class="card-footer text-end">
                    <button class="editAdButton btn btn-outline-success btn-sm" data-bs-toggle="modal"
                            data-bs-target="#editAdModal">Edit
                    </button>
                    <button class="deleteAdButton btn btn-outline-danger btn-sm" data-bs-toggle="modal"
                            data-bs-target="#deleteAdModal">Delete
                    </button>
                </div>
            </c:if>
        </div>
    </div>
</div>

<%-- modals --%>
<div class="modal fade" id="editAdModal" tabindex="-1" aria-labelledby="editAdModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editAdModalLabel">Edit ad</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="ads-form" action="/ad" method="post">
                    <div class="container">
                        <div class="row mb-5">
                            <div class="col-5">
                                <div>
                                    <img src="https://via.placeholder.com/200x200.png"/>
                                </div>
                            </div>
                            <div class="col-7">
                                <div class="input-group mb-4">
                                    <span class="input-group-text"><i class="fa fa-pencil"></i></span>
                                    <input type="text" id="title" name="updateTitle" class="form-control shadow"
                                           placeholder="Title" value="${ad.getTitle()}">
                                </div>
                                <div class="input-group mb-4">
                                    <span class="input-group-text"><i class="fa fa-pencil"></i></span>
                                    <input type="text   " id="console" name="updateConsole" class="form-control shadow"
                                           placeholder="Console" value="${ad.getConsole()}">
                                </div>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-pencil"></i></span>
                                    <input type="text" id="ad-type" name="updatePostType" class="form-control shadow"
                                           placeholder="Ad Type" value="${ad.getPostType()}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group mb-4">
                                <span class="input-group-text"><i class="fa fa-pencil"></i></span>
                                <textarea id="description" name="updateDescription" class="form-control shadow"
                                          placeholder="Description">${ad.getDescription()}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" name="updateAdButton" class="btn btn-primary">
                            Update
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteAdModal" tabindex="-1" aria-labelledby="deleteAdModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteAdModalLabel">Delete ad?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you wish to delete this ad?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <form action="/ad" method="post">
                    <button type="submit" name="deleteAdButton" class="btn btn-danger">Delete ad</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/partials/foot.jsp" %>
</body>
</html>
