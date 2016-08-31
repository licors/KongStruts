<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="loginform" action="/kong/member/memberLogin.action" method="post" onsubmit="return checkIt()">
	<table>
		<tr>
			<td align="center">이메일</td>
			<td valign="middle" align="left">
			<input type="text" name="email" size="30" maxlength="50"></td>


		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td valign="middle" align="left">
			<input type="password" name="password" size="20" maxlength="20"></td>

		</tr>
		<tr>
			<td align="right" colspan="2">
				<input name="submit" type="submit" value="로그인" class="inputb"> 
				<input type="button" value="회원가입" 	onClick="javascript:location.href='/kong/member/memberJoinForm.action'">
				<!-- 추후 경로 수정해야함 -->
				<input type="button" value="메인으로" class="inputb"
				onClick="javascript:location.href='/kong/showcase/sclist.action'" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>