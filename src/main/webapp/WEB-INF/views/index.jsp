<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>시작페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const saveForm = () => {
            location.href = "/member/save-form";
        }
        const loginForm = () => {
            location.href = "/member/loginForm";
        }
        const paging = () => {
            location.href = "/board/paging"
        }
    </script>
</head>
<body>
    <button class="btn btn-primary" onclick="saveForm()">회원가입</button>
    <button class="btn btn-primary" onclick="loginForm()">로그인</button>
    <button class="btn btn-primary" onclick="paging()">글목록</button>
</body>
</html>
