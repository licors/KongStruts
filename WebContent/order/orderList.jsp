<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<tr height="20"></tr>
	<form name="orderList" method="post">
		<table width="700" align="center">
			<tr>
				<td colspan="6" align="center">
					<h1>주문 페이지</h1>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center"></td>
				<td align="center">전시명</td>
				<td align="center">전시기간</td>
				<td align="center">장소</td>
				<td align="center">조회수</td>
				<td align="center">관심티켓수</td>
			</tr>

			<s:iterator value="orderList" status="stat">
				<tr>
					<td></td>
					<td width="360" align="center" colspan="2"><a
						href="orderView.action?order_num=${order_num}&currentPage=${currentPage }">
							${subject } </a></td>
					<td width="80" align="center">${date }</td>
					<td width="80" align="center">${address2 }</td>
					<td width="80" align="center">${readcount }</td>
					<td width="80" align="center">${ordercount }</td>

					<td>
						<hr>
					</td>
				</tr>
			</s:iterator>

			<tr>
				<td colspan="6" align="center"><s:property value="pagingHtml"
						escape="false" /></td>
			</tr>
			<s:if test="orderList.size() == 0">
				<tr>
					<td colspan="6" align="center"><font size="2">구매하신 상품이
							없습니다.</font></td>
				</tr>
			</s:if>

		</table>
	</form>
</body>
</html>