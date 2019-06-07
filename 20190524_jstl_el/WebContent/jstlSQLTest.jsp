<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <s:setDataSource var="conn" driver="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@localhost:1521:orcl" user="java" password="java" /> --%>

	<s:update dataSource="jdbc/OracleDB">
		INSERT INTO test_member VALUES(test_member_seq.nextval, 'id000', 'pass', 'blank', 'blank', 'blank')
	</s:update>
	
	<%-- <s:update dataSource="${conn}">
		UPDATE test_member SET addr ='서울' WHERE id = 'KimTaeMin'
	</s:update> --%>
	
	<s:query var="rs" dataSource="jdbc/OracleDB">
		SELECT * FROM test_member
	</s:query>
	
	<c:forEach var="data" items="${rs.rows}">
		<c:out value="${data['name']}" />
		<c:out value="${data['addr']}" />
		<c:out value="${data['phone']}" /> <br/>
	</c:forEach>
</body>
</html>