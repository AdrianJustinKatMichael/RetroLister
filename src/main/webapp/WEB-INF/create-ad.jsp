<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Create Ad</title>
</head>
<body>
<h1>Create Ad</h1>
  <%-- Send id of saved session User as parameter --%>
  <form action="/create-ad?userId=${sessionScope.user.getId()}" method="POST">
    <label for="title">Title</label>
    <input type="text" id="title" name="title"><br>

    <label for="console">Console</label>
    <input type="text" id="console" name="console"><br>

    <label for="post-type">Type</label>
    <input type="text" id="post-type" name="post-type"><br>

    <label for="description">Description</label><br>
    <textarea id="description" name="description" rows="10" cols="30"></textarea>

    <input type="submit" value="Create Ad">
  </form>
</body>
</html>