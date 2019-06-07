<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<jsp:useBean id="memberShip" class="test.MemberVO" scope="session">
		<jsp:setProperty property="*" name="memberShip"/>
	</jsp:useBean>
	
	아이디 : <jsp:getProperty property="id" name="memberShip" /> <br/>
	비밀번호 : <jsp:getProperty property="pw" name="memberShip" /> <br/>
	이름 : <jsp:getProperty property="name" name="memberShip" /> <br/>
	이메일 : <jsp:getProperty property="email" name="memberShip" /> <br/>
	
	<a href="memberSession.jsp">세션 정보 확인</a>

</body>
</html>