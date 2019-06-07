<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="writeSubmit.jsp" method="post">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="b_auth" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="b_content" style="width: 300px; height: 300px; resize: none;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성완료" /></td>
			</tr>
		</table>
	</form>
</body>
</html>



