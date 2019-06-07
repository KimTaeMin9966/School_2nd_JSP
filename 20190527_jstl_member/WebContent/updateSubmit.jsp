<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="updateMember" class="vo.MemberVo" />
<jsp:setProperty property="*" name="updateMember"/>
<sql:update dataSource="jdbc/OracleDB">
	UPDATE iot_member SET u_pass = ?, u_age = ?, u_gender = ? WHERE u_num = ?
	<sql:param>${updateMember.u_pass}</sql:param>
	<sql:param>${updateMember.u_age}</sql:param>
	<sql:param>${updateMember.u_gender}</sql:param>
	<sql:param>${updateMember.u_num}</sql:param>
</sql:update>

<script>
	alert('${updateMember.u_id}님 정보 수정 완료');
	location.href='main.jsp?page=member';
</script>