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
	<jsp:include page="../common/header.jsp"/>
	<h1>회원가입</h1>
	<form action="memberJoin.mb" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" required /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="male" /> 남성</label>
					<label><input type="radio" name="gender" value="female" checked /> 여성</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>