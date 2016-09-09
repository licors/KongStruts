<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	function commentModifyView(url) {
        window.open(url, "post", "toolbar=no, width=600, height=600 ,directories=no, status=no, scrollbars=yes, menubar=no, location=no, resizable=no");
    }
	 
	function popupWindow(url) {
		window.open(url, "post", "toolbar=no, width=600, height=600 ,directories=no, status=no, scrollbars=yes, menubar=no, location=no, resizable=no");
	}
</script>
<title>전시 댓글</title>
</head>

<body>
	<div class="container" style="width: 600px; max-width: none !important;"> <!-- 여기 선언해서 고정폭사용 -->
            <div class="panel panel-default"> <!-- 위쪽 제목 -->
                <div class="panel-heading">댓글</div>
                <div class="panel-body"> <!-- 본문 -->
					<!-- 코멘트 입력 폼 -->
					<form name="commentForm" action="/comment/commentWriteAction.action"
						method="post" onsubmit="return validation();">
						<s:hidden name="showboard_num" value="%{showboard_num}" />
						<s:hidden name="member_num" value="%{member_num}" />
						<s:hidden name="ref" value="0"></s:hidden>
				
						<table width="550" border="0" cellspacing="0" cellpadding="0" class="table-condensed">
							<tr>
								<td>내용</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">
									<s:textarea name="content" value="%{CommentResultClass.content}" cols="50" rows="3" ></s:textarea>
								</td>
							</tr>
	<!-- 						<tr bgcolor="#777777">
								<td height="1" colspan="2"></td>
							</tr>
							<tr>
								<td height="10" colspan="2"></td>
							</tr> -->
							<tr>
								<td align="right" colspan="2"><input name="submit"
									type="submit" value="댓글입력" class="inputb"></td>
							</tr>
							<tr>
								<s:if test="login_member_num == -1">
									<td colspan="2"><a href="/member/memberLogin.jsp">로그인</a> 하셔야 이용하실 수 있습니다.</td>
								</s:if>
							</tr>
						</table>
					</form>
					<br><br><br>
					<!-- 코멘트 리스트 -->
					<form id="commentList">
						<table id="listTable" width="550" border="0" cellspacing="0" cellpadding="2">
							<tr align="center" bgcolor="#f3f3f3">
								<td width="340"><strong>내용</strong></td>
								<td width="50"><strong>글쓴이</strong></td>
								<td width="80"><strong>날짜</strong></td>
								<td width="40">수정</td>
								<td width="40">삭제</td>
							</tr>
					
							<tr bgcolor="#777777">
								<td height="1" colspan="5"></td>
							</tr>
					
							<s:iterator value="list" status="stat">
								<s:url id="viewURL" action="commentModifyFormAction">
									<s:param name="comment_num">
										<s:property value="comment_num" />
									</s:param>
									<s:param name="showboard_num">
										<s:property value="showboard_num" />
									</s:param>
								</s:url>
					
								<tr>
									<td width="350" align="left">
										<s:if test="re_level != 0">
											<c:forEach var="i" begin="${re_level}" end="0">&nbsp;</c:forEach>→
					                    </s:if> 
					                    <s:property value="content" />
									</td>
									<td width="70" align="center"><s:property value="name" /></td>
									<td width="80" align="center"><s:property value="reg_date"/></td>
									<%-- <td width="50" align="center"><a href='javascript:location.href="/comment/commentModifyAction.action?comment_num=<s:property value='%{comment_num}'/>"'>수정</a></td> --%>
									<td width="50" align="center">
										<s:if test="login_member_num == member_num">
										<%-- <a href="javascript:commentModifyView('${viewURL}')">수정</a> --%>
											<a href="javascript:location.href='${viewURL}'">수정</a>
										</s:if>
									</td>
									<td width="50" align="center">
										<s:if test="login_member_num == member_num">
											<a href='javascript:location.href="/comment/commentdeleteAction.action?comment_num=<s:property value='%{comment_num}'/>"'>삭제</a>
										</s:if>
									</td>
								</tr>
					
								<tr bgcolor="#777777">
									<td height="1" colspan="5"></td>
								</tr>
					
							</s:iterator>
					
							<s:if test="list.size() <= 0">
								<tr>
									<td colspan="5" align="center">등록된 게시물이 없습니다</td>
								</tr>
							</s:if>
					
							<tr align="center">
								<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
							</tr>
							<tr>
								<td align="right"><input name="back" type="button" value="뒤로" onClick="javascript:location.href='/showcase/scread.action?showboard_num=<s:property value="%{showboard_num}"/>'"></td>
							</tr>
						</table>
					</form>
				</div>
				</div>
			</div>
</body>
</html>