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

        <%@ include file="WEB-INF/partials/head.jsp" %>
        <style>
            <%@ include file="WEB-INF/partials/style.jsp" %>
        </style>

    </head>
    <body>

        <jsp:include page="/WEB-INF/partials/navbar-complex.jsp">
            <jsp:param name="username" value="${username}" />
        </jsp:include>

        <c:choose>
            <c:when test="${not empty username}">
                <% request.setAttribute("status", "online"); %>
            </c:when>
            <c:otherwise>
                <% request.setAttribute("status", "offline"); %>
            </c:otherwise>
        </c:choose>

        <div class="jumbotron jumbotron-fluid mb-4 jumbo-shadow">
            <img id="splash" src="img/splash.png" />
        </div>

        <c:if test="${not empty username}">
            <div class="input-group w-75  mb-4 mx-auto p-2 border-0 bg-light shadow">
                <input type="text" class="form-control shadow-none" id="search-bar" placeholder="Title or Console">
                <select class="custom-select" id="search-filter">
                    <option value="description" selected>Description</option>
                    <option value="title">Title</option>
                    <option value="console">Console</option>
                </select>
            </div>
        </c:if>

        <div class="container-fluid mb-4">
            <div class="row">
                <div class="col mx-5">
                    <div id="index-game-list"></div>
                </div>
            </div>
        </div>

        <footer class="text-center text-white">
            <div class="container pt-4">
                <section class="mb-4">
                    <a class="btn btn-link btn-floating btn-lg m-1" href="#!" style="color: #526dff"><i class="fa fa-facebook-f"></i></a>
                    <a class="btn btn-link btn-floating btn-lg m-1" href="#!" style="color: #526dff"><i class="fa fa-twitter"></i></a>
                    <a class="btn btn-link btn-floating btn-lg m-1" href="#!" style="color: #526dff"><i class="fa fa-google"></i></a>
                    <a class="btn btn-link btn-floating btn-lg m-1" href="#!" style="color: #526dff"><i class="fa fa-instagram"></i></a>
                    <a class="btn btn-link btn-floating btn-lg m-1" href="#!" style="color: #526dff"><i class="fa fa-linkedin"></i></a>
                    <a class="btn btn-link btn-floating btn-lg m-1" href="#!" style="color: #526dff"><i class="fa fa-github"></i></a>
                </section>
            </div>
            <div class="text-center p-3">
                <span class="text-light">
                    <span style="color: #ffcf28">©</span> 2022
                    <a class="text-dark text-decoration-none" href="/index">Privacy Policy</a>
                </span>
                <span class="q-px-xs" style="color: #ffcf28">•</span>
                <span><a class="text-dark text-decoration-none" href="/index">Terms of Service</a></span>
                <span class="q-px-xs" style="color: #ffcf28">•</span>
                <span><a class="text-dark text-decoration-none" href="/index">Affiliate Agreement </a></span>
            </div>
        </footer>

        <%@ include file="WEB-INF/partials/foot.jsp" %>
        <script>
            (() => {
                //--| Search-Bar: Instance Variables
                let searchFilter = document.querySelector('#search-filter');
                let searchField = document.querySelector('#search-bar');
                let listSpace = document.querySelector('#index-game-list');

                //--| Search-Bar: Functions
                let buildAd = (ad) => {
                    let html = `
                        <a class="card flex-row border-0 text-decoration-none shadow" href="/ad?id=\${ad.id}">
                            <img class="" src="\${ad.imageUrl}"/>
                            <div class="card-body overflow-auto">
                                <h3 class="card-title text-black text-shadow">\${ad.title}</h3>
                                <h6 class="card-text text-muted text-shadow">\${ad.console}</h6>
                                <p class="card-text text-black text-shadow">\${ad.description}</p>
                                <div class="text-muted text-right subscript">Post: \${ad.postType}</div>
                            </div>
                        </a>
                    `;
                    console.log(ad.imageUrl);
                    return html;
                }
                let buildAdsList = (list) => {
                    let limit = 0;
                    if ('${status}' === 'online') limit = list.length;
                    else limit = 5;

                    let html = '';
                    for (let i = 0; i < limit; i++) {
                        html += buildAd(list[i]);
                    }
                    return html;
                }
                let searchAds = (e) => {
                    e.preventDefault();

                    let filter = searchFilter.value;

                    $.post('/index').done((data) => {
                        let filteredAds = [];

                        switch (filter) {
                            case 'description':
                                data.forEach(ad => {
                                    if (ad.description.toLowerCase().includes(searchField.value.toLowerCase())) {
                                        filteredAds.push(ad);
                                    }
                                })
                                break;
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
                        listSpace.innerHTML = buildAdsList(filteredAds);
                    });
                }

                //--| Search-Bar: Event-listener
                if (searchField) searchField.addEventListener('keyup', searchAds);

                //--| Search-Bar: Initial Call
                $.post('/index').done((data) => {
                    listSpace.innerHTML = buildAdsList(data);
                });
            })();
        </script>
    </body>
</html>
