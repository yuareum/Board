<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 작성</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container mb-3">
    <h2>글 작성</h2>
    <form action="/board/save" method="post" enctype="multipart/form-data">
        작성자  <input type="text" class="form-control" name="boardWriter" value="${sessionScope.loginMemberId}" readonly><br>
        제목  <input type="text" class="form-control" name="boardTitle" placeholder="제목"><br>
        게시글 내용 <textarea class="form-control" name="boardContents" rows="5" cols="100"></textarea><br>
        첨부파일:<input type="file" name="boardFile"><br>
        <input type="submit" class="btn btn-primary" value="글작성">
    </form>
</div>

</body>
</html>
