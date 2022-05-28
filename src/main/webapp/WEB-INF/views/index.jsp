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
    <title>시작페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const saveForm = () => {
            location.href = "/member/save";
        }
        const loginForm = () => {
            location.href = "/member/login";
        }
        const boardList = () => {
            location.href = "/board/findAll"
        }
        const logout = () => {
            location.href = "/member/logout"
        }
        const boardSave = () => {
            <c:if test="${!empty sessionScope.loginMemberId}">
            location.href = "/board/save"
            </c:if>
            <c:if test="${empty sessionScope.loginMemberId}">
            location.href = "/member/login"
            </c:if>
        }
        const admin = () => {
            location.href = "/member/admin"
        }
    </script>
</head>
<body>
    <c:if test="${sessionScope.loginMemberId == null}">
    <button class="btn btn-primary" onclick="saveForm()">회원가입</button>
    </c:if>

    <c:if test="${sessionScope.loginMemberId == null}">
    <button class="btn btn-primary" id="loginCheck" onclick="loginForm()">로그인</button>
    </c:if>

    <button class="btn btn-primary" onclick="boardList()">글목록</button>

    <button class="btn btn-primary" onclick="boardSave()">글작성</button>

    <c:if test="${sessionScope.loginMemberId != null}">
        <button class="btn btn-danger" onclick="logout()">로그아웃</button>
    </c:if>
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <button class="btn btn-outline-info" onclick="admin()">관리자 페이지로 이동</button>
    </c:if>
</body>
</html>
