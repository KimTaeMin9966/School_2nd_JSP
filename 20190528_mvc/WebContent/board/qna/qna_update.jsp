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
	<form action="boardUpdate.bo" method="post">
		<input type="hidden" name="board_num" value="${boardVo.board_num}">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="board_name" value="${boardVo.board_name}" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="board_pass" required /></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="board_title" value="${boardVo.board_title}" /></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="board_content" rows="10" cols="50">${boardVo.board_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정 완료">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>