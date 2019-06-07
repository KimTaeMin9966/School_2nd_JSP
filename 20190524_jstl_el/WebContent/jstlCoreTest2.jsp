<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var="myCar" value="빨강" />

	<c:if test="${myCar eq '파랑'}">
		색상은 파랑색!!!
	</c:if>

	<c:if test="${myCar ne '파랑'}">
		색상은 빨강색!!!
	</c:if>

	<c:set var="grade" value="30" />
	<c:choose>
		<c:when test="${grade >= 90}">
			A학점
		</c:when>
		<c:when test="${grade >= 80}">
			B학점
		</c:when>
		<c:when test="${grade >= 70}">
			C학점
		</c:when>
		<c:when test="${grade >= 60}">
			D학점
		</c:when>
		<c:otherwise>
			F학점
		</c:otherwise>
	</c:choose>

	<%
		int[] num = { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
		request.setAttribute("numArray", num);
	%>
	<br/>
	[
	<c:forEach var="n" items="${numArray}">
		${n} &nbsp;&nbsp;
	</c:forEach>
	]
	<br/>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i} &nbsp;&nbsp;
	</c:forEach>
	
	<c:set var="data" value="김미희,김도환,곽시은,구정훈,최기근"/>
	
	<br/>
	<c:forTokens var="names" items="${data}" delims=",">
		${names} <br/>
	</c:forTokens>
	
	<%
		ArrayList<String> list = new ArrayList<>();
		list.add("곽시은");
		list.add("박상민");
		list.add("정세윤");
		list.add("박준현");
		list.add("이기쁨");
		request.setAttribute("memberList", list);
	%>
	
	<c:forEach var="members" items="${memberList}">
		${members} &nbsp;&nbsp;
	</c:forEach>
</body>
</html>