<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{text-decoration: none;color: blue;}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<h1>질문과 답변 목록</h1>
	<a href="boardWrite.bo">질문 작성하러 가기</a>
	<table border="1" style="margin: 10px auto;">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		<!-- 글 목록  -->
		<c:forEach var="board" items="${boardList}">
		<tr>
			<td align="center">${board.board_num}</td>
			<td style="width: 250px;">
				<c:if test="${board.board_re_lev != 0}">
					<c:forEach var="i" begin="1" end="${board.board_re_lev}">
						&nbsp;&nbsp;&nbsp;
					</c:forEach>
					▶
				</c:if>
				<a href="boardDetail.bo?board_num=${board.board_num}">${board.board_title}</a>
			</td>
			<td align="center" style="width: 100px;">${board.board_name}</td>
			<td>${board.board_date}</td>
			<td align="center">${board.board_readcount}</td>
		</tr>
		</c:forEach>
	</table>
	<div align="center" style="margin-top: 10px;">
		<c:if test="${pageMaker.page > 1}">
			<a href="boardList.bo?page=${pageMaker.page - 1}">[ 이전 ]</a>
		</c:if>
		<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">
			<c:choose>
				<c:when test="${pageMaker.page eq i}">
					<span style="color: red;">[ ${i} ]</span>
				</c:when>
				<c:otherwise>
					<a href="boardList.bo?page=${i}">[ ${i} ]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageMaker.page < pageMaker.maxPage}">
			<a href="boardList.bo?page=${pageMaker.page + 1}">[ 다음 ]</a>
		</c:if>
	</div>
</body>
</html>