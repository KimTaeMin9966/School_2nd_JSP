<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
	%>
	
	이름은 : <%=name %>
	<br/>
	성별은 : <%if(gender.equals("male")){ %>
				남자	
			<%}else{ %>
				여자
			<%} %>
	<br/>
	취미 : <% for(String s : hobbys){ %>
				<%=s%>
		   <%} %>
   <br/>
    취미 : <% for(String s : hobbys){
    			out.print(s);
    		}	
    	   %>
    
</body>
</html>






