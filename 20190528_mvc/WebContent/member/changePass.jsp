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
	<h1>비밀번호 변경</h1>
	<form action="changePass.mb" method="post">
		<input type="hidden" name="id" value="${id}" />
		<input type="hidden" name="code" value="${code}" />
		<input type="password" name="pass" />
		<input type="submit" value="변경" />
	</form>
</body>
</html>








