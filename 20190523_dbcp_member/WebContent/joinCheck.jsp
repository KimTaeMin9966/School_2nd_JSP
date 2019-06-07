<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="joinMember" class="vo.MemberVo" />
<jsp:setProperty property="*" name="joinMember"/>

<%= joinMember %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String msg ="", nextPage = "";
	
	try {
		conn = JdbcUtil.getConnection();
		String sql = "SELECT * FROM test_member WHERE id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			out.print("<script>alert('이미 존재하는 아이디 입니다.');location.href='index.jsp?page=join'</script>");
			return;
		}

		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		
		sql = "insert into test_member(num, id, pass, name, addr, phone) values(test_member_seq.nextval, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		pstmt.setString(2, joinMember.getPass());
		pstmt.setString(3, joinMember.getName());
		pstmt.setString(4, joinMember.getAddr());
		pstmt.setString(5, joinMember.getPhone());
		int result = pstmt.executeUpdate();
		msg = "회원가입 완료";
		nextPage = "login";
	} catch (Exception e) {
		e.printStackTrace();
		msg = "회원가입 실패";
		nextPage = "join";
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
		out.print("<script>alert('" + msg + "');location.href='index.jsp?page=" + nextPage + "'</script>");
	}
%>