
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-dark navbar-expand-md bg-black justify-content-center">
    <div class="container-fluid">
        <a class="navbar-brand" href="/index">
            <div id="logo-index"></div>
        </a>
        <div class="">
            <a class="text-decoration-none" href="/login">
                <c:choose>
                    <c:when test="${not empty param.username}">
                        ${param.username}
                    </c:when>
                    <c:otherwise>
                        Sign In
                    </c:otherwise>
                </c:choose>
                <i class="px-1 fa fa-user text-white"></i>
            </a>
        </div>
    </div>
</nav>
