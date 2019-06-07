<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url ="jdbc:oracle:thin:@localhost:1521:orcl";
		String username = "java";
		String password = "java";
		
		Connection con = null;
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url,username,password);
			out.println("연결 성공");
		}catch(Exception e){
			out.println("연결 실패 : " + e.getMessage());
		}finally{
			con.close();
		}
	%>
	
	<a href="insertForm.jsp">회원 정보 입력</a> <br/>
	<a href="memberList.jsp">회원 정보 확인</a> <br/>
</body>
</html>







