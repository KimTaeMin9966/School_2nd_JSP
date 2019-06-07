<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				Cookie cookie = new Cookie("id","");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
	}


	session.removeAttribute("loginMember");
	//session.invalidate();
%>
<script>
	alert("로그아웃 성공");
	location.href="index.jsp";
</script>