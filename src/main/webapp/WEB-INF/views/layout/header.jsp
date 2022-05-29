<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <div class="container">
        <header class="d-flex justify-content-center py-3">
            <ul class="nav nav-pills">
                <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
                <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
                <li class="nav-item"><a href="#" class="nav-link">About</a></li>
            </ul>
        </header>
    </div>
    <header>
        <a href="/">Home</a>
        <c:if test="${empty sessionScope.loginMemberId}">
            <a href="/member/save">회원가입</a>
        </c:if>&nbsp;
        <c:if test="${empty sessionScope.loginMemberId}">
            <a href="/member/login">로그인</a>
        </c:if>
        <a href="/board/findAll">글목록</a>
        <c:if test="${!empty sessionScope.loginMemberId}">
            <a href="/member/logout">로그아웃</a>
        </c:if>
        <c:if test="${!empty sessionScope.loginMemberId}">
            <a href="/member/myPage">My Page</a>
        </c:if>
    </header>
</head>
<body>
</body>
</html>
