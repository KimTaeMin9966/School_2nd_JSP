<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals(pw)){
			// 로그인 성공
			session.setAttribute("MEMBERUID",id);
	%>
		로그인에 성공하셨습니다.
		<a href="sessionLogout.jsp">로그아웃</a>
		<a href="sessionLoginCheck.jsp">로그인 체크</a>
	<%}else{ %>
		<script>
			alert('로그인 실패');
			history.go(-1);
			//history.back();
		</script>
	<%} %>
	
	
	
</body>
</html>




