<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="requestTest2.jsp" method="post">
		이름 : <input type="text" name="name"/> <br/>
		성별 : <input type="radio" name="gender" value="male" checked/> 남
			  <input type="radio" name="gender" value="female"/> 여 <br/>
		취미 : <input type="checkbox" name="hobby" value="영화"/> 영화
		<input type="checkbox" name="hobby" value="축구"/> 축구 
		<input type="checkbox" name="hobby" value="JAVA"/> JAVA 
		<input type="checkbox" name="hobby" value="기타"/> 기타 <br/>
		<input type="submit" value="확인"/>  	  
	</form>
</body>
</html>








