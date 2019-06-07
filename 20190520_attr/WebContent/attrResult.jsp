<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String)application.getAttribute("id");
		String email = (String)session.getAttribute("email");
		String aaa = (String)pageContext.getAttribute("aaa");
		String bbb = (String)request.getAttribute("bbb");
	%>
	
	아이디 : <%=id%> <br/>
	email : <%=email%> <br/>
	aaa : <%=aaa%> <br/>
	bbb : <%=bbb%> <br/>	
</body>
</html>