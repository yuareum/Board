<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>login</h2>
    <form action="/member/login" method="post">
        <input type="text" class="form-control" name="memberId" placeholder="아이디"><br>
        <input type="password" class="form-control" name="memberPassword" placeholder="비밀번호"><br>
        <input type="button" class="btn btn-primary" onclick="location.href='/'" value="Home">
        <input type="submit" class="btn btn-outline-info" value="login">
    </form>
</div>
</body>
</html>
