<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>

<div class="b-example-divider"></div>

<div class="container">
    <div class="container">
        <header class="d-flex justify-content-center py-3">
            <ul class="nav nav-pills">
                <li class="nav-item"><a href="/" class="nav-link active" aria-current="page">Home</a></li>
                <c:if test="${empty sessionScope.loginMemberId}">
                <li class="nav-item"><a href="/member/save" class="nav-link">회원가입</a></li>
                </c:if>
                <li class="nav-item"><a href="/board/findAll" class="nav-link">글 목록</a></li>
                <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                    <li class="nav-item"><a href="/member/admin" class="nav-link">관리자 페이지</a></li>
                </c:if>
                <c:if test="${!empty sessionScope.loginMemberId}">
                <li class="nav-item"><a href="/board/myPage?id=${sessionScope.loginId}" class="nav-link">My Page</a></li>
                </c:if>
                <c:if test="${empty sessionScope.loginMemberId}">
                    <li class="nav-item"><a href="/member/login" class="nav-link">Login</a></li>
                </c:if>
                <c:if test="${!empty sessionScope.loginMemberId}">
                    <li class="nav-item"><a href="/member/logout" class="nav-link">Logout</a></li>
                </c:if>
            </ul>
        </header>
    </div>
</div>
</body>
</html>
