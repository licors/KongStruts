<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function checkIt() {
	if (!document.loginform.email.value) {
		alert("아이디를 입력하세요");
		document.loginform.email.focus();
		return false;
	}
	if (!document.loginform.password.value) {
		alert("비밀번호를 입력하세요");
		document.loginform.password.focus();
		return false;
	}

}
</script>
<body>
	<form name="loginform" action="/member/memberLogin.action" method="post" onsubmit="return checkIt()">
	<div align=center>
	<table>
		<tr>
			<td align="center">이메일</td>
			<td valign="middle" align="left">
			<input type="text" name="email" size="30" maxlength="50"></td>


		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td valign="middle" align="left">
			<input type="password" name="password" size="31" maxlength="20"></td>

		</tr>
		<tr>
			<td align="right" colspan="2">
				<input name="submit" type="submit" value="로그인" class="inputb"> 
				<input type="button" value="회원가입" 	onClick="javascript:location.href='/member/memberJoinForm.action'">
				<input type="button" value="비밀번호 찾기" 	onClick="javascript:location.href='/member/memberpfindF.action'">
				
			</td>
		</tr>
	</table>
	</div>
	</form>
</body>
</html>