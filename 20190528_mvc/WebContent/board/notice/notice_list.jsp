<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<h1>공지사항</h1>
<c:if test="${member.id eq 'admin'}">
	<a href="noticeWriteForm.do">공지글 작성</a>
</c:if>
	
	<div>
		<!-- 공지글  리스트 -->
		<table border="1" style="margin: 0 auto;">
			<tr>
				<td colspan="4">
					<form action="noticeSearch.do" method="get">
						<select name="searchName">
							<option value="author">작성자</option>
							<option value="title">제목</option>	
						</select>
						<input type="text" name="searchValue"/>
						<input type="submit" value="검색"/>
					</form>
				</td>
			</tr>
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
	<c:choose>
		<c:when test="${!empty noticeList}">
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td>${n.notice_num}</td>
					<td>
						<a href="noticeDetail.do?notice_num=${n.notice_num}">
							[${n.notice_category}] ${n.notice_title}
						</a>
					</td>
					<td>${n.notice_author}</td>
					<td>${n.notice_date}</td>	
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="4">등록된 게시물이 없습니다.</td>
			</tr>
		</c:otherwise>			
	</c:choose>
		</table>
	</div>
	<div align="center" style="margin-top: 10px">
	<c:if test="${pageMaker.page > 1}">
		<a href="noticeSearch.do?page=1&searchName=${searchName}&searchValue=${searchValue}">[처음]</a>
		<c:if test="${pageMaker.page > pageMaker.pageCount}">
		<a href="noticeSearch.do?page=${pageMaker.startPage - 1}&searchName=${searchName}&searchValue=${searchValue}">[이전]</a>
		</c:if>
	</c:if>
	<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">
		<a href="noticeSearch.do?page=${i}&searchName=${searchName}&searchValue=${searchValue}">[ ${i} ]</a>
	</c:forEach>
	<c:if test="${pageMaker.page < pageMaker.maxPage}">
		<c:if test="${(pageMaker.startPage + pageMaker.pageCount) < pageMaker.maxPage}">
		<a href="noticeSearch.do?page=${pageMaker.startPage + pageMaker.pageCount}&searchName=${searchName}&searchValue=${searchValue}">[다음]</a>
		</c:if>
		<a href="noticeSearch.do?page=${pageMaker.maxPage}&searchName=${searchName}&searchValue=${searchValue}">[마지막]</a>
	</c:if>
	</div>
</body>
</html>