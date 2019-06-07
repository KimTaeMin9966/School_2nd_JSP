<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session 의 특정 속성값 삭제
	session.removeAttribute("MEMBERUID");
	
	// session 객체를 초기화 
	//session.invalidate();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그아웃 되었습니다.
</body>
</html>