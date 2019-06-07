<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function directLogin() {
		location.href='main.jsp?page=login';
	}
	function directJoin() {
		var form = document.getElementById('joinForm');
		form.submit();
	}
</script>
<form id="joinForm" action="joinCheck.jsp" method="post">
	<table class="join">
		<tr>
			<td colspan="2"><h1>회원가입</h1></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="u_id" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="u_pass" /></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="u_age" /></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label><input type="radio" name="u_gender" value="male" /> 남성</label>
				<label><input type="radio" name="u_gender" value="female" /> 여성</label>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<button type="button" onclick="javascript:directJoin();">회원가입</button> | 
				<button type="button" onclick="javascript:directLogin();">로그인</button>
			</td>
		</tr>
	</table>
</form>