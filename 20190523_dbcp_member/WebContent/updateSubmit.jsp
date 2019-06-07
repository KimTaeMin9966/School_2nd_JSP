<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.*"%>
<%@ page import="vo.*"%>
<%@ include file="checkAdmin.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = JdbcUtil.getConnection();
	PreparedStatement pstmt = null;
	
	try {
		String sql = "UPDATE test_member SET pass = ?, name = ?, addr = ?, phone = ? WHERE num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pass);
		pstmt.setString(2, name);
		pstmt.setString(3, addr);
		pstmt.setString(4, phone);
		pstmt.setInt(5, num);
		pstmt.executeUpdate();
		out.print("<script>alert('정보 수정 완료');location.href='index.jsp?page=member'</script>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
%>