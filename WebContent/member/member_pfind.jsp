<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script>
function findpasswordSuccess(){
	alert("'<s:property value="memresultClass.email"/>'님의 비밀번호는 \n'<s:property value="memresultClass.password"/>'\n입니다.");
	window.location.href='memberLoginForm.action';

	
}
</script>

<script>
findpasswordSuccess()
</script>
