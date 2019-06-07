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
	<jsp:include page="../../common/header.jsp"/>
	<h1>공지</h1>
	<table>
		<tr>
			<td>작성자</td>
			<td>${notice.notice_author}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${notice.notice_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea cols="40" rows="10" readonly>${notice.notice_content}</textarea>
			</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${notice.notice_date}</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="noticeUpdateForm.do?notice_num=${notice.notice_num}">수정</a>
				<a href="noticeDelete.do?notice_num=${notice.notice_num}">삭제</a>
			</td>
		</tr>
	</table>	
</body>
</html>