<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT * FROM iot_member WHERE u_id != 'admin' ORDER BY u_num DESC
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellPadding="5">
		<tr>
			<th>회원 번호</th>
			<th>아이디</th>
			<th>회원 등록일</th>
			<th colspan="2">비고</th>
		</tr>
		<c:choose>
			<c:when test="${!empty rs}">
				<c:forEach var="row" items="${rs.rows}">
					<tr>
						<td>${row['u_num']}</td>
						<td>${row['u_id']}</td>
						<td><fmt:formatDate value="${row['u_regdate']}" pattern="yyyy-MM-dd HH:mm:ss.SSS"/></td>
						<td><input type="button" value="수정" onclick="location.href='memberUpdate.jsp?u_num=${row['u_num']}'" /></td>
						<td><input type="button" value="삭제" onclick="location.href='memberDelete.jsp?u_num=${row['u_num']}'" /></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="5">등록된 회원정보가 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>