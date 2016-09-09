<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<script language="javascript">
	function passwdcheck() {
	
		if (!document.changepasswd.oldpassword.value) {
			alert("기존 비밀번호를 입력하세요");
			document.changepasswd.oldpassword.focus();
			return false;
		}
		if (!document.changepasswd.password.value) {
			alert("새 비밀번호를 입력하세요");
			document.changepasswd.password.focus();
			return false;
		}
		if (!document.changepasswd.password2.value) {
			alert("새 비밀번호 확인을 입력하세요");
			document.changepasswd.password2.focus();
			return false;
		}
		if (document.changepasswd.password.value != document.changepasswd.password2.value) {
			alert("새 비밀번호가 일치하지 않습니다");
			document.changepasswd.password.value = "";
			document.changepasswd.password2.value = "";
			document.changepasswd.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form name="changepasswd" action="memberPMF2.action"
		method="post" onSubmit="return passwdcheck()">
		<table width="300" cellpadding="1" cellspacing="0" border="1"
			align="center">
			<tr height="35">
				<td align="center" colspan="2"><h3>비밀번호 변경</h3></td>
			</tr>
			<tr height="35">
				<td align="center" width="150">기존 비밀번호</td>
				<td align="left" size="10" maxlength="12" value=""><input
					type="password" name="oldpassword"></td>
			</tr>
			<tr height="35">
				<td align="center" width="150">새 비밀번호</td>
				<td align="left" size="10" maxlength="12" value=""><input
					type="password" name="password"></td>
			</tr>
			<tr height="35">
				<td align="center" width="150">새 비밀번호 확인</td>
				<td align="left" size="10" maxlength="12" value=""><input
					type="password" name="password2"></td>
			</tr>
			<tr height="35">
				<td colspan="2" align="center"><input type="submit" class="btn btn-default"
					value="비밀번호 변경"></td>
			</tr>
		</table>
	</form>
</body>
</html>