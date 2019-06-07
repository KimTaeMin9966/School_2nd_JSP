<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<h1>회원정보</h1>
	<table border=1>
		<tr>
			<td>회원번호</td>
			<td>${member.num}</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${member.id}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${member.name}</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>${member.age}</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
		<c:choose>
			<c:when test="${member.gender eq 'male'}">남성</c:when>
			<c:otherwise>여성</c:otherwise>				
		</c:choose>
			</td>
		</tr>
		<tr>
			<td>회원가입일</td>
			<td>${member.regdate}</td>
		</tr>
		<tr>
			<td>회원정보수정일</td>
			<td>${member.updatedate}</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" onclick="location.href='test'" value="메인으로" />
				<input type="button" onclick="location.href='update.mb'" value="정보수정" />
				<input type="button" onclick="location.href='withdraw.mb'" value="회원탈퇴" />
			</td>
		</tr>
	</table>
</body>
</html>