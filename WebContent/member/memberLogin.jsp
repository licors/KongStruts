<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
</head>
<script>
function checkIt() {
	if (!document.loginform.email.value) {
		alert("이메일주소를 입력하세요");
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
	<h2 align="center">문화를 즐기는 방법, 캔고루에 오신 것을 환영합니다.</h2>

	<form name="loginform" action="/member/memberLogin.action" method="post" onsubmit="return checkIt()">
	<div align="center">
	<table>
		<tr>
			<td align="center"></td>
			<td valign="middle" align="left">
				<input type="text" name="email" size="30" maxlength="50" placeholder="이메일주소" class="form-control input-lg"></td>
		</tr>
		
		<tr>
			<td align="center"></td>
			<td valign="middle" align="left">
				<input type="password" name="password" size="30" maxlength="20" placeholder="비밀번호" class="form-control input-lg"></td>
		</tr>
		
		<tr>
			<td align="right" colspan="2">
				<input name="submit" class="btn btn-success btn-lg btn-block" type="submit" value="로그인" class="inputb"><br>
			</td>
			</table>
			<table>
			<tr>
				<td align="center">
					<input type="button" class="btn btn-success" value="회원가입" 	onClick="javascript:location.href='/member/memberJoinForm.action'">
					<input type="button" class="btn btn-success" value="비밀번호 찾기" 	onClick="javascript:location.href='/member/memberpfindF.action'">
				</td>	
			</tr>
				</table>
		
	</div>
	</form>
</body>
</html>