<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
		out.println("데이터베이스 연결 성공");

		String sql = "SELECT rownum AS r, board.* FROM (SELECT * FROM board_test ORDER BY b_num ASC) board ORDER BY r DESC";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
		out.println("데이터베이스 연결 실패");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="writeForm.jsp">글작성</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th colspan=2>내용</th>
		</tr>
		<% while (rs.next()) { %>
		<tr>
			<td><%=rs.getInt("r")%></td>
			<td><%=rs.getString("b_auth")%></td>
			<td><%=rs.getString("b_content")%></td>
			<td><a href="updateForm.jsp?b_num=<%=rs.getInt("b_num")%>">수정</a> | <a href="delete.jsp?b_num=<%=rs.getInt("b_num")%>">삭제</a></td>
		</tr>
		<% } %>
	</table>
	<%
		rs.close();
		pstmt.close();
		con.close();
	%>
</body>
</html>










