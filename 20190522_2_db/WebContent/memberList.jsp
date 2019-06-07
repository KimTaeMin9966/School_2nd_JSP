<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Statement stmt = null;
		ResultSet rs = null;
		
		stmt = con.createStatement();
		String sql = "SELECT * FROM member ORDER BY num DESC";
		rs = stmt.executeQuery(sql);		
	%>
	<table border=1>
		<tr>
			<td colspan="3">회원정보</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>주소</td>
		</tr>
	<%
		while(rs.next()){
			int num = rs.getInt("num");
			String name = rs.getString("name");
			String addr = rs.getString("addr");
	%>
		<tr>
			<td><a href="updateForm.jsp?num=<%=num%>"><%=num%></a></td>
			<td><%=name%></td>
			<td><%=addr%></td>
		</tr>
	<%
		}
	rs.close();
	stmt.close();
	con.close();
	%>			
	</table>
</body>
</html>




