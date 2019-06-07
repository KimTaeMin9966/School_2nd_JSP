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
	<% System.out.println("index 요청"); %>
	<jsp:forward page="/test" />
	<!-- <a href="test">test</a>
	<a href="test1?test=1">test1</a> -->
</body>
</html>