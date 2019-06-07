<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date() %>" />
	<c:out value="${now}" /><br/>
	<%-- pattern="yyyy-MM-dd HH:mm:ss.SSS" --%>
	<f:formatDate value="${now}" type="date"/><br/>
	<f:formatDate value="${now}" dateStyle="full"/><br/>
	<f:formatDate value="${now}" dateStyle="short"/><br/>
	<f:formatDate value="${now}" type="time"/><br/>
	<f:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br/>
	<f:formatDate value="${now}" pattern="yyyy년 MM월 dd일  E요일 HH시 mm분 ss초 SSS"/><br/>
	<hr/>
	<c:set var="price" value="10000000" />
	<f:formatNumber value="${price}" type="number" var="numberType" />
	숫자 : ${numberType} <br/>
	기호 : <f:formatNumber value="${price}" type="currency" currencySymbol="￦" /> <br/>
	퍼센트 : <f:formatNumber value="${price}" type="percent" groupingUsed="false" /> <br/>
	패턴 : <f:formatNumber value="${price}" pattern="00,0000.00" /> <br/>
	<hr/>
	<f:bundle basename="bundle">
		<f:message key="name" />
	</f:bundle>
	<br/><hr/>
	
	<c:set var="ko" value="ko_KR"/>
	<c:set var="en" value="en_US"/>
	<c:set var="ko_set" value="ko_bundle"/>
	<c:set var="en_set" value="en_bundle"/>
	
	<f:setLocale value="${en}"/>
	<f:bundle basename="${en_set}">
		<f:message key="name"/>
		<f:message key="addr">
			<f:param value="dongrae"/>
			<f:param value="84"/>
		</f:message>
		<f:message key="phone"/>
	</f:bundle>
	<br/><hr/>
	<f:setLocale value="${ko}"/>
	<f:bundle basename="${ko_set}">
		<f:message key="name"/>
		<f:message key="addr">
			<f:param value="동래구"/>
			<f:param value="충렬대로 84"/>
		</f:message>
		<f:message key="phone"/>
	</f:bundle>
</body>
</html>