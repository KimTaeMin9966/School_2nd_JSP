<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<% request.setCharacterEncoding("utf-8"); %>

<c:catch var="e">
	<jsp:useBean id="joinMember" class="vo.MemberVo" />
	<jsp:setProperty property="*" name="joinMember" />
</c:catch>

<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT * FROM iot_member WHERE u_id = ?
	<sql:param>${joinMember.u_id}</sql:param>
</sql:query>

<c:choose>
	<c:when test="${!empty e}">
		<script>
			alert('회원 정보가 잘못 되었습니다.');
			history.go(-1);
		</script>
	</c:when>
	<c:when test="${!empty rs.rows}">
		<script>
			alert('이미 사용중인 아이디 입니다.');
			history.go(-1);
		</script>
	</c:when>
	<c:otherwise>
		<sql:update dataSource="jdbc/OracleDB">
			INSERT INTO iot_member VALUES(iot_num_seq.nextval, ?, ?, ?, ?, sysdate)
			<sql:param>${joinMember.u_id}</sql:param>
			<sql:param>${joinMember.u_pass}</sql:param>
			<sql:param>${joinMember.u_age}</sql:param>
			<sql:param>${joinMember.u_gender}</sql:param>
		</sql:update>
		
		<script>
			alert('회원가입 성공');
			location.href='main.jsp?page=login';
		</script>
	</c:otherwise>
</c:choose>