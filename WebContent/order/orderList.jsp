<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* function checkIt() {
	var check = confirm("주문을 취소하시겠습니까?");
	
	if(check) {
		alert("취소 되었습니다.");
		//액션 이동
	}
} */
</script>
</head>
<body>
	<tr height="20"></tr>
	<form name="orderList" method="post">
		<table width="700" align="center">
			<tr>
				<td colspan="6" align="center">
					<h1>주문 내역 페이지</h1>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<hr>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF" align="center">
				<td align="center">사진</td>
				<td align="center">신청일자</td>
				<td align="center" colspan="2">티켓 정보</td>
				<td align="center">바코드</td>
				<td align="center">신청/취소</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<hr>
				</td>
			</tr>

			<s:iterator value="orderList" status="stat">
				<tr>
					<td>
					<!-- 이미지 
					<img src="">
					-->
					</td>
					<td width="80" align="center">${order_date }</td>
					<td colspan="2" align="center">
						<table width="100%" border="0" cellspacing="0" cellpadding="2">
							<tbody>
							<tr height="23">
								<td width="70" align="right"><b>전시명:</b> </td>
								<td width="120" align="center"><a
						href="/kong/order/orderView.action?order_num=${order_num}&currentPage=${currentPage }">
							${subject } </a></td>
							</tr>
							<tr height="23">
								<td width="70" align="right">전시일정:</td>
								<td align="center"> ${date }</td>
							</tr>
							<tr height="23">
								<td width="70" align="right">전시장소:</td>
								<td align="center"> ${address2 }</td>
							</tr>
							</tbody>
						</table>
					</td>
					<td width="80" align="center">
						<img src="kong/barcodeImg/${barcode}" width="90">
					</td>
					<td width="80" align="center">
						<%-- 
						<tr>${status }</tr>
						<tr>
							<s:if test=${status == "티켓 신청" }>
							<input type="button" name="status" value="취소하기" onclick="checkIt();">
							</s:if>
						</tr> --%>
					</td>
				</tr>
			</s:iterator>
			
			<s:if test="orderList.size() == 0">
				<tr>
					<td colspan="6" align="center"><font size="2">
					구매하신 상품이 없습니다.</font></td>
				</tr>
			</s:if>
			
			<tr>
				<td colspan="6" align="center">
					<hr>
				</td>
			</tr>
			
			<tr>
				<td colspan="6" align="center">
					<s:property value="pagingHtml" escape="false" />
				</td>
			</tr>

		</table>
	</form>
</body>
</html>