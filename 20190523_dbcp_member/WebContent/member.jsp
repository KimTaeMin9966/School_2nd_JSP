<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.*"%>
<%@page import="util.*"%>
<%@ include file="checkAdmin.jsp" %>
<%
	ArrayList<MemberVo> list = new ArrayList<>();
	Connection conn = JdbcUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		pstmt = conn.prepareStatement("SELECT * FROM test_member");
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			MemberVo m = new MemberVo(rs.getInt("num"), rs.getString("id"), rs.getString("pass"),
					rs.getString("name"), rs.getString("addr"), rs.getString("phone"));
			list.add(m);
			//out.println(m + "<br/>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
%>
<h1>회원목록</h1>
<table border="1">
	<tr>
		<th>회원번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
	</tr>
	<% for (MemberVo m : list) { %>
	<tr onclick="location.href='index.jsp?page=memberInfo&num=<%=m.getNum()%>'">
		<td><%=m.getNum() %></td>
		<td><%=m.getId() %></td>
		<td><%=m.getName() %></td>
		<td><%=m.getAddr() %></td>
		<td><%=m.getPhone() %></td>
	</tr>
	<% } %>
</table>