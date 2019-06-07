<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 작성</title>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<input type="hidden" name="notice_author" value="${member.name}" />
	<h1>공지글 작성</h1>
	<form action="noticeWrite.do" method="post">
		카테고리
		<select name="notice_category">
			<option value="공지" selected>공지</option>
			<option value="알림">알림</option>
			<option value="이벤트">이벤트</option>
			<option value="당첨">당첨</option>
		</select><br/>
		제목 : <input type="text" name="notice_title" /><br/>
		내용 : <textarea cols="40" rows="10" name="notice_content"></textarea><br/>
		<input type="submit" value="작성완료" />
		<input type="reset" value="초기화" />
	</form>
</body>
</html>




