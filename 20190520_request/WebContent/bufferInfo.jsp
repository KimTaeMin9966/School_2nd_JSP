<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	버퍼 크기 : <%= out.getBufferSize() %>
	<br/>
	안녕하세요!!!!! 
	남은 크기 : <%=out.getRemaining() %>
	<% for(int i=0; i<10000; i++){
		out.println("1234");
	}
	%>
	
</body>
</html>




