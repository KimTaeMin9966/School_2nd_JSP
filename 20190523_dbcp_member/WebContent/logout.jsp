<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.*" %>
<%
	Cookies cookie = new Cookies(request);
	cookie.removeCookie("id", request, response);
	session.removeAttribute("member");
	response.sendRedirect("index.jsp");
%>