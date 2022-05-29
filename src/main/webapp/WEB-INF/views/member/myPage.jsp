<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-05-29
  Time: 오후 6:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Page</title>
</head>
<body>
<div class="container">
    <h2>My Page</h2>
    <button onclick="location.href='/member/update?id=${sessionScope.loginId}'">회원 정보 수정</button>
</div>
<div class="container">
    <h3>개인 정보</h3>

</div>
</body>
</html>
