<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<h1>회원정보 수정</h1>
	<form action="memberUpdate.mb" method="post">
		<input type="hidden" name="num" value="${member.num}" />
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${member.id}" readonly /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" value="${member.pass}" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${member.name}" /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" value="${member.age}" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
			<c:choose>
				<c:when test="${member.gender eq 'male'}">
					<label><input type="radio" name="gender" value="male" checked /> 남성</label>
					<label><input type="radio" name="gender" value="female" /> 여성</label>
				</c:when>
				<c:otherwise>
					<label><input type="radio" name="gender" value="male" /> 남성</label>
					<label><input type="radio" name="gender" value="female" checked /> 여성</label>
				</c:otherwise>
			</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="정보수정"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>









