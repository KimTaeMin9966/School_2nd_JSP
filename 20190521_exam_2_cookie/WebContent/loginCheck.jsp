<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");	 
%>

<jsp:useBean id="joinMember" class="vo.MemberVo" scope="application" />

<%
	if(joinMember.getId() != null && 
		joinMember.getId().equals(id)
		&& joinMember.getPass().equals(pass)){
		
		if(login != null){
			Cookie cookie = new Cookie("id",id);
			cookie.setMaxAge(60*60*24*7);
			cookie.setPath("/");
			response.addCookie(cookie); 
		}
		
		session.setAttribute("id",id);
		out.print("<script>alert('로그인 성공');location.href='index.jsp';</script>");
	}else{
		out.print("<script>alert('로그인 실패');location.href='index.jsp?page=login';</script>");
	}
%>



