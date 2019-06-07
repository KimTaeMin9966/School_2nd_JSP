<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String selectPage = request.getParameter("page");
	if(selectPage == null){
		selectPage = "new";
	}
	
	selectPage = selectPage+".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin:auto;
		width:990px;
		border:1px solid black;
	}
</style>
</head>
<body>
	<table>
			<tr>
			<td colspan=2 height="150">
				<jsp:include page="header.jsp"/>
			</td>
			</tr>
			<tr>
			<td>
			<!-- nav -->
			<jsp:include page="aside.jsp"></jsp:include>
			</td>
				<td>
				<!-- 본문 -->
				<%-- <jsp:include page='<%=selectPage+".jsp"%>'></jsp:include> --%>
				<jsp:include page='<%=selectPage%>'></jsp:include>
				</td>
				</tr>
				<tr>
				<td colspan=2 height="150">
				<jsp:include page="footer.jsp"></jsp:include>
				</td>
			</tr>
	</table>
</body>
</html>