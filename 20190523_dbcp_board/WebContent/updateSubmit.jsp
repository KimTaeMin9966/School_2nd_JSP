<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("b_num");
	String auth = request.getParameter("b_auth");
	String content = request.getParameter("b_content");
	int b_num = Integer.parseInt(num);

	Connection con = null;
	PreparedStatement pstmt = null;
	String msg = "";
	
	try {
		Context conn = new InitialContext();
		DataSource ds = (DataSource) conn.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
		String sql = "UPDATE board_test SET b_auth = ? , b_content = ? WHERE b_num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, auth);
		pstmt.setString(2, content);
		pstmt.setInt(3, b_num);

		pstmt.executeUpdate();

		msg = "수정성공";
	} catch (Exception e) {
		e.printStackTrace();
		msg = "수정 실패";
	} finally {
		pstmt.close();
		con.close();
		out.print("<script>alert('" + msg + "');location.href='index.jsp';</script>");
	}
%>




