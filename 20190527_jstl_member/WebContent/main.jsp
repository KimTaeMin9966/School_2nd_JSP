<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%
	String pageSelect = request.getParameter("page");
	pageContext.setAttribute("pageSelect", pageSelect);
	out.print(pageContext.getAttribute("pageSelect"));
%> --%>
<c:set var="pageSelect" value="${param.page}" />
<%-- <c:out value="${pageSelect}" /> --%>
<c:if test="${empty pageSelect}">
	<c:set var="pageSelect" value="default" />
</c:if>
<c:set var="pageSelect" value="${pageSelect}.jsp" />
<%-- <br/>
<c:out value="${pageSelect}" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Member</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/common.css" rel="stylesheet" type="text/css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section class="wrap">
		<jsp:include page="${pageSelect}" />
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>