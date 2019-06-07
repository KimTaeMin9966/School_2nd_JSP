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
	<jsp:include page="../common/header.jsp" />
	<h1>회원탈퇴 </h1>
	<h2>비밀번호 확인</h2>
	<form action="withdrawSubmit.mb" method="post">
		<input type="password" name="tempPass" placeholder="비밀번호를 입력해주세요" />
		<input type="submit" value="회원탈퇴" />
	</form>
</body>
</html>





