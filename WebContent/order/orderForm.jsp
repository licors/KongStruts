<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script language="javascript">
	function checkIt() {
		var orderForm = evar("document.orderForm");
		
		if(!orderForm.name.value) {
			alert("��û�� �̸��� �Է��ϼ���");
			document.orderForm.name.focus();
			return;
		}
		else if(!orderForm.tel.value) {
			alert("��û�� ��ȭ��ȣ�� �Է��ϼ���");
			document.orderForm.tel.focus();
			return;
		}

		return true;
	}
</script> 
</head>
<body>
<!-- ��ٱ��Ͽ��� �Ѿ������ -->

<!-- �󼼺��⿡�� �Ѿ������ -->

<!-- ����ȭ�鿡�� �Ѿ������ -->
	<form action="orderForm.action" name="orderForm" method="post" enctype="multipart/form-data" onsubmit="return checkIt();">	<!-- ����! memresultClass=MemberVO, goods_resultClass= --> 
		<s:hidden name="member_num" value="%{memresultClass.getMember_num()}"/>
		<s:hidden name="showboard_num" value="%{goods_resultClass.showboard_num}"/>	<!-- Ŭ������ �����ϱ� -->
		<s:hidden name="subject" value="%{good_resultClass.subject}"/>
		<s:hidden name="pay" value="%{goods_resultClass.address1}"/>
		<%-- <s:hidden name="order_num" value="������ + 1"> --%>
		
		<table width="700" border="0" cellspacing="0" cellpadding="2" align="center">
			<tbody>
				<tr>
					<td width="15">��</td>
					<td><b><font size="2">��û�������� ��������� �Է����ּ���.</font></b></td>
				</tr>
			</tbody>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>

		<table width="700" border="0" cellspacing="1" cellpadding="5"
			align="center" bgcolor="#CCCCCC">

			<tbody>
				<tr height=30 bgcolor="#F0F0F0">
					<td colspan="5" align="center"><strong>��û Ƽ��</strong></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<td width="90">����</td>
					<td>����ȸ ����</td>
					<td width="200">���� ��Ÿ����</td>
					<td width="60">�ֹ�/���</td>
				</tr>

				<tr bgcolor="#FFFFFF" align="center">
					<td><img
						src="goods/upload/<s:property value="goods_resultClass.file_savname.split(',')[0]"/>"
						width="90" /></td>
					<!-- ����! �̹��� url���� -->
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="2">
							<tbody>
								<tr>
									<td width="80" align="left">���ù�ȣ :</td>
									<td align="center"><b><s:property
												value="%{getshowboard_num()}" /></b><br></td>
								</tr>
								<tr>
									<td width="80" align="left">���ø� :</td>
									<td align="center"><b><s:property
												value="goods_resultClass.subject" /></b></td>
								</tr>
								<tr>
									<td width="80" align="left">������� :</td>
									<td align="center"><b> <s:property
												value="goods_resultClass.address2" /></b></td>	<!-- ����: �ǹ��� �̱� goods_resultClass.address2.split(',')[0]-->
								</tr>
								<tr>
									<td width="80" align="left">���ó�¥ :</td>
									<td align="center"><b> <s:property
												value="goods_resultClass.date" />
									</b></td>
								</tr>								
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<table border="0" width="700" cellpadding="7" cellspacing="2"
					bordercolordark="white" bordercolorlight="#626262" align="center"
					bgcolor="#E1E1E1">
					<tbody>
						<tr valign="top">
							<td bgcolor="#EFEFEF" height="20" align="center" width="150"
								valign="middle"><font size="2"><b>��û�� ����</b></font></td>
							<td bgcolor="#F7F7F7">
								<table width="600" border="0" cellspacing="0" cellpadding="1"
									align="center">
									<tbody>
										<tr>
											<td width="110">&nbsp;I   <font color="#F7F7F7">_</font>   D :
											</td>
											<td>
											<input class="order" type="text" name="email" size="50" maxlength="70"
														value="${memresultClass.email}" readonly/>
											</td>
										</tr>
										<tr>
											<td width="80">&nbsp;��<font color="#F7F7F7">_</font>�� :
											</td>
											<td>
											<input class="order" type="text" name="name" size="10" maxlength="20"
											value="${memresultClass.name }" readonly></input>	
											</td>
										</tr>
										<!-- <tr>
											<td>&nbsp;</td>
										</tr> -->
										<tr>
											<td width="80">&nbsp;��<font color="#F7F7F7">_</font>�� :
											</td>
											<td>
											<input class="order" type="radio" name="sex" value="����"/> ����
											<input class="order" type="radio" name="sex" value="����"/> ����
											</td>
										</tr>
										<tr>
											<td width="80">&nbsp;ȸ<font color="#F7F7F7">_</font>�� :
											</td>
											<td>
											<input class="order" type="text" name="company" size="10" maxlength="20"
														value="${memresultClass.company}"/>	
											</td>
										</tr>
										<%-- <tr>
											<td width="110">&nbsp;�����ȣ :</td>
											<td>
												<table width="210" border="0" cellspacing="0"
													cellpadding="0">
													<tbody>
														<tr>
															<td width="34">
															<input class="order" type="text" name="order_zipcode" size="7" maxlength="7"
															value="${memresultClass.zipcode}" readonly></input>
															</td>	
															<td width="100"></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr> --%>
										<tr>
											<td width="110">&nbsp;��<font color="#F7F7F7">_</font>�� :
											</td>
											<td>
											<input class="order" type="text" name="address" size="60" maxlength="100"
														value="${memresultClass.address}"/>
											</td>
										</tr>
										<tr>
											<td width="110"></td>
											<td></td>
										</tr>
										<tr>
											<td width="110">&nbsp;��ȭ��ȣ :</td>
											<td>
											<input class="order" type="text" name="tel" size="15" maxlength="15"/>
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
			<td align="center">&nbsp;</td>
		</tr>
		<tr>
			<td align="center">
				<table border="0" width="700" cellpadding="7" cellspacing="2"
					bordercolordark="white" bordercolorlight="#626262" align="center"
					bgcolor="#E1E1E1">
		<tbody>	
		<!-- ��������Ȱ�뵿�Ƿ� -->
		<tr>
			<td align="center">
				<table width="700" border="0" cellspacing="0" cellpadding="2"
					align="center">
					<tbody>
						<tr>
							<td width="30" colspan="2">
								<textarea name="agreecheck" cols="100" rows="10">��� �� ���񽺸� ���� �� �����ϰ��� �� ���, ��Ȱ�� ���� ������ ���� �ʿ��� �ּ����� ������������ ���� ������� �Ʒ��� ���� �����ϰ� �ֽ��ϴ�.

���ϲ��� ��� �� ������ ���ֱ��(�Ǹ���)�κ��� ��ǰ �� ����� �� ���񽺸� �����ϰų� �����ϰ��� �� ���, ��Ȱ�� ���� ������ ���ؼ� �ʿ��� �ּ����� ������������, ������Ÿ� �̿����� �� ������ȣ � ���� ���� �� 24���� 2 (�������� ���� ���� ��)�� ���� �Ʒ��� ���� ������ �ȳ��ϰ� ���Ǹ� �޾� ������ ���������� �Ǹ��ڿ��� �����մϴ�. �������������� ���ǡ��� üũ�Ͻø� �������� ������ ���� ������ ������ �����մϴ�. �̿������ �޼��ǰ� �����Ⱓ�� ����� ���Ŀ��� ���� ���������� ��ü���� �ı��մϴ�.

���������� ���� ���ǡ��� üũ�Ͻø� �������� ������ ���� ������ ������ �����մϴ�.

���� �ź� �� ������ :
�� �������� ������ �������� �����ô� ���, ���Ǹ� �ź��� �� ������, �� ��� ����� ������ ��ǰ���Ű� ���ѵ� ���ֽ��ϴ�. ȸ�� ���� �� �����Ͻ� �� �ִ� �������� ��3�� ���� �� �������� ��� ��Ź�� ���� ���Ǹ� öȸ�ϰ��� �ϴ°�쿡�� �����ͷ� ���� �ֽñ� �ٶ��ϴ�.
								</textarea>
							</td>
						</tr>
						<tr>
							<td width="30" colspan="2">�� <b><font color="black"
									size="2">����������3�� ��������</font> </b> &nbsp;<input
								type="radio" name="same" value="y" onclick="senddata()">
								�� <input type="radio" name="same" value="n" checked=""
								onclick="deldata()"> �ƴϿ�
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<!-- <tr height="50">
			<td colspan="2" bgcolor="white" align="center"><a
								href="javascript:checkIt()">
								�ֹ��ϱ�
								</a>&nbsp;&nbsp; <a
								href="javascript:history.go(-1)">
								�ֹ����
								</a></td>
		</tr> -->
		<tr height="50">
			<td colspan="2" bgcolor="white" align="center">
				<input type="submit" name="submit" value="��û�ϱ�">
				&nbsp;&nbsp;
				</input>
				<input type="button" name="back" value="���ư���" onClick="javascript:history.go(-1)"/>
		</tr>
		
		
	</tbody>
</table>
</td>
</tr>									
</form>
</body>
</html>