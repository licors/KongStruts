<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>comment write</title>
<link rel="stylesheet" href="/Struts2Board/board/common/css/css.css" type="text/css">
<SCRIPT type="text/javascript">
		function validation() {
			if(document.commentForm.content.value == "") {
				alert("내용을 입력해주세요.");
				return false;			
			} 
			return true;
		}
</SCRIPT>

</head> 
<body>
	
	<form name="commentForm" action="/kong/comment/writeAction.action" method="post" onsubmit="return validation();">
	  <s:hidden name="showboard_num" value="%{showboard_num}" />
	
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">*</font> 는 필수 입력사항</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font>내용</td>
			<td bgcolor="#FFFFFF">
				<s:textarea name="content" value="%{resultClass.content}" cols="50" rows="10"></s:textarea>
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
				<input name="submit" type="submit" value="댓글입력" class="inputb">
			</td>
		</tr>	
	</table>
	</form>
</body>
</html>