<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<title>수정</title>
<script type="text/javascript">
	function validation() {
		if (!document.commentForm.content.value) {
			alert("내용을 입력해 주세요.");
			
			return false;
		}
	}

</script>
</head>
<body>
<form name="commentForm" action="/comment/commentModifyAction.action" method="post" onsubmit="return validation();">
		<s:hidden name="showboard_num" value="%{showboard_num}" />
		<s:hidden name="comment_num" value="%{comment_num}" />
		<s:hidden name="ref" value="0"></s:hidden>

		<table width="600" border="0" cellspacing="0" cellpadding="0">
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td bgcolor="#F4F4F4"><font color="#FF0000">*</font>내용</td>
				<td bgcolor="#FFFFFF"><s:textarea name="content" value="%{commentResultClass.content}" cols="50" rows="3" ></s:textarea>
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td height="10" colspan="2"></td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input name="submit" type="submit" value="수정" class="inputb">
					<input name="back" type="button" value="뒤로" onClick="javascript:location.href='/comment/commentListAction.action?showboard_num=<s:property value="%{showboard_num}"/>'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>