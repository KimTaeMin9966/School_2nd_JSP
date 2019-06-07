<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	Connection con = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "java";
	String pass = "java";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC CONNECTION & INSERT TEST</title>
</head>
<body>
	<%
		Statement stmt = null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,pass);
			out.print("<h3>데이터베이스 연결 성공</h3>");
			stmt = con.createStatement();
			String sql = "INSERT INTO member " 
						+" VALUES(m_num.nextval,'"+name+"','"+addr+"')";
			int result = stmt.executeUpdate(sql);
			if(result > 0){
				out.print("회원 정보 등록 완료");
			}else{
				out.print("회원 정보 등록 실패");
			}
		}catch(Exception e){
			e.printStackTrace();
			out.print("<h3>데이터베이스 연결 실패</h3>");
		}finally{
			stmt.close();
			con.close();
		}
	%>
	
	<script>
		location.href="index.jsp";
	</script>

</body>
</html>





