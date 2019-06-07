<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:update dataSource="jdbc/OracleDB">
	DELETE FROM iot_member WHERE u_num = ${param.u_num}
</sql:update>
<script>
	alert('삭제완료');
	location.href='main.jsp?page=member';
</script>