<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>


<link rel="stylesheet" href="css/modifypasswordForm.css" />
<script language="javascript" type="text/javascript" src="js/index.js">
</script>
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
			<tr>
				<td align="center" colspan="2"><p>비밀번호 변경</p></td>
			</tr>
			<tr>
				<td align="center" width="150">기존 비밀번호</td>
				<td align="left" size="10" maxlength="12" value=""><input
					type="password" name="oldpassword"></td>
			</tr>
			<tr>
				<td align="center" width="150">새 비밀번호</td>
				<td align="left" size="10" maxlength="12" value=""><input
					type="password" name="password"></td>
			</tr>
			<tr>
				<td align="center" width="150">새 비밀번호 확인</td>
				<td align="left" size="10" maxlength="12" value=""><input
					type="password" name="password2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="비밀번호 변경"></td>
			</tr>
		</table>
	</form>
</body>
</html>