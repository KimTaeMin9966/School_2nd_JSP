<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("b_num");

	Connection con = null;
	PreparedStatement pstmt = null;
	String msg = "";

	try {
		DataSource ds = (DataSource) (new InitialContext().lookup("java:comp/env/jdbc/OracleDB"));
		con = ds.getConnection();
		String sql = "DELETE FROM board_test WHERE b_num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(num));
		int result = pstmt.executeUpdate();
		if (result > 0) msg = "삭제완료";
		else msg = "삭제 내용이 없습니다.";
	} catch (Exception e) {
		e.printStackTrace();
		msg = "삭제 시 문제가 발생했습니다.";
	} finally {
		pstmt.close();
		con.close();
		out.println("<script>alert('" + msg + "');location.href='index.jsp';</script>");
	}
%>