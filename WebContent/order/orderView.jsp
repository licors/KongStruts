<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function deletecheck() {
		if (confirm("�ֹ��� ����Ͻðڽ��ϱ�?")) {
		} else {
			alert("��ҵǾ����ϴ�");
			return false;
		}
	}
</script>
</head>
<body>
	<form name="detailForm" method="post" action="orderDelete.action"
		onsubmit="return deletecheck()">
		<table width="700" border="0" cellspacing="0" cellpadding="2"
			align="center">
			<s:hidden name="order_num" value="%{order_resultClass.order_num}" />
			<s:hidden name="barcode"
				value="%{order_resultClass.barcode}" />	<!-- �� �Ѱ���ߵǳ� -->
			<tbody>
			</tbody>
		</table>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<table width="700" border="0" cellspacing="1" cellpadding="5"
					align="center" bgcolor="#CCCCCC">

					<tbody>
						<tr bgcolor="#F0F0F0">
							<td colspan="5" align="center"><strong>��û Ƽ��</strong></td>
						</tr>
						<tr bgcolor="#FFFFFF" align="center">
							<td width="90">�̹���</td>
							<td colspan="2">�ֹ���ǰ ������</td>
							<td width="90">���ڵ�</td>
						</tr>

						<tr bgcolor="#FFFFFF" align="center">
							<td>
							<a href="gboardV.action?goods_num=${show_resultClass.showboard_num }"> <!-- ������������ -->
							<img src="showcase/upload/<s:property value="show_resultClass.file_savname.split(',')[0]"/>"
									width="90" />
							</a>
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="2">
									<tbody>
										<tr height="25">
											<td width="120" align="left">�������</td>
											<td width="150" align="center"><b><s:property value="order_resultClass.order_trade_type" /></b>
											<s:if test="order_resultClass.order_trade_payer!=null">
											(<s:property value="order_resultClass.order_trade_payer"/>)
											</s:if>
											<br></td>
										</tr>
										<tr height="25">
											<td width="120" align="left">��û ����</td>
											<td align="center"><b><s:property value="order_resultClass.order_status" /></b></td>
										</tr>
										<tr height="25">
											<td width="120" align="left">��û ��ȣ</td>
											<td align="center"><b><s:property value="order_resultClass.barcode" /></b><br></td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr height="23">
										<td width="70" align="left">��ǰ��</td>
										<td width="120" align="center"><b><s:property value="order_resultClass.order_goods_name" /></b></td>
									</tr>
									<tr height="23">
										<td width="60" align="left">������</td>
										<td align="center"><b><s:property value="order_resultClass.order_goods_size" /></b></td>
									</tr>

									<tr height="23">
										<td width="60" align="left">����</td>
										<td align="center"><b><s:property value="order_resultClass.order_goods_color" /></b></td>
									</tr>
									<tr height="23">
											<td width="60" align="left">����</td>
											<td align="center"><b>
											<s:property value="order_resultClass.order_goods_price" />&nbsp;��</b></td>
									</tr>
									
								</table>
							</td>
							<td><s:property value="order_resultClass.order_goods_amount" />��</td>
						</tr>

						<tr bgcolor="#FFFFFF" align="center">
							<td colspan="4" align="right">
								<table width="700" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td align="left">
											<s:if test="order_resultClass.order_trade_num != null">
											�Աݰ��� : <s:property value="order_resultClass.order_trade_num" />
											</s:if>
											</td>
											<td colspan="2" align="right" width="180"><b>�� �����ݾ� : </b><s:property value="order_resultClass.order_sum_money" />��</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td align="center">&nbsp;</td>
		</tr>
		<tr>
			<td>
				<table border="0" width="700" cellpadding="7" cellspacing="2"
					bordercolordark="white" bordercolorlight="#626262" align="center"
					bgcolor="#E1E1E1">
					<tbody>
						<tr valign="top">
							<td bgcolor="#EFEFEF" height="20" align="center" width="150"
								valign="middle"><font size="2"><b>������ ����</b></font></td>
							<td bgcolor="#F7F7F7">
								<table width="680" border="0" cellspacing="0" cellpadding="1"
									align="center">
									<tbody>
										<tr>
											<td width="80">&nbsp;&nbsp;��<font color="#F7F7F7">____</font>��
											</td>
											<td width="361"><input class="inputb" name="order_receive_name" value="${order_resultClass.order_receive_name}"
												size="10" readonly></td>
										</tr>
										<tr>
											<td width="80">&nbsp;&nbsp;�����ȣ</td>
											<td width="361">
												<table width="210" border="0" cellspacing="0"
													cellpadding="0">
													<tbody>
														<tr>
															<td width="34"><input class="inputb" name="order_receive_zipcode" 
															value="${order_resultClass.order_receive_zipcode}"
																size="7" maxlength="7" readonly></td>
															<td width="100">
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td width="80">&nbsp;&nbsp;��<font color="#F7F7F7">____</font>��
											</td>
											<td width="361"><input class="inputb" name="order_receive_addr1"
												value="${order_resultClass.order_receive_addr1}" size="50" readonly></td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td width="80">&nbsp;&nbsp;��ȭ��ȣ</td>
											<td width="361"><input class="inputb" type="text" name="order_receive_mobile"
											
											value="${order_resultClass.order_receive_mobile}" size="15" maxlength="15" readonly></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center" height="20">&nbsp;</td>
		</tr>
			<table border="0" width="700" cellpadding="7" cellspacing="2"
					bordercolordark="white" bordercolorlight="#626262" align="center"
					bgcolor="#E1E1E1">
					<tbody>
						<tr valign="top">
							<td bgcolor="#EFEFEF" height="20" align="center" width="150"
								valign="middle"><font size="2"><b>�߰��Է� </b></font></td>
							<td bgcolor="#F7F7F7">
								<table width="680" border="0" cellspacing="0" cellpadding="1"
									align="center">
									<tbody>
										<tr bgcolor="#F7F7F7">
											<td>
											<textarea name="order_memo" cols="98" rows="4" readonly>&nbsp;<s:property value="order_resultClass.order_memo"/></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center" height="20">&nbsp;</td>
		</tr>
		<table width="700">
		<tr>
									<td align="right">
									<s:if test="order_resultClass.order_trans_num != null">
									<a onclick="return deleteError()">
									<img src="images/goods/delete.png" style="cursor: pointer;"></img>
									</a>
									</s:if>
									<s:else>
									<input type="image" src="images/goods/delete.png" style="cursor: pointer;"></input>
									</s:else>
									<a href="orderL.action?currentPage=<s:property value="currentPage"/>">
									<img src="images/goods/list.png" style="cursor: pointer;"></img>
									</a>
									</td>
		</tr>
		</table>
	</form>
</body>
</html>