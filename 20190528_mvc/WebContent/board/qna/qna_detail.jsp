<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function fileDown(file_name,event) {
		event.preventDefault();
		//alert(encodeURI(file_name));
		location.href="file_down.bo?board_file=" + encodeURI(file_name);
	}
</script>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<table>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="board_name" value="${boardVo.board_name}" readonly /></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="board_title" value="${boardVo.board_title}" readonly /></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea name="board_content" rows="10" cols="50" readonly>${boardVo.board_content}</textarea></td>
		</tr>
		<c:if test="${!empty boardVo.board_file}">
		<tr>
			<td>첨부파일</td>
			<td>
				<a href="#" onclick="fileDown('${boardVo.board_file}', event);">${boardVO.board_file_origin}</a>
				 ||
				<a href="file_down.bo?board_file=${boardVo.board_file}" download="${boardVo.board_file_origin}">${boardVo.board_file_origin}</a>
				 ||
				<a href="upload/${boardVo.board_file}" download="${boardVo.board_file_origin}">${boardVo.board_file_origin}</a>
			</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2">
				<a href="boardReplyForm.bo?board_num=${boardVo.board_num}">[답글]</a>
				<a href="boardUpdateForm.bo?board_num=${boardVo.board_num}">[수정]</a>
				<a href="boardDeleteForm.bo?board_num=${boardVo.board_num}">[삭제]</a>
				<a href="boardList.bo">[목록]</a>
			</td>
		</tr>
	</table>
	<jsp:include page="../comment/comment.jsp"/>
</body>
</html>