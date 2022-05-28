<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-05-28
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시판 글 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const boardSave = () => {
            <c:if test="${sessionScope.loginMemberId != null}">
            location.href = "/board/save"
            </c:if>
            <c:if test="${sessionScope.loginMemberId == null}">
            location.href = "/member/login"
            </c:if>
        }
    </script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>조회</h2>
    <button class="btn btn-outline-success" onclick="boardSave()">글 작성</button>
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <button class="btn btn-outline-success" onclick="location.href='/member/admin'">관리자 페이지로 이동</button>
    </c:if>
    <div class="container mt-3">
        <form action="/board/search" method="get">
            <select name="searchType">
                <option value="boardTitle">제목</option>
                <option value="boardWriter">작성자</option>
            </select>
            <input type="text" name="q" placeholder="검색어입력..">
            <input type="submit" value="검색">
        </form>
    </div>
</div>
<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td><a href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></td>
                <td>${board.boardWriter}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
