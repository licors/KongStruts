<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript">
function joinCheck() {
	if (!document.joinform.email.value) {
		alert("이메일주소를 입력해주세요.");
		return false;
	}
	if (!document.joinform.password.value) {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
}
</script>
</head>
<body>
        
       
    <h3 class="subTitle" align="center">회원가입</h3>

		<input type="checkbox" id="agreement" /><label for="agreement" style="cursor:pointer;">서비스 이용약관에 동의 합니다.</label><a href="./agree.jsp" target="_blank">(자세히보기 )</a>
		<input type="checkbox" id="agreement2" /><label for="agreement2" style="cursor:pointer;">개인정보취급방침에 동의 합니다.</label><a href="./agree1.jsp" target="_blank">(자세히보기 )</a> 
		
	<p>
	</p>

	<tr>
	<form name="joinform" method="post" action="memberJoinForm.action" onSubmit="return joinCheck()">
			<input type="text" name="email" size="20"></input> <br> </br> 
			<input type="text" name="passwd" size="20"></input> <br> </br> 
			<input type="submit" name="join" value="가입하기" />
	</form>
	</tr>



</body>
</html>
					