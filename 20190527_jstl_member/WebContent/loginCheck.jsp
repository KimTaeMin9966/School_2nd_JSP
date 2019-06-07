<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="loginMember" class="dto.LoginDto" />
<jsp:setProperty property="*" name="loginMember"/>

<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT * FROM iot_member WHERE u_id = ? AND u_pass = ?
	<sql:param>${loginMember.u_id}</sql:param>
	<sql:param>${loginMember.u_pass}</sql:param>
</sql:query>

<c:forEach var="d" items="${rs.rows}">
	<jsp:useBean id="member" class="vo.MemberVo" scope="session" />
	<jsp:setProperty property="u_num" name="member" value="${d['u_num']}"/>
	<jsp:setProperty property="u_id" name="member" value="${d['u_id']}"/>
	<jsp:setProperty property="u_pass" name="member" value="${d['u_pass']}"/>
	<jsp:setProperty property="u_age" name="member" value="${d['u_age']}"/>
	<jsp:setProperty property="u_gender" name="member" value="${d['u_gender']}"/>
	<jsp:setProperty property="u_regdate" name="member" value="${d['u_regdate']}"/>
</c:forEach>

<c:choose>
	<c:when test="${!empty member}">
		<c:if test="${loginMember.login}">
			<jsp:useBean id="cookies" class="util.Cookies"/>
			<c:set var="response" value="<%=response%>"/>
			${cookies.createCookie('id', loginMember.u_id, 60 * 60, response)}
		</c:if>
		<script>
			alert('${member.u_id}님 반갑습니다.');
			location.href='main.jsp';
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('로그인 실패');
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>