<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
	<form name="loginform" action="LoginAction.action" method="post" onsubmit="return checkIt()">
		<tr>
			<td align="center">이메일</td>
			<td valign="middle" align="left">
			<input type="text" name="email" size="20" maxlength="15"></td>


		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td valign="middle" align="left">
			<input type="password" name="passwd" size="20" maxlength="12"></td>

		</tr>


		<tr>
			<td align="right" colspan="2">
				<input name="submit" type="submit" value="로그인" class="inputb"> 
				<!-- 추후 경로 수정해야함 -->
				<input name="list" type="button" value="메인으로" class="inputb"
				onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

</form>
	</table>
</body>
</html>