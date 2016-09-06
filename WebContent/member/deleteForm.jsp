
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<link rel="stylesheet" href="css/deleteForm.css" />
<link rel="stylesheet" href="css/index.css" />
<script>
function passwdcheck() {
	if (!document.passwdcheckform.password.value) {
		alert("비밀번호를 입력하세요");
		document.passwdcheckform.password.focus();
		return false;
	}
	if (document.passwdcheckform.password.value != document.passwdcheckform.password2.value) {
		alert("비밀번호를 동일하게 입력하세요");
		document.passwdcheckform.password2.focus();
		return false;
	}
	if (confirm("탈퇴하겠습니까?")) {

	} else {
		alert("취소되었습니다");
		window.location.href = 'memberModifyForm.action';
		return false;
	}
}

function back() {
	history.go(-1);
}
</script>
<center>
		<form name="passwdcheckform" method="post"
			onSubmit="return passwdcheck()" action="deleteAction.action">
			<table width="300" align="center">
				<tr>
					<td align="center" colspan="2"><p><h3>비밀번호를 입력하세요</h3></p></td>
				</tr>
				
				<tr height=20></tr>
				<tr>
					<s:hidden name="id" value="%{resultClass.id}" />
					<td align="center" width="125">비밀번호</td>
					<td><input class="password1" type="password" size="20"
						maxlength="12" name="password"></td>
					<tr>
						<td align="center" width="125">비밀번호확인</td>
						<td><input class="password2" type="password" size="20"
							maxlength="12" name="password2"></td>
					</tr>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input class="delete" type="submit" value="확인"> 
					<input class="cancel" type="button" value="취소" onclick="return back()">
				</tr>
			</table>
		</form>
</center>