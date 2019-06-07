<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.loadingWrap {position: absolute;width: 100%;height: 100%;background: rgba(0, 0, 0, 0.9);top: 0;left: 0;text-align: center;}
.contentWrap {border: 1px solid white;position: absolute;width: 300px;height: 150px;padding: 15px;top: 50%;left: 50%;margin-top: -75px;margin-left: -150px;color: white;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#mailLoading").css("display", "none");
		$("input[type='submit']").click(function() {
			$("#mailLoading").css("display", "block");
		});
	});
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<form action="findPassSubmit.mb" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>id(email)</td>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="확인" /></td>
			</tr>
		</table>
	</form>
	<div id="mailLoading" class="loadingWrap">
		<div class="contentWrap">
			<h1>메일 전송 중입니다.</h1>
			<br/>
			<br/>
			<img src="img/loading.gif" />
		</div>
	</div>
</body>
</html>