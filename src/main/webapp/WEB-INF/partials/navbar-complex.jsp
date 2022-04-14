<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-dark navbar-expand-md bg-black justify-content-center">
    <div class="container-fluid">
        <a class="navbar-brand" href="/index">
            <img  id="logo-index" src="/img/logo-pac.png">
        </a>
        <div class="">
            <div class="btn-group dropstart">
                <button class="btn bg-transparent dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
                    <i class="px-1 fa fa-user text-white"></i>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/index">Home</a></li>
                    <li><a class="dropdown-item" href="/profile">Profile</a></li>
                    <li><a class="dropdown-item" href="/create-ad">Create Ad</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/logout">Logout</a></li>
                </ul>
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
