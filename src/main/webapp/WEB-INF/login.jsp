<%--
  Created by IntelliJ IDEA.
  User: Michael-Envy
  Date: 4/9/2022
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Login Page</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic" media="all">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }
        body {
            background: #4a6770;
            width: 100%;
            height: 100vh;
        }
        .container {
            width: 100%;
            height: 100%;
        }
        img {
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <form class="col-6 bg-light d-flex flex-column justify-content-center m-5 p-5 rounded">

        <h1 class="text-center pb-3">Login</h1>

        <div class="d-flex justify-content-center pb-4">
            <img class="rounded-circle" src="/img/img_avatar3.png" />
        </div>

        <div class="input-group mb-4">
            <span class="input-group-text"><i class="fa fa-user"></i></span>
            <input type="text" id="username" name="username" class="form-control" placeholder="Username">
        </div>

        <div class="input-group mb-4">
            <span class="input-group-text"><i class="fa fa-lock"></i></span>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password">
        </div>

        <div class="d-flex justify-content-center pt-3">
            <button type="button" class="btn btn-primary text-light btn-lg" formaction="/login" formmethod="post">Login</button>
        </div>

    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
