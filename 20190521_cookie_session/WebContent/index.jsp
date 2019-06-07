<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="joinMember" class="vo.MemberVo" scope="application" />
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] cookies = request.getCookies();
	if(cookies != null && joinMember.getId() != null){
		for(int i = 0; i<cookies.length; i++){
	if(cookies[i].getName().equals("id")){
		if(cookies[i].getValue().equals(joinMember.getId())){
			session.setAttribute("loginMember",joinMember);
		}
	}
	
	/* out.print(cookies[i].getName()+"<br/>");
	out.print(cookies[i].getValue()+"<br/>"); */
		}
	}
%>
<jsp:useBean id="loginMember" class="vo.MemberVo" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(loginMember.getId() != null){ %>
		<%=loginMember.getId() %>님 방가방가 | <a href="logout.jsp">logout</a>
	<%}else{ %>
		<a href="login.jsp">로그인</a> | <a href="join.jsp">회원가입</a>
	<%} %>
</body>
</html>