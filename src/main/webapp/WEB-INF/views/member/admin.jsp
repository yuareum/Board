<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>관리자 페이지</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <h2>관리자 페이지</h2>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <button class="btn btn-primary" onclick="location.href='/member/findAll'">회원 목록으로 이동</button>
</body>
</html>
