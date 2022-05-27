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
    <header>
        <a href="/">Home</a>
        <c:if test="${sessionScope.loginMemberId == null}">
            <a href="/member/save-form">회원가입</a>
        </c:if>&nbsp;
        <c:if test="${sessionScope.loginMemberId == null}">
            <a href="/member/login-form">로그인</a>
        </c:if>
        <a href="/board/boardList">글목록</a>
        <c:if test="${sessionScope.loginMemberId != null}">
            <a href="/member/logout">로그아웃</a>
        </c:if>
    </header>
</head>
<body>

</body>
</html>
