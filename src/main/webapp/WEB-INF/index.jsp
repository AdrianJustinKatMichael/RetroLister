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

        <title>Index Page</title>

        <%@ include file="partials/head.jsp" %>
        <style>
            <%@ include file="partials/style.jsp" %>
        </style>

    </head>
    <body>

        <jsp:include page="/WEB-INF/partials/navbar-index.jsp">
            <jsp:param name="username" value="${username}" />
        </jsp:include>

        <div class="jumbotron jumbotron-fluid">
            <img id="splash" src="https://via.placeholder.com/1200x300.png" />
        </div>

        <div class="d-flex flex-row justify-content-center">
            <div class="m-5">
                <img class="feature" src="https://via.placeholder.com/250x200.png" />
            </div>
            <div class="m-5">
                <img class="feature" src="https://via.placeholder.com/250x200.png" />
            </div>
            <div class="m-5">
                <img class="feature" src="https://via.placeholder.com/250x200.png" />
            </div>
        </div>

        <div class="input-group w-75 mx-auto p-2 border-0 bg-light">
            <input type="text" class="form-control" id="search-bar" placeholder="Title or Console">
            <select class="custom-select" id="search-filter">
                <option value="all" selected>All</option>
                <option value="title">Title</option>
                <option value="console">Console</option>
            </select>
        </div>

        <div class="d-flex flex-column align-items-center my-4">
            <div id="list" class="overflow-auto">
                <c:forEach var="ad" items="${ads}">
                        <div class="card border-0" style="max-width: 540px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img class="card-img" src="https://via.placeholder.com/200x200.png" />
                                </div>
                                <div class="col-md-8">
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
            </div>
        </div>

        <iframe id="frame" src="/list" title="List"></iframe>

        <footer></footer>

        <%@ include file="partials/foot.jsp" %>
        <script>
            let searchFilter = document.querySelector('#search-filter');
            let searchField = document.querySelector('#search-bar');

            let renderAds = (list) => {

            }
            let searchAds = (e) => {
                e.preventDefault();

                let filter = searchFilter.value;

                $.post('/index').done((data) => {
                    let filteredAds = [];

                    switch (filter) {
                        case 'all': filteredAds = data; break;
                        case 'title':
                            data.forEach(ad => {
                                if (ad.title.toLowerCase().includes(searchField.value.toLowerCase())) {
                                    filteredAds.push(ad);
                                }
                            })
                            break;
                        case 'console':
                            data.forEach(ad => {
                                if (ad.console.toLowerCase().includes(searchField.value.toLowerCase())) {
                                    filteredAds.push(ad);
                                }
                            })
                            break;
                    }

                    console.log(filteredAds);
                    renderAds(filteredAds)
                });

            }

            searchField.addEventListener('keyup', searchAds);

            // $('.custom-select option').click(function() {
            //     let filter = $(this).val();
            //     console.log(`\${filter}`);
            //
            //     switch (filter) {
            //         case 'all':
            //             break;
            //         case 'title':
            //             break;
            //         case 'console':
            //             break;
            //     }
            // });
<%--

            $('.dropdown-menu a').click(function(){

                let filter = $(this)[0].innerHTML;
                let query = $(this)[0].parentElement.parentElement.parentElement.firstElementChild.value;

                console.log(filter);
                console.log(query);

                <%! String filter; %>
                <% filter = request.getParameter("filter"); %>
                <%! String query; %>
                <% query = request.getParameter("query"); %>
                <% request.setAttribute("filter", filter); %>
                <% request.setAttribute("query", query); %>

                let element = document.querySelector('#list');
                element.innerHTML = `
                <h1><%= filter %></h1>
                    <c:forEach var="ad" items="${ads}">
                        <c:if test="${filter.equals(query)}">
                            <div class="card border-0" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <img class="card-img" src="https://via.placeholder.com/200x200.png" />
                                    </div>
                                    <div class="col-md-8">
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
                        </c:if>
                    </c:forEach>
                `;
                console.log(element);
            });
--%>
        </script>
    </body>
</html>
