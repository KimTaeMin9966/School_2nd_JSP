<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	Statement stmt = null;
	
	try{
		int m_num = Integer.parseInt(num);
		String sql = 
		"UPDATE member SET name='"+name+"', addr='"+addr+"' WHERE num="+m_num;
		stmt = con.createStatement();
		int result = stmt.executeUpdate(sql);
		out.println("<script>");
		out.println("alert('"+result+"개 행 수정완료');");
		out.println("location.href='memberList.jsp'");
		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
		out.println("<script>");
		out.println("alert('수정실패');");
		out.println("location.href='index.jsp'");
		out.println("</script>");
	}finally{
		stmt.close();
		con.close();
	}
	
%>
