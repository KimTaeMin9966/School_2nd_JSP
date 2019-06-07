<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	util.Cookies cookies = new util.Cookies(request);
	cookies.removeCookie(response, "id");
	
	
	session.removeAttribute("id");
	//session.invalidate();	
%>
<script>
	alert("로그아웃 완료");
	location.href="index.jsp";
</script>