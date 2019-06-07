<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
table {border-collapse: collapse;border: 1px solid black;margin: 50px auto;}
table th, table td {border: 1px solid #ccc;padding: 10px;}
.pageWrap {text-align: center;margin: 20px auto;margin-bottom: 70px;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<h1>회원목록</h1>
	<table>
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>회원등록일</th>
		</tr>
		<!-- 회원목록 memberList-->
	<c:forEach var="user" items="${memberList}">
		<tr>
			<td>${user.num}</td>
			<td>${user.id}</td>
			<td>${user.name}</td>
			<td>${user.age}</td>
			<td>${user.gender =='male' ? '남성' : '여성'}</td>
			<td>${user.regdate}</td>
		</tr>
	</c:forEach>
	</table>
	<div class="pageWrap">
	<c:if test="${pageInfo.page > 1 }">
		<a href="managementPage.mb?page=${pageInfo.page - 1}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
		<a href="managementPage.mb?page=${i}">[ ${i} ]</a>
	</c:forEach>
	<c:if test="${pageInfo.page < pageInfo.maxPage }">
		<a href="managementPage.mb?page=${pageInfo.page + 1}">[다음]</a>
	</c:if>
	</div>
</body>
</html>