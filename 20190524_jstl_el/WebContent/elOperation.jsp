<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>\${5 + 7} : ${5 + 7}</h3>
	<h3>\${5 == 7} : ${5 == 7}</h3>
	<h3>\${5 < 7} : ${5 < 7}</h3>
	<h3>\${5 + 7 == 8 ? 8 : 0} : ${5 + 7 == 8 ? 8 : 0}</h3>
	
	<%
		String s = new String("hihi");
		request.setAttribute("s", s);
		
		s = new String("sessionAttribute");
		session.setAttribute("s", s);
	%>
	
	<br/>
	
	<h3>\${!empty s} = ${!empty s} : ${s}</h3>
	<h3>\${requestScope.s eq sessionScope.s} : ${requestScope.s eq sessionScope.s}</h3>
	<h3>\${requestScope.s ne sessionScope.s} : ${requestScope.s ne sessionScope.s}</h3>
</body>
</html>