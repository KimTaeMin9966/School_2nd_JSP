<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String msg ="", nextPage = "";
	
	try {
		conn = JdbcUtil.getConnection();
		String sql = "SELECT * FROM test_member WHERE id = ? AND pass = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		rs = pstmt.executeQuery();
		
		MemberVo m = null;
		
		if (rs.next()) {
			m = new MemberVo(rs.getInt("num"), rs.getString("id"), rs.getString("pass"), rs.getString("name"),
							rs.getString("addr"), rs.getString("phone"));
		}
		
		if (m != null) {
			session.setAttribute("member", m);
			if (login != null) response.addCookie(Cookies.createCookie("id", m.getId(), 60 * 60));
			msg = "로그인 성공";
		} else {
			msg = "로그인 실패";
			nextPage = "login";
		}
	} catch (Exception e) {
		e.printStackTrace();
		msg = "로그인 실패";
		nextPage = "login";
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
		out.print("<script>alert('" + msg + "');location.href='index.jsp?page=" + nextPage + "'</script>");
	}
 %>