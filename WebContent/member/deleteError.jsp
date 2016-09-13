<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<script>
function deleteError(){
	alert("비밀번호가 틀립니다");
	window.location.href = 'deleteForm.action';
}
</script>

<script>
deleteError()
</script>
