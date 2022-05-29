<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-05-29
  Time: 오후 4:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디 체크</title>
</head>
<body>
<div class="container">
    <h2>글 삭제 아이디 체크</h2>
    <input type="text" class="form-control" id="loginId" value="${sessionScope.loginMemberId}" readonly>
    <input type="button" class="btn btn-info" onclick="boardWriterCheck()" value="작성자 확인">
</div>
</body>
<script>
    const boardWriterCheck = () => {
        const loginId = document.getElementById("loginId").value;
        const boardWriter = '${board.boardWriter}';
        if(loginId == boardWriter){
            location.href = "/board/delete?id=${board.id}";
        }
        else if(loginId == 'admin'){
            location.href = "/board/delete?id=${board.id}";
        }
        else{
            alert("해당 게시글의 작성자가 아닙니다.");
            location.href = "/board/detail?id=${board.id}";
        }
    }
</script>
</html>
