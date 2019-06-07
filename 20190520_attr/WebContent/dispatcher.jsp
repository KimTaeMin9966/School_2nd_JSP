<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Dispatcher</h1>
	<h3>request attr : <%=request.getAttribute("aaa") %></h3>
	<h3>request param : <%=request.getParameter("id") %></h3>
</body>
</html>