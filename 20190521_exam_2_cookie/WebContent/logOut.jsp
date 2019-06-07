<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i = 0; i< cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				Cookie c = new Cookie("id","");
				c.setMaxAge(0);
				response.addCookie(c);
				break;
			}
		}
	} 

	session.removeAttribute("id");
	//session.invalidate();	
%>
<script>
	alert("로그아웃 완료");
	location.href="index.jsp";
</script>