<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<h1>게시물 삭제</h1>
	<form action="boardDelete.bo" method="post">
		<input type="hidden" name="board_num" value="${board_num}">
		비밀번호 : <input type="password" name="board_pass">
		<input type="submit" value="삭제">
		<a href="boardList.bo">목록</a>
	</form>
</body>
</html>