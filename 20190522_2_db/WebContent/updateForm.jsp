<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");
	
	int m_num = 0;
	
	if(num == null){
		out.print("<script>alert('안됨!');history.go(-1);</script>");
	}else{
		m_num = Integer.parseInt(num);
	}
	
	Statement stmt = con.createStatement();
	
	String sql = "SELECT * FROM member WHERE num="+m_num;	
	
	ResultSet rs = stmt.executeQuery(sql);
	
	String name = "";
	String addr = "";
	
	if(rs.next()){
		name = rs.getString("name");
		addr = rs.getString("addr");
	}
	
	rs.close();
	stmt.close();
	con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="update.jsp" method="post">
		<table>
			<tr>
				<td>번호</td>
				<td><input type="text" name="num" value="<%=m_num%>" readonly/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=name%>"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=addr%>"/></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="수정"/>
				</td>
			</tr>
		</table>		
	</form>
</body>
</html>






