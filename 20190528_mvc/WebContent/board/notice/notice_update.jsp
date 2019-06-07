<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<h1>공지사항 수정</h1>
	<form action="noticeUpdate.do" method="post">
		<input type="hidden" name="notice_num" value="${notice.notice_num }" />
		<input type="hidden" name="notice_author" value="${member.name }" />
		<table>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="notice_category">
						<option value="${notice.notice_category }" selected>${notice.notice_category }</option>
						<option value="공지">공지</option>
						<option value="알림">알림</option>
						<option value="이벤트">이벤트</option>
						<option value="당첨">당첨</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="notice_title" value="${notice.notice_title }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="notice_content" cols="40" rows="10">${notice.notice_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료" />
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>