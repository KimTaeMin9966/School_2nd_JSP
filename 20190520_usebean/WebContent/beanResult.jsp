<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="test.Member2" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	/*
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		Member2 m = new Member2(name,addr,email);
		
 		m.setName(name);
		m.setAddr(addr);
		m.setEmail(email); 
		session.setAttribute("m",m);
		*/
		
		
	%>
	
	<jsp:useBean id="m2" class="test.Member2">
		<jsp:setProperty property="*" name="m2"/>
		<%-- <jsp:setProperty property="name" name="m2" />
		<jsp:setProperty property="addr" name="m2" />
		<jsp:setProperty property="email" name="m2" />	 --%>	
	</jsp:useBean>
	
	이름 : <jsp:getProperty property="name" name="m2"/> <br/>
	주소 : <jsp:getProperty property="addr" name="m2"/> <br/>
	이메일 : <jsp:getProperty property="email" name="m2"/> <br/>
	
	<a href="member.jsp">데이터 유지 확인</a>

</body>
</html>