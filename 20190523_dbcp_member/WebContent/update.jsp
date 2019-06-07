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
	MemberVo m = null;
	
	try {
		String sql = "SELECT * FROM test_member WHERE num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			m = new MemberVo(rs.getInt("num"), rs.getString("id"), rs.getString("pass"),
					rs.getString("name"), rs.getString("addr"), rs.getString("phone"));
		} else {
			out.print("<script>alert('등록된 회원정보가 없습니다.');location.href='index.jsp?page=member'</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
%>
<form action="updateSubmit.jsp" method="post">
	<table class="info">
		<tr>
			<td>회원번호</td>
			<td><input type="text" name="num" value="<%=m.getNum()%>" readonly/></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="<%=m.getId()%>"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="pass" value="<%=m.getPass()%>"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=m.getName()%>"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr" value="<%=m.getAddr()%>"/></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone" value="<%=m.getPhone()%>"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정완료"/>
			</td>
		</tr>
	</table>
</form>
<script>
	function memberDelete(num) {
		var isDelete = confirm('회원정보를 삭제 하시겠습니까?');
		if (isDelete) location.href="index.jsp?page=delete&num=" + num;
	}
</script>