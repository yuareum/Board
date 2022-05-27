<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-05-27
  Time: 오후 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 정보 조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .container{
            max-width: 1000px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <h2>조회한 회원 정보</h2>
    <div class="container">
        <table class="table">
            <tr>
                <td>회원번호</td>
                <td>아이디</td>
                <td>비밀번호</td>
                <td>이름</td>
                <td>이메일</td>
                <td>프로필사진</td>
            </tr>
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td><img src="${pageContext.request.contextPath}/upload/${member.memberProfileName}"
                         alt="" height="100" width="100"></td>
            </tr>
        </table>
    </div>
</body>
</html>
