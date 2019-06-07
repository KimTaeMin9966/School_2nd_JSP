<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%

	Connection con  = null;
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "java";
	String pass = "java";
	
	Class.forName(driver);
	
	con = DriverManager.getConnection(url,user,pass);
%>

