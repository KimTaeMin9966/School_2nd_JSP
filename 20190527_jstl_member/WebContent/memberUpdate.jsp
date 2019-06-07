<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT * FROM iot_member WHERE u_num = ${param.u_num}
</sql:query>
<c:forEach var="row" items="${rs.rows}">
	<jsp:useBean id="updateMember" class="vo.MemberVo" />
	<jsp:setProperty property="u_num" name="updateMember" value="${row['u_num']}"/>
	<jsp:setProperty property="u_id" name="updateMember" value="${row['u_id']}"/>
	<jsp:setProperty property="u_pass" name="updateMember" value="${row['u_pass']}"/>
	<jsp:setProperty property="u_age" name="updateMember" value="${row['u_age']}"/>
	<jsp:setProperty property="u_gender" name="updateMember" value="${row['u_gender']}"/>
</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateSubmit.jsp" method="post">
		<table class="join">
			<tr>
				<td colspan="2"><h1>회원정보수정</h1></td>
			</tr>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="u_num" readonly value="${updateMember.u_num}"/></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_id" readonly value="${updateMember.u_id}"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="u_pass" required value="${updateMember.u_pass}" /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="u_age" required value="${updateMember.u_age}" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose>
						<c:when test="${updateMember.u_gender eq 'male'}">
							<label><input type="radio" name="u_gender" value="male" checked/> 남성</label>
							<label><input type="radio" name="u_gender" value="female"/> 여성</label>
						</c:when>
						<c:otherwise>
							<label><input type="radio" name="u_gender" value="male" /> 남성</label>
							<label><input type="radio" name="u_gender" value="female" checked/> 여성</label>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>