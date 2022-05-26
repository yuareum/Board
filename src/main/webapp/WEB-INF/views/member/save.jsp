<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <h2>회원가입</h2>
    <div class="form-floating">
        <form action="/member/save" method="post">
            아이디<br><input type="text" class="form-control" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="아이디">
            <span id="dup-check-result"></span><br>
            비밀번호<br><input type="password" class="form-control" onblur="passwordCheck()" id="memberPassword" name="memberPassword" placeholder="비밀번호">
            <span id="password-check-result"></span><br>
            이름<br><input type="text" class="form-control" onblur="nameCheck()" id="memberName" name="memberName" placeholder="이름">
            <span id="name-check-result"></span><br>
            이메일<br><input type="text" class="form-control" name="memberEmail" placeholder="이메일"><br>
            전화번호<br><input type="text" class="form-control" id="memberMobile" onblur="mobileCheck()" name="memberMobile" placeholder="전화번호"><br>
            <span id="mobile-check-result"></span>
            프로필 사진 : <input type="file" name="memberProfile"><br>
            <input type="submit" class="btn btn-outline-success" value="회원가입">
        </form>
    </div>
</div>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        const exp = /^[a-z\d-_]{5,20}$/;
        if(memberId.match(exp)) {
            $.ajax({
                type: "post",
                url: "duplicate-check",
                data: {"memberId": memberId},
                dataType: "text",
                success: function (result) {
                    if (result == "ok") {
                        checkResult.innerHTML = "사용가능한 아이디입니다.";
                        checkResult.style.color = "green";
                    } else {
                        checkResult.innerHTML = "이미 사용 중인 아이디입니다.";
                        checkResult.style.color = "red";
                    }
                },
                error: function () {
                    alert("오타체크");
                }
            });
        }
        else{
            if(memberId.length == 0){
                checkResult.innerHTML = "필수 입력입니다.";
                checkResult.style.color = "red";
            }
            else{
                checkResult.innerHTML = "5~20자의 영문 소문자, 숫자, 특수문자(-,_)만 사용 가능합니다."
                checkResult.style.color = "red";
            }
        }
    }
    const passwordCheck = () => {
        const memberPassword = document.getElementById("memberPassword").value;
        const checkResult = document.getElementById("password-check-result");
        const exp  = /[A-Za-z\d-_!#$.]{8,16}$/;
        if(memberPassword.match(exp)){
            checkResult.innerHTML = "사용가능한 비밀번호입니다.";
            checkResult.style.color = "green";
        }
        else{
            if(memberPassword.length == 0){
                checkResult.innerHTML = "필수 입력입니다.";
                checkResult.style.color = "red";
            }
            else{
                checkResult.innerHTML = " 8~16자의 영문 대 소문자, 숫자, 특수문자(-,_,!,#,$,.)만 사용가능합니다.";
                checkResult.style.color = "red";
            }
        }
    }
    const nameCheck =() => {
        const memberName = document.getElementById("memberName").value;
        const checkResult = document.getElementById("name-check-result");
        const exp = /^[a-z|A-Z|ㄱ-ㅎ|가-힣]{1,20}$/
        if(memberName.match(exp)){
            checkResult.innerHTML = "";
        }
        else{
            if(memberName.length == 0){
                checkResult.innerHTML = "필수 입력입니다.";
                checkResult.style.color = "red";
            }
            else{
                checkResult.innerHTML = "1~20자의 한글과 영문 대 소문자만 사용하세요."
                checkResult.style.color = "red";
            }
        }
    }
    const mobileCheck = () => {
        const memberMobile = document.getElementById("memberMobile").value;
        const checkResult = document.getElementById("mobile-check-result");
        const exp =
    }
</script>
</html>
