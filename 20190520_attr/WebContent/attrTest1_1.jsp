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
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		if(id != null){
			application.setAttribute("id", id);
		}
	%>
	
	<h3>request id : <%=id%></h3>
	<h3>애플리케이션 id : <%=application.getAttribute("id") %></h3>

	<form action="attrTest2.jsp" method="post">
		이메일 : <input type="text" name="email"/>
		<input type="submit" value="확인"/>
	</form>
</body>
</html>






