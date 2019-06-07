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
		String nextPage = request.getParameter("nextPage");
		//response.sendRedirect(nextPage);
	%>
	
	<jsp:forward page="<%=nextPage%>">
		<jsp:param name="tel" value="010-1234-5678"/>
	</jsp:forward>
</body>
</html>