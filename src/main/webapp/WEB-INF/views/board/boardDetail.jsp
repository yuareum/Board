<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시글 상세 조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
    <h2>게시글 상세 조회</h2>
    <div class="container">
        글번호:  ${board.id} <br>
        제목:  ${board.boardTitle} <br>
        작성자:  ${board.boardWriter} <br>
        내용:  ${board.boardContents} <br>
        조회수:  ${board.boardHits} <br>
        작성일자:  ${board.boardCreatedDate} <br>
        <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
             alt="" height="100" width="100"><br>
        <c:if test="${sessionScope.loginMemberId eq board.boardWriter}">
            <button onclick="boardUpdate()" class="btn btn-primary">글 수정</button>
            <button onclick="boardDelete()" class="btn btn-danger">글 삭제</button>
        </c:if>
    </div>

</body>
</html>
