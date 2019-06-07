<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:if test="${!empty cookie.id.value}">
	<sql:query var="rs" dataSource="jdbc/OracleDB">
		SELECT * FROM iot_member WHERE u_id = ?
		<sql:param>${cookie.id.value}</sql:param>
	</sql:query>

	<c:forEach var="d" items="${rs.rows}">
		<jsp:useBean id="member" class="vo.MemberVo" scope="session" />
		<jsp:setProperty property="u_num" name="member" value="${d['u_num']}" />
		<jsp:setProperty property="u_id" name="member" value="${d['u_id']}" />
		<jsp:setProperty property="u_pass" name="member" value="${d['u_pass']}" />
		<jsp:setProperty property="u_age" name="member" value="${d['u_age']}" />
		<jsp:setProperty property="u_gender" name="member" value="${d['u_gender']}" />
		<jsp:setProperty property="u_regdate" name="member" value="${d['u_regdate']}" />
	</c:forEach>
</c:if>
<header>
	<ul>
		<c:choose>
			<c:when test="${!empty sessionScope.member}">
				<li><a href="main.jsp?page=info">${member.u_id}</a>님 방가</li>
				<c:if test="${member.u_id eq 'admin'}">
				<li><a href="main.jsp?page=member">회원관리</a></li>
				</c:if>
				<li><a href="logOut.jsp">로그아웃</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="main.jsp?page=login">로그인</a></li>
				<li><a href="main.jsp?page=join">회원가입</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</header>