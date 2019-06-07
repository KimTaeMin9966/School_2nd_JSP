<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.*"%>
<%@ page import="vo.*"%>
<%@ include file="checkAdmin.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	Connection conn = JdbcUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "DELETE FROM test_member WHERE num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
%>
<script>
	alert('삭제완료');
	location.href="index.jsp?page=member";
</script>