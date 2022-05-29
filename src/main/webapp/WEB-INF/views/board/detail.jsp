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
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
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
        </c:if>
        <c:if test="${sessionScope.loginMemberId eq board.boardWriter || sessionScope.loginMemberId eq 'admin'}">
            <button onclick="boardDelete()" class="btn btn-danger">글 삭제</button>
        </c:if>
    </div>

    <div class="container">
        <p>댓글</p>
        <div id="comment-write" class="input-group mb-3">
            <div class="form-floating">
                <input type="text" id="commentWriter" class="form-control" value="${sessionScope.loginMemberId}" placeholder="작성자" readonly>
                <label for="commentWriter">작성자</label>
            </div>
            <div class="form-floating">
                <input type="text" onclick="commentWriterCheck()" id="commentContents" class="form-control" placeholder="내용">
                <label for="commentContents">내용</label>
            </div>
            <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
        </div>

        <p>해당 게시글에 작성된 댓글</p>
        <div id="comment-list">
            <c:forEach items="${commentList}" var="comment">
                ${comment.commentWriter} &nbsp; <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate><br>
                <input type="text" class="form-control" readonly value="${comment.commentContents}">
            </c:forEach>
        </div>
    </div>
</body>
<script>
    $("#comment-write-btn").click(function (){
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = $("#commentContents").val();
        const boardId = '${board.id}'
        if(commentContents != "") {
            $.ajax({
                type: "post",
                url: "/comment/save",
                data: {"commentWriter": commentWriter, "commentContents": commentContents, "boardId": boardId},
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    location.href = "/board/detail?id=${board.id}";
                },
                error: function () {
                    alert("오류");
                }
            });
        }
        else{
            alert("댓글을 작성해주세요.");
        }
    });

    const boardUpdate = () => {
        location.href = "/board/update?id=${board.id}";
    }

    const boardDelete = () => {
        location.href = "/board/boardWriterCheck?id=${board.id}";
    }


    const commentWriterCheck = () => {
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = document.getElementById("commentContents");
        if(commentWriter == ""){
            commentContents.readOnly = true;
        }
    }

</script>
</html>
