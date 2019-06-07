<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%
	try {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/OracleDB");
		Connection con = ds.getConnection();
		out.print("DB 연결성공");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("DB 연결실패");
	}
%>
<script>
	location.href='main.jsp';
</script>