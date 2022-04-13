<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-dark navbar-expand-md bg-black justify-content-center">
    <div class="container-fluid">
        <a class="navbar-brand" href="/index">
            <img  id="logo-index" src="/img/logo-pac.png">
        </a>
        <div class="">
            <div class="btn-group dropleft">
                <button class="btn bg-transparent dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                    <i class="px-1 fa fa-user text-white"></i>
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/index">Home</a>
                    <a class="dropdown-item" href="/profile">Profile</a>
                    <a class="dropdown-item" href="/create-ad">Create Ad</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/logout">Logout</a>
                </div>
            </div>
            <c:choose>
                <c:when test="${not empty param.username}">
                     <a class="text-decoration-none" href="/profile">${param.username}</a>
                </c:when>
                <c:otherwise>
                    <a class="text-decoration-none" href="/login">Sign In</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>
