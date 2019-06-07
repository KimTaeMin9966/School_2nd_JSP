<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String s = "test";

	String getStr(String str){
		s += str;
		return s;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>TIME JSP</h1>
	
	<%= getStr("컴퓨터 바보 멍청이!!!") %>
	
	<%
		java.text.SimpleDateFormat sdf
		= new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	%>
	기본시간 : <%= new java.util.Date() %> <br/>
	현재시간 : <%= sdf.format(new java.util.Date()) %> <br/>
	
	<%
		int sum = 0;
		for(int i=0; i<100; i++){
			sum+=i;	
	%>
		
		sum : <%= sum %><br/>
		
	<%
		}
	%>
	1부터 99까지의 합은 : <%= sum %> 입니다.
</body>
</html>


