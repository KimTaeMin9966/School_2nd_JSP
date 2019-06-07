<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%
		Connection con = null;
	
		try{
			Context init =  new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/java/OracleDB");
			con = ds.getConnection();
			out.println("데이터베이스 연결 성공");
		}catch(Exception e){
			out.println("데이터베이스 연결 실패");
		}finally{
			if(con != null){
				con.close();
			}
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>









