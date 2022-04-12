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
            <input type="text" class="form-control shadow-none" id="search-bar" placeholder="Title or Console">
            <select class="custom-select" id="search-filter">
                <option value="description" selected>Description</option>
                <option value="title">Title</option>
                <option value="console">Console</option>
            </select>
        </div>

        <div class="d-flex flex-column align-items-center my-4">
            <div id="list-2" class="overflow-auto"></div>
        </div>

        <footer></footer>

        <%@ include file="partials/foot.jsp" %>
        <script>
            let searchFilter = document.querySelector('#search-filter');
            let searchField = document.querySelector('#search-bar');
            let listSpace = document.querySelector('#list-2');

            $.post('/index').done((data) => {
                listSpace.innerHTML = buildAdsList(data);
            });

            let buildAd = (ad) => {
                let html = `
                    <div class="test card flex-row border-0">
                        <img class="" src="https://via.placeholder.com/200x200.png"/>
                        <div class="card-body">
                            <h3 class="card-title">\${ad.title}</h3>
                            <h6 class="card-text">\${ad.console}</h6>
                            <p class="card-text">\${ad.description}</p>
                            <span class="text-muted text-right">Post: \${ad.postType}</span>
                        </div>
                    </div>
                `;
                return html;
            }
            let buildAdsList = (list) => {
                let html = '';
                for (let i = 0; i < list.length; i++) {
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

            searchField.addEventListener('keyup', searchAds);
        </script>
    </body>
</html>
