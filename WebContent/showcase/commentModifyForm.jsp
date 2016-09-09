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
<div class="container" style="width: 600px; max-width: none !important;"> <!-- 여기 선언해서 고정폭사용 -->
           <div class="panel panel-default"> <!-- 위쪽 제목 -->
               <div class="panel-heading">댓글</div>
               <div class="panel-body"> <!-- 본문 -->
				<!-- 코멘트 입력 폼 -->
				<form name="commentForm" action="/comment/commentModifyAction.action" method="post" onsubmit="return validation();">
					<div class="form-group">
					<s:hidden name="showboard_num" value="%{showboard_num}" />
					<s:hidden name="comment_num" value="%{comment_num}" />
					<s:hidden name="ref" value="0"></s:hidden>
			
					<table width="550" border="0" cellspacing="0" cellpadding="0" class="table-condensed">
						<tr>
							<td align="left">
								내용<br>
								<!-- <textarea class="form-control" rows="" cols="" name="content"></textarea> -->
								<textarea name="content" rows="3" class="form-control"></textarea>
								<%-- <s:textarea name="content" value="%{CommentResultClass.content}" rows="3" cols="50" ></s:textarea> --%>
							</td>
						</tr>
<!-- 						<tr bgcolor="#777777">
							<td height="1" colspan="2"></td>
						</tr>
						<tr>
							<td height="10" colspan="2"></td>
						</tr> -->
						<tr>
							<td align="right">
								<input name="submit" type="submit" value="댓글수정" class="btn btn-success">
								<input name="back" type="button" value="취소" class="btn btn-default" onClick="javascript:location.href='/comment/commentListAction.action?showboard_num=<s:property value="%{showboard_num}"/>'">
							</td>
						</tr>
					</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>