<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
 -->
<title>전시 상세보기</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-1.1.3.1.pack.js" type="text/javascript"></script>
<%-- <script src="../js/jquery.history_remote.pack.js" type="text/javascript"></script>
<script src="../js/jquery.tabs.pack.js" type="text/javascript"></script> --%>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyCRSeEVl3pSPGUVWwW4DSwZNDu0Q3AuSpc"></script>
<script src="/js/google_map.js" type="text/javascript"></script>
<!-- <link rel="stylesheet" href="../js/jquery.tabs.css" type="text/css" media="print, projection, screen">  -->

<script type="text/javascript">
	 $(function() {
		$('#detail-tab').tabs({
			fxSlide : true,
			fxFade : true,
			fxSpeed : 'normal'
		});
	}); 
</script>
</head>

<body>
	<script>
		geocode('<s:property value="resultClass.address1" />', '<s:property value="resultClass.address2" />', '<s:property value="resultClass.subject" />');
	</script>
	<h3><s:property value="resultClass.subject" /></h3>
	<div style="display:table-cell; align:center; padding-top:15px; padding-bottom:15px; width:600px;">
		<table width="600" class="table">
<%-- 			<tr>
				<th colspan="3"><b><s:property value="resultClass.subject" /></b></th>
			</tr> --%>
			<tr>
				<td rowspan="5" align="center" width="200"><img
					src="<s:property value="img"/><s:property value="resultClass.file_savname.split(',')[0]"/>"
					width="150" height="200" border="0"></td>
				<td>주소</td>
				<td><s:property value="resultClass.address1" id="address1"/>&nbsp;<s:property
						value="resultClass.address2" id="address2"/></td>
			</tr>
			<tr>
				<td>일정</td>
				<td><s:property value="resultClass.date" /></td>
			</tr>
			<tr>
				<td>입장료</td>
				<td>
					<s:if test="resultClass.pay != 0">
						<s:property value="resultClass.pay" />
					</s:if>
					<s:else>
						무료
					</s:else>
				</td>
			</tr>
			<tr>
				<td>문의전화</td>
				<td><s:property value="resultClass.tel" /></td>
			</tr>
			<tr>
				<td>태그</td>
				<td><s:property value="resultClass.tag" /></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<s:if test="memresultClass.admin > 0">
						<input name="support" type="button" value="수정"
							onClick="javascript:location.href = 'scmodify_form.action?showboard_num=<s:property value="%{resultClass.showboard_num}"/>'">
						<input name="support" type="button" value="삭제"
							onClick="javascript:location.href = 'scdelete_form.action?showboard_num=<s:property value="%{resultClass.showboard_num}"/>'">
					</s:if> 
					<input name="basket" type="button" value="관심티켓"
						onClick="javascript:location.href = '/basket/addBasket.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
					<input name="order" type="button" value="신청하기"
						onClick="javascript:location.href = '/order/order_check.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
					<input name="comment" type="button" value="댓글달기"
						onClick="javascript:location.href = '/comment/commentListAction.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
					<!-- <input name="basket" type="button" value="메인으로" onClick="javascript:location.href = '/showcase/sclist.action'"> -->
				</td>
			</tr>
			<tr class="success">
				<td colspan="3" align="center">
					<s:property value="resultClass.content" /> ${content} <br> 
				</td>
			</tr>
			<tr>
				<td  colspan="3" align="center">
				<s:if test="resultClass.file_savname != null">
                    <c:set var="img_paths" value="${fn:split(resultClass.file_savname, ',')}" />
                    <c:forEach var="file" items="${img_paths}" varStatus="stat">
                        <c:if test="${stat.index != 0}">
                            <img src="<s:property value="img"/>${file}" width="200" height="150" border="0" align="top" /><br>
                        </c:if>
                    </c:forEach>
				</s:if>
				</td>
			</tr>
			<tr>
				 	<td colspan="3">
				 		<div id="map-canvas" style="height: 300px; width: 600px"></div>
				 	</td>
			</tr>
		</table>
	</div>
</body>
</html>