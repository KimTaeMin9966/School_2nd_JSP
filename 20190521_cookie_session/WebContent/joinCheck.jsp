<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
/*
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	vo.MemberVO m = new vo.MemberVO();
	m.setId(id);
	m.setPass(pass);
	
	application.setAttribute("joinMember", m);
*/
%>
	<jsp:useBean id="joinMember" class="vo.MemberVo" scope="application" />
	<jsp:setProperty property="*" name="joinMember"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN CHECK</title>
</head>
<body>
	<%
		vo.MemberVo member = (vo.MemberVo)application.getAttribute("joinMember");
			out.print("아이디 : " + member.getId()+"<br/>");
			out.print("비밀번호 : " + member.getPass()+"<br/>");
	%>
	
	id : <jsp:getProperty property="id" name="joinMember"/> <br/>
	pass : <jsp:getProperty property="pass" name="joinMember"/>
	
</body>
</html>






