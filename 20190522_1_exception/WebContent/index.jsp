<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <!-- errorPage="error.jsp" -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="aaa.jsp">temp</a>
	
	<%
		// s = null
		String s = request.getParameter("aaa");
		if(s == null){
			throw new ClassNotFoundException();
		}
		/* if(s.equals("안녕")){
			out.print("s는 안녕");
		} */
	%>
	
	
</body>
</html>