<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="varPage" value="page Scope 에 저장" scope="page" />
	<%
		String pageABC = "page영역에 저장";
		pageContext.setAttribute("varPage2", pageABC);
	%>
	<c:out value="${varPage}" /> <br/>
	<c:out value="${varPage2}" /> <br/>
	
	${varPage} <br/>
	${varPage2} <br/>
	<c:set var="request" value="request영역에 저장" scope="request" />
	<c:set var="session" value="session영역에 저장" scope="session" />
	<c:set var="application" value="application영역에 저장" scope="application" />
	
	${request} <br/>
	<c:remove var="request"/>
	<hr>
	<c:out value="${request}" /> <br/>
	
	<hr>
	<jsp:useBean id="loginMember" class="vo.MemberVo" />
	<c:set target="${loginMember}" property="id" value="id001" />
	<c:set target="${loginMember}" property="pass" value="pw001" />
	
	${loginMember.id} <br/>
	${loginMember.pass} <br/>
	
	<c:out value="ABCDEF" />
	
	<c:set var="test1" value="<script type='text/javascript'>alert('경고');</script>" />
	<h1>el 경고</h1>
	${test1} <br/>
	<h1>escapeXml true</h1>
	<c:out value="${test1}" escapeXml="true" />
	<h1>escapeXml false</h1>
	<c:out value="${test1}" escapeXml="false" />
	<hr>
	<c:out value="${ccc}" default="ccc가 존제하지 않습니다" />
	<c:out value="${test1}">
		이름이 존재하지 않습니다
	</c:out>
</body>
</html>