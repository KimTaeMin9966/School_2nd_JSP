<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- include 지시자 -->
	<%@ include file="header.jsp" %>
	<%-- <h1><%=s%> 본문 내용!</h1>	 --%>
	<%-- <jsp:include page="header.jsp"></jsp:include> --%>
	<%=s%>
	<br/>
	<%-- <%@ include file="default.jsp" %> --%>
	<!--  default.jsp?sValue=바보야! -->
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:include page="default.jsp" >
		<jsp:param name="sValue" value="<%=s%>"/>	
	</jsp:include>
		
	<br/>
	<a href="attrTest1.jsp">속성테스트</a> <br/>
	<a href="dispatcher?id=hap0p9y">dispatcher</a>	
	<%@ include file="footer.jsp" %>
</body>
</html>





