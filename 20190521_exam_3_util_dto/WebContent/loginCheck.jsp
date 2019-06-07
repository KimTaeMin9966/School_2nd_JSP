<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="loginDTO" class="dto.LoginDTO" scope="page"/>
<jsp:setProperty property="*" name="loginDTO"/>

<jsp:useBean id="joinMember" class="vo.MemberVo" scope="application" />

<%
	if(joinMember.getId() != null && 
		joinMember.getId().equals(loginDTO.getId())
		&& joinMember.getPass().equals(loginDTO.getPass())){
		
		if(loginDTO.isLogin()){
			response.addCookie(util.Cookies.createCookie("id", loginDTO.getId(), 60*60*24*7));
		}
		
		session.setAttribute("id",loginDTO.getId());
		out.print("<script>alert('로그인 성공');location.href='index.jsp';</script>");
	}else{
		out.print("<script>alert('로그인 실패');location.href='index.jsp?page=login';</script>");
	}
%>



