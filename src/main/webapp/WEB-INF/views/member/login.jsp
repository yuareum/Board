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
    <style>
        body{
            min-height: 80vh;
            background-color: #f2f3ff;
        }
        .container {
            max-width: 1000px;
            margin-top: 200px;
            width: 400px;
            height: 350px;
            padding: 30px;
            background-color: white;
            border: black;
            border-radius: 10px;
        }
        .form-control {
            width: 350px;
            height: 50px;
        }
        .login {
            font-size: 30px;
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="login">Login</h2>
        <form action="/member/login" method="post">
            <div style="font-size: 15px;">로그인 정보를 입력해주세요</div>
            <input type="text"  id="memberId" class="form-control" name="memberId" placeholder="아이디">
            <input type="password" id="memberPassword"class="form-control" name="memberPassword" placeholder="비밀번호"><br>
            <input type="button" class="w-100 btn btn-lg btn-primary" onclick="location.href='/'" value="Home">
            <input type="submit" class="w-100 btn btn-lg btn-outline-primary" value="로그인">
        </form>
    </div>
</body>
</html>
