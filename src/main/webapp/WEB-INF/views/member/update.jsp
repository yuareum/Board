<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-05-30
  Time: 오전 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>회원 정보 수정</title>
    <style>
        .form-control {
            width: 500px;
            height: 30px;
        }
        .btn {
            width: 80px;
            height: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>회원 정보 수정</h2>
    <form action="/member/update" method="post" name="updateForm">
        <img src="${pageContext.request.contextPath}/upload/${updateMember.memberProfileName}"
             alt="" height="150" width="150"><br>
        Profile 사진: <input type="file" name="memberProfileName" value="${updateMember.memberProfileName}"><br>
        회원번호: <input type="text" class="form-control" name="id" value="${updateMember.id}" readonly><br>
        아이디: <input type="text" class="form-control" id="updateMemberId" name="memberId" value="${updateMember.memberId}" readonly><br>
        비밀번호: <input type="password" id="password"class="form-control" name="memberPassword"><br>
        이름: <input type="text" class="form-control" name="memberName" value="${updateMember.memberName}" readonly><br>
        이메일: <input type="text" class="form-control" name="memberEmail" value="${updateMember.memberEmail}"><br>
        전화번호:<input type="text" class="form-control" name="memberMobile" value="${updateMember.memberMobile}"><br>
        <input class="btn btn-primary" type="button" onclick="memberUpdate()" value="정보수정">
    </form>
    <button class="btn btn-outline-primary"onclick="location.href='/member/myPage?id=${updateMember.id}'">My Page</button>
</div>
</body>
<script>
    const memberUpdate = () => {
        const password = document.getElementById("password").value;
        if(password =="${updateMember.memberPassword}"){
            updateForm.submit();
        }
        else{
            alert("비밀번호가 일치하지 않으므로 변경할 수 없습니다.");
        }
    }
</script>
</html>
