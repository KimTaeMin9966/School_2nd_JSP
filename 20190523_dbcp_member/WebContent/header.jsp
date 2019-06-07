<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.*" %>
<%@ page import="vo.*" %>
<%
	Cookies cookie = new Cookies(request);

	if (cookie.exists("id")) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String msg ="", nextPage = "";
		
		try {
			conn = JdbcUtil.getConnection();
			String sql = "SELECT * FROM test_member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cookie.getValue("id"));
			rs = pstmt.executeQuery();
			
			MemberVo m = null;
			
			if (rs.next()) {
				m = new MemberVo(rs.getInt("num"), rs.getString("id"), rs.getString("pass"), rs.getString("name"),
						rs.getString("addr"), rs.getString("phone"));
				session.setAttribute("member", m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}
	
	MemberVo sessionMember = (MemberVo) session.getAttribute("member");
%>
<header>
	<ul>
		<% if (sessionMember != null) { %>
		<li><a href="index.jsp?page=info"><%=sessionMember.getName() %></a>님 반갑습니다.</li>
		<% if (sessionMember.getId().equals("admin")) { %>
		<li><a href="index.jsp?page=member">회원관리</a></li>
		<% } %>
		<li><a href="logout.jsp">로그아웃</a></li>
		<% } else { %>
		<li><a href="index.jsp?page=login">로그인</a></li>
		<li><a href="index.jsp?page=join">회원가입</a></li>
		<% } %>
	</ul>
</header>