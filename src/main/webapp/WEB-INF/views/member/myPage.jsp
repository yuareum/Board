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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>My Page</h2>
    <button class="btn btn-outline-dark" onclick="location.href='/member/update?id=${member.id}'">회원 정보 수정</button>
</div>
<div class="container">
    <h3>Profile</h3>
    <img src="${pageContext.request.contextPath}/upload/${member.memberProfileName}"
          alt="" height="150" width="150"><br>
    아이디: <input type="text" class="form-control" value="${member.memberId}" readonly><br>
    비밀번호: <input type="text" class="form-control" value="${member.memberPassword}" readonly><br>
    이름: <input type="text" class="form-control" value="${member.memberName}" readonly><br>
    이메일: <input type="text" class="form-control" value="${member.memberEmail}" readonly><br>
    전화번호:<input type="text" class="form-control" value="${member.memberMobile}" readonly><br>
</div>
</body>
</html>
