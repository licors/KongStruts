<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
/* function checkIt() {
	var check = confirm("�ֹ��� ����Ͻðڽ��ϱ�?");
	
	if(check) {
		alert("��� �Ǿ����ϴ�.");
		//�׼� �̵�
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
					<h1>�ֹ� ���� ������</h1>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center"></td>
				<td align="center">��û����</td>
				<td align="center">���ø�</td>
				<td align="center">���ñⰣ</td>
				<td align="center">���</td>
				<td align="center">���ڵ�</td>
				<td align="center">��û/���</td>
			</tr>

			<s:iterator value="orderList" status="stat">
				<tr>
					<td></td>
					<td width="80" align="center">${order_date }</td>
					<td width="360" align="center" colspan="2"><a
						href="orderView.action?order_num=${order_num}&currentPage=${currentPage }">
							${subject } </a></td>
					<td width="80" align="center">${date }</td>
					<td width="80" align="center">${address2 }</td>
					<td width="80" align="center">
						<%--���ڵ� �̹��� �������� --%>
					</td>
					<td width="80" align="center">
						<%-- <tr>${status }</tr>
						<tr>
							<s:if test=${status == "Ƽ�� ��û" }>
							<input type="button" name="status" value="����ϱ�" onclick="checkIt();">
							</s:if>
						</tr> --%>
					</td>
				</tr>
			</s:iterator>

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
			
			<s:if test="orderList.size() == 0">
				<tr>
					<td colspan="6" align="center"><font size="2">�����Ͻ� ��ǰ��
							�����ϴ�.</font></td>
				</tr>
			</s:if>

		</table>
	</form>
</body>
</html>