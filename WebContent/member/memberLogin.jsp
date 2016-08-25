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
			<input class="email" type="text" name="id" size="20" maxlength="15"></td>


		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td valign="middle" align="left">
			<input class="password" type="password" name="password" size="20" maxlength="12"></td>

		</tr>


		<tr>
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="작성완료" class="inputb"> 
				<input name="list" type="button" value="목록" class="inputb"
				onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

</form>
	</table>
</body>
</html>