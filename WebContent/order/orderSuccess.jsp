<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� �� �� ��</title>
</head>
<body>
	<center>
	<tr>
		<td bgcolor="white" height="50" align="center" width="170" colspan="2">
							<h3>��û�� <font color="red"><b>�Ϸ�</b></font>�Ǿ����ϴ�.</h3></td></tr>
		<table width="400" cellpadding="7" cellspacing="2"
					bordercolordark="white" bordercolorlight="white"
					bgcolor="#E1E1E1" style="margin: 20px 0 0 0;">
					<tbody>
						
						<s:if test='barcode == null'>
							<tr height="40" align="center">
								<b> ����ȸ�� �����Ͻ� �� ���ڵ带 ������ �ּ���. </b>
							</tr>
							<tr height=30>	<!-- //���ڵ� �̹��� -->
								<td>
							    <b><s:property value="order_paramClass.barcode"/></b>
							    </td>
							</tr>
						</s:if>
						<tr>
							<td bgcolor="white" height="30" align="center" width="150" colspan="2">
							<a href="orderList.action?currentPage=1"> ���Ÿ��  </a>
							</td>
							
						</tr>
						

					</tbody>
				</table>
	</center>
</body>
</html>