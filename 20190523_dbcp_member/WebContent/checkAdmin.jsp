<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	vo.MemberVo sessionMember = (vo.MemberVo) session.getAttribute("member");
	if (sessionMember == null || !sessionMember.getId().equals("admin")) {
		out.print("<script>alert('올바른 접근이 아닙니다.');location.href='index.jsp';</script>");
		return;
	}
%>