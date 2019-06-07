<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL TEST</title>
</head>
<body>
	<%
		pageContext.setAttribute("scopeName", "pageContext 영역");
		request.setAttribute("scopeName", "request 영역");
		session.setAttribute("scopeName", "session 영역");
		application.setAttribute("scopeName", "application 영역");
	%>
	
	page 영역 : <%=pageContext.getAttribute("scopeName") %> <br/>
	request 영역 : <%=request.getAttribute("scopeName") %> <br/>
	session 영역 : <%=session.getAttribute("scopeName") %> <br/>
	application 영역 : <%=application.getAttribute("scopeName") %> <br/>
	
	page 영역 EL : ${pageScope.scopeName} <br/>
	request 영역 EL : ${requestScope.scopeName} <br/>
	session 영역 EL : ${sessionScope.scopeName} <br/>
	application 영역 EL : ${applicationScope.scopeName} <br/>
	
	EL : ${scopeName}
	
	<% session.setAttribute("test", "bbb"); %>
	
	<form action="elTest.jsp" method="post">
		<input type="text" name="aaa" />
		<input type="submit" value="확인" />
	</form>
</body>
</html>