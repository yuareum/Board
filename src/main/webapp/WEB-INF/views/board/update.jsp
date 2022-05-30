<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-05-28
  Time: 오후 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .container{
            max-width: 500px;
        }
    </style>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>게시글 수정</h2>
    <div class="text-center"></div>
    <form action="/board/update" method="post" name="updateForm">
        글번호  <input type="text" class="form-control" name="id" value="${updateBoard.id}" readonly><br>
        글제목  <input type="text" class="form-control" name="boardTitle" value="${updateBoard.boardTitle}"><br>
        작성자  <input type="text" id="boardWriter" class="form-control"  name="boardWriter" value="${updateBoard.boardWriter}" readonly><br>
        <textarea name="boardContents" class="form-control" cols="30" rows="10">${updateBoard.boardContents}</textarea><br>
        첨부파일:<input type="file" name="boardFileName" value="${updateBoard.boardFileName}"><br>
        <input class="btn btn-primary" type="button" onclick="boardUpdate()" value="정보수정">
    </form>
</div>
</body>
<script>
    const boardUpdate = () => {
        const boardWriter = document.getElementById("boardWriter").value;
        if(boardWriter == "${sessionScope.loginMemberId}"){
            updateForm.submit();
        }
        else{
            alert("작성자가 틀립니다.");
        }
    }

</script>
</html>
