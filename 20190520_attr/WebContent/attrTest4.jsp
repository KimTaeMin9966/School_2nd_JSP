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
		pageContext.setAttribute("aaa","111");
		request.setAttribute("bbb","222");
	%>
	
	<h3>pageContext attr : <%=pageContext.getAttribute("aaa") %></h3>
	<h3>request attr : <%=request.getAttribute("bbb") %></h3>
	<a href="attrResult.jsp">결과</a>
	<% 
		response.sendRedirect("attrResult.jsp"); 
	%>	
	<%
	RequestDispatcher rd = request.getRequestDispatcher("attrResult.jsp");
	rd.forward(request, response);
	%>
	<%-- <jsp:forward page="attrResult.jsp"></jsp:forward> --%>
</body>
</html>



