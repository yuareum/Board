<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-05-28
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 정보 조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>상세 조회</h2>
<div class="container">
    <button class="btn btn-info" onclick="location.href='/member/findAll'">회원목록</button>
    <table class="table">
        <tr>
            <td>회원번호</td>
            <td>아이디</td>
            <td>비밀번호</td>
            <td>이름</td>
            <td>이메일</td>
            <td>전화번호</td>
            <td>프로필사진</td>
        </tr>
        <tr>
            <td>${member.id}</td>
            <td>${member.memberId}</td>
            <td>${member.memberPassword}</td>
            <td>${member.memberName}</td>
            <td>${member.memberEmail}</td>
            <td>${member.memberMobile}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${member.memberProfileName}"
                     alt="" height="100" width="100"></td>
        </tr>
    </table>
</div>
</body>
</html>