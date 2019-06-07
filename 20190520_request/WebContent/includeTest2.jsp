<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include Test2 입니다.</title>
</head>
<body>
	<h1>여기는 include Test2 입니다.</h1>
	<% 
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		out.println(name);
	%>
</body>
</html>





