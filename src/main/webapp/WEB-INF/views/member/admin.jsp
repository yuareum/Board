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
    <style>
        body {
            background-image: url("/resources/img/img.jpg");
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2 style="margin-left: 100px">관리자 페이지</h2>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <table class="table">
        <tr>
            <td colspan="4">페이지 정보</td>
        </tr>
        <tr>
            <td>페이지 명</td>
            <td>My Board</td>
            <td>페이지 기능</td>
            <td>회원, 게시판, 댓글, 마이페이지 기능</td>
        </tr>
        <tr>
            <td>회원관리</td>
            <td colspan="3"><button class="btn btn-primary" onclick="location.href='/member/findAll'">회원 목록</button></td>
        </tr>
        <tr>
            <td>게시글관리</td>
            <td colspan="3"><a href="/board/findAll">게시글 목록 이동</a></td>
        </tr>
    </table>
</div>
</body>
</html>
