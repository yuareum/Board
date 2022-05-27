<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-05-27
  Time: 오전 12:38
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
    <h2>글 목록</h2>
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
                <th>작성자</th>
                <th>제목</th>
                <th>작성시간</th>
                <th>조회수</th>
            </tr>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.id}</td>
                    <td>${board.boardWriter}</td>
                    <td><a href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                        value="${board.boardCreatedDate}"></fmt:formatDate></td>
                    <td>${board.boardHits}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌. --%>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <%--1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <%-- for(int i=startPage; i<=endPage; i++ --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 test:조건식,jsp 문법 ${} eq=equals 같은지--%>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>


</body>
</html>
