<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String pageSelect = request.getParameter("page");
	if(pageSelect == null){
		pageSelect = "default";
	}
	
	pageSelect = pageSelect+".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="header.jsp" />
	<section class="wrap">
		<jsp:include page="<%=pageSelect%>" />
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>