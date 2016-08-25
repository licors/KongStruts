<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주 문 성 공</title>
</head>
<body>
	<center>
	<tr>
		<td bgcolor="white" height="50" align="center" width="170" colspan="2">
							<h3>신청이 <font color="red"><b>완료</b></font>되었습니다.</h3></td></tr>
		<table width="400" cellpadding="7" cellspacing="2"
					bordercolordark="white" bordercolorlight="white"
					bgcolor="#E1E1E1" style="margin: 20px 0 0 0;">
					<tbody>
						
						<s:if test='order_trade_payer != null'>
						<tr height=30>
						    <td bgcolor="white" height="20" align="center" width="50"><b>입금 계좌 </b></td>
						    <td bgcolor="white" height="20" align="center" width="120">
						    <b><s:property value="order_paramClass.order_trade_num"/></b>
						    </td>
						</tr>
						<tr height=30>
						    <td bgcolor="white" height="20" align="center" width="50"><b>입금자 성명 </b></td>
						    <td bgcolor="white" height="20" align="center" width="120">
						    <b><s:property value="order_trade_payer"/></b>
						    </td>
						</tr>
						</s:if>
						<tr>
							<td bgcolor="white" height="30" align="center" width="150" colspan="2">
							<a href="orderL.action?currentPage=1"> 구매목록  </a>
							</td>
							
						</tr>
						

					</tbody>
				</table>
	</center>
</body>
</html>