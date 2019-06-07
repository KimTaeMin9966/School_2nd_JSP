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
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		session.setAttribute("email",email);
	%>
	
	<h3>request email : <%=email %></h3>
	<h3>session email : <%=session.getAttribute("email") %></h3>
	<h3><%=application.getAttribute("id")%> 이메일 정보 저장완료</h3>
	<a href="attrTest4.jsp">pageContext</a>
</body>
</html>







