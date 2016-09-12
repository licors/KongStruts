<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>

</head>
<script type="text/javascript">

function joinCheck() {
	 if(!document.getElementById("agreement").checked){
	    	alert("약관에 동의 하셔야합니다.")
	    	
	    	return false;
	    }
	    if(!document.getElementById("agreement2").checked){
	    	alert("약관에 동의 하셔야합니다.")
	    	
	    	return false;
	    }
	    if (!document.joinform.email.value) {
			alert("이메일주소를 입력해주세요.");
			
		return false;
		}
	    if (!document.joinform.password.value) {
			alert("비밀번호를 입력해주세요.");
			
		return false;
		}
	    if (!document.joinform.name.value) {
			alert("이름을 입력해주세요.");
			
		return false;
		}
		 
}
</script>

<body>
        
       
    <h1 align="center">회원가입</h1>
    
	<div align="center">
		<input type="checkbox" id="agreement" /><label for="agreement" style="cursor:pointer;">서비스 이용약관에 동의 합니다.</label><a href="./agree.jsp" target="_blank">(자세히보기 )</a><br>
		<input type="checkbox" id="agreement2" /><label for="agreement2" style="cursor:pointer;">개인정보취급방침에 동의 합니다.</label><a href="./agree1.jsp" target="_blank">(자세히보기 )</a> 
		
	<p>
	</p>
	
	<form name="joinform" method="post" action="/member/memberJoin.action" onsubmit="return joinCheck()">
		<div align="center">
		<table>
		
			<tr>
				<td align="center"></td>
				<td>
					<input type="text" name="email" size="30" maxlength="50" placeholder="이메일주소" class="form-control input-lg"/> 
				</td>
			</tr>
			<tr>
				<td align="center"></td>
				<td>
					<input type="password" name="password" size="30" maxlength="20" placeholder="비밀번호" class="form-control input-lg"/> 
				</td>
			</tr>
			<tr> 
				<td align="center"></td>
				<td>
					<input type="text" name="name" size="30" maxlength="20" placeholder="이름" class="form-control input-lg"/>
				</td>
			</tr>
			<tr> 
				<td align="center"></td>
				<td>
					<input type="text" name="company" size="30" maxlength="20" placeholder="회사" class="form-control input-lg"/> 
				</td>
			</tr>
			
			<tr>
				<td align="center"></td>
				<td>
					<input class="btn btn-success btn-lg btn-block" type="submit" name="join" value="가입하기" />
				</td>
			</tr>
		</table>
		</div>
	</form>



</body>
</html>
					