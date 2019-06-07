<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("b_num");
	
	if (num == null || num.trim().equals("")) {
		out.println("<scrip>alert('잘못된 정보입니다.');location.href='index.jsp'</script>");
		return;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String auth = "";
	String content = "";
	int b_num = 0;

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();

		b_num = Integer.parseInt(num);

		String sql = "SELECT b_auth, b_content FROM board_test WHERE b_num = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, b_num);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			auth = rs.getString("b_auth");
			content = rs.getString("b_content");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		rs.close();
		pstmt.close();
		conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 수정</h1>
	<form action="updateSubmit.jsp" method="post">
		<input type="hidden" name="b_num" value="<%=b_num%>" />
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="b_auth" value="<%=auth%>" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="b_content" style="width: 300px; height: 300px; resize: none;"><%=content%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성완료" /></td>
			</tr>
		</table>
	</form>
</body>
</html>