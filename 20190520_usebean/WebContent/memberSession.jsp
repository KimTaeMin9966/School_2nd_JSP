<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MemberVO SESSION JSP</h1>
	<%
		request.setCharacterEncoding("utf-8");
		test.MemberVO m = (test.MemberVO)session.getAttribute("memberShip");
		out.print(m.getName());
	%>
	
	<jsp:useBean id="memberShip" class="test.MemberVO" scope="session"/>
	
	아이디 : <jsp:getProperty property="id" name="memberShip" /> <br/>
	비밀번호 : <jsp:getProperty property="pw" name="memberShip" /> <br/>
	이름 : <jsp:getProperty property="name" name="memberShip" /> <br/>
	이메일 : <jsp:getProperty property="email" name="memberShip" /> <br/>
</body>
</html>





