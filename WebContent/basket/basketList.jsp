<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>K O N G</title>
<%-- 
<script language="javascript" type="text/javascript" src="js/index.js">
	
</script>
<script language="javascript" type="text/javascript"
	src="js/jquery-1.6.4.js"></script>
	 --%>
<script>
	function deletecheck() {
		if (confirm("삭제하시겠습니까?")) {
		} else {
			alert("취소되었습니다");
		}
	}
</script>
</head> 
<body>
<div class="container">
	<form name="basketList" method="post">
		<table width="600" align="center" class="table table_condensed table-hover">
			<tr>
				<tr align="center" class="active">
				<td align="center">사진</td>
				<td align="center">전시명</td>
				<td align="center">전시기간</td>
				<td align="center">장소</td>
				<td align="center">취소 </td>
				</tr>

				<s:iterator value="basketList" status="stat">
					<tr>		<!-- img 수정 -->							
						<td width="80" align="center">
						<img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
				width="100px" height="150px" onerror="javascript:this.src='/template/image/main/noimg.png'"></>
						</td>
						<td width="300" align="center">${subject}</td>
						<td width="80"align="center">${date}</td>
						<td width="80"align="center">${address2}</td>
						<td width="80" align="center">
							<input type="button" name="deleteB" value="삭제" 
							onClick="location.href='/basket/deleteBasket.action?basket_num=<s:property value="basket_num"/>'" class="btn btn-xs btn-danger">
						</td>
					</tr> 

				</s:iterator>
					<s:if test="basketList.size() == 0">
						<tr>
							<td colspan="7" align="center"><font size="2">장바구니에
									담긴 상품이 없습니다.</font></td>
						</tr>
						<tr height="40">
							<td align="right" colspan="6">
								<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/sclist.action'" class="btn btn-xs btn-default">
							</td>
						</tr>
					</s:if>
					<s:else>
						<tr height="40">
							<td align="right" colspan="6">
								<input type="button" name="orderB" value="주문하기"
								onClick="location.href='/order/order_checkB.action'" class="btn btn-xs btn-success">
								<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/sclist.action'" class="btn btn-xs btn-default">
							</td>						
						</tr>
					</s:else>
					<tr>
						<td colspan="7" align="center"><s:property value="pagingHtml" escape="false"/></td>
					</tr>
			</table>
		</form>
		</div>
</body>
</html>