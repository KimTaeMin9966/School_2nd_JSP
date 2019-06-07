<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String auth = request.getParameter("b_auth");
	String content = request.getParameter("b_content");

	Connection con = null;
	PreparedStatement pstmt = null;
	String message = "";

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();

		String sql = "INSERT INTO board_test values(b_num_seq.nextval, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, auth);
		pstmt.setString(2, content);

		pstmt.executeUpdate();

		message = "글작성 완료";
	} catch (Exception e) {
		e.printStackTrace();
		message = "글작성 실패";
	} finally {

		pstmt.close();
		con.close();
		out.print("<script>alert('" + message + "');location.href='index.jsp'</script>");
	}
%>



