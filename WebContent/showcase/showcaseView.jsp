<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sd" uri="/struts-dojo-tags"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시 상세보기</title>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyCRSeEVl3pSPGUVWwW4DSwZNDu0Q3AuSpc"></script>
<script src="/js/google_map.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
function fitImageSize(obj, href, maxWidth, maxHeight) {
	var image = new Image();

	image.onload = function(){
	
		var width = image.width;
		var height = image.height;
		
		var scalex = maxWidth / width;
		var scaley = maxHeight / height;
		
		var scale = (scalex < scaley) ? scalex : scaley;
		if (scale > 1) 
			scale = 1;
		
		obj.width = scale * width;
		obj.height = scale * height;
		
		obj.style.display = "";
	}
	image.src = href;
}
</script>
<body>
	<div style="background-color: #FDFEFE">
	<script>
		geocode('<s:property value="resultClass.address1" />', '<s:property value="resultClass.address2" />', '<s:property value="resultClass.subject" />');
	</script>
		<!-- <div style="display:table-cell; align:center; padding-top:15px; padding-bottom:15px; width:600px;"> -->
		<div class="container" style='width:600px; max-width:none !important;'>
			<div class="form-group">
			<table class="table">
				<tr>
					<td colspan="3" align="left"><h2><s:property value="resultClass.subject" /></h2></td>
				</tr>
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
							<input name="support" type="button" value="수정" class="btn btn-default btn-sm"
								onClick="javascript:location.href = '/showcase/scmodify_form.action?showboard_num=<s:property value="%{resultClass.showboard_num}"/>'">
							<input name="support" type="button" value="삭제" class="btn btn-default btn-sm"
								onClick="javascript:location.href = '/showcase/scdelete_form.action?showboard_num=<s:property value="%{resultClass.showboard_num}"/>'">
						</s:if> 
						<input name="basket" type="button" value="관심티켓" class="btn btn-default btn-sm"
							onClick="javascript:location.href = '/basket/addBasket.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
						<input name="order" type="button" value="신청하기" class="btn btn-success btn-sm"
							onClick="javascript:location.href = '/order/order_check.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
						<input name="comment" type="button" value="댓글달기" class="btn btn-default btn-sm"
							onClick="javascript:location.href = '/comment/commentListAction.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
						<input name="basket" type="button" value="메인으로" class="btn btn-default btn-sm" onClick="javascript:location.href = '/showcase/sclist.action'">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<pre class="text-left" style="background-color: #FDFEFE !important;	border: none !important; border-radius: none !important"><s:property value="resultClass.content"/></pre>
						<%-- <textarea name="content" cols="67" rows="10" class="form-control" readonly><s:property value="resultClass.content"/></textarea> --%>
					 
					<br><br>
					<s:if test="resultClass.file_savname != null">
	                    <c:set var="img_paths" value="${fn:split(resultClass.file_savname, ',')}" />
	                    <c:forEach var="file" items="${img_paths}" varStatus="stat">
	                        <c:if test="${stat.index != 0}">
	                            <%-- <img src="<s:property value="img"/>${file}" width="200" height="150" border="0" align="top" /><br> --%>
	                            <img src="<s:property value="img"/>${file}" onload="javascript:fitImageSize(this, '<s:property value="img"/>${file}', 300, 1000);" style="display:none" >
	                        </c:if>
	                    </c:forEach>
					</s:if>
					</td>
				</tr>
				<tr>
				 	<td colspan="3" align="center">
				 		<div id="map-canvas" style="height: 300px; width: 550px"></div>
				 	</td>
				</tr>
				<tr>
					<td><img src="조회할 이미지URL" onload="javascript:fitImageSize(this, '조회할 이미지URL', 300, 1000);" style="display:none" ></td>
				</tr>
			</table>
		</div>
	</div>
	</div>
</body>
</html>