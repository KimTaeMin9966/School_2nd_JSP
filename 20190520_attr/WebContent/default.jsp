<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>DEFAULT JSP</h1>
<%-- <%=s%> --%>
<%
	request.setCharacterEncoding("utf-8");
	String sValue = request.getParameter("sValue");
%>
<%=sValue%>
