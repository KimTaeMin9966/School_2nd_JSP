<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<table class="info">
	<tr>
		<td>회원번호</td>
		<td>${member.u_num}</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${member.u_id}</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>${member.u_age}</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<c:choose>
				<c:when test="${member.u_gender eq 'male'}">
					남성
				</c:when>
				<c:otherwise>
					여성
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td>회원등록일</td>
		<td><fmt:formatDate value="${member.u_regdate}" pattern="yyyy-MM-dd HH:mm:ss.SSS"/></td>
	</tr>
	<tr>
		<td colspan=2><input type="button" value="메인" onclick="location.href='index.jsp'" /></td>
	</tr>
</table>