<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>beanTest JSP</h1>
	
	<%
		test.Member m = new test.Member();
		m.setName("홍길동");
	%>
	
	<%= m.getName() %>
	
	<jsp:useBean id="aaa" class="test.Member" scope="page" />
	<jsp:setProperty property="name" name="aaa" value="김유신"/>
	
	<h3><%=aaa.getName()%></h3>
	<h3><jsp:getProperty property="name" name="aaa"/></h3>
	<a href="beanTest2.jsp">빈테스트 2</a>
</body>
</html>



