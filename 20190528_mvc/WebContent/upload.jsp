<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="fileUpload.test" method="post" enctype="multipart/form-data">
		<input type="text" name="testText" /> <br>
		<input type="file" name="uploadFile" /> <br>
		<input type="submit" name="upload" />
	</form>
</body>
</html>