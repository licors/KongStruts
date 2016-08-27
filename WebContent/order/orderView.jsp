<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deletecheck() {
		if (confirm("주문을 취소하시겠습니까?")) {
		} else {
			alert("취소되었습니다");
			return false;
		}
	}
	function deleteError(){
		alert("티켓 기간이 만료되어 취소가 불가능 합니다."+"\n"+"고객센터로 연락주세요"+"\n"+"\t1544-1234 (주)KOnG");
	}
	function deleteError2(){
		alert("이미 티켓이 취소 되었습니다."+"\n"+"고객센터로 연락주세요"+"\n"+"\t1544-1234 (주)KOnG");
	}
</script>
</head>
<body>
	<form name="detailForm" method="post" action="orderCancel.action"
		onsubmit="return deletecheck()">
		<table width="700" border="0" cellspacing="0" cellpadding="2"
			align="center">
			<s:hidden name="order_num" value="%{order_resultClass.order_num}" />
			<s:hidden name="barcode"
				value="%{order_resultClass.barcode}" />	<!-- 더 넘겨줘야되나 -->
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
							<td colspan="5" align="center"><strong>신청 티켓</strong></td>
						</tr>
						<tr bgcolor="#FFFFFF" align="center">
							<td width="90">이미지</td>
							<td colspan="2">신청 티켓 상세정보</td>
							<td width="90">신청 상태</td>
						</tr>

						<tr bgcolor="#FFFFFF" align="center">
							<td>
							<a href="readAction.action?showboard_num=${show_resultClass.showboard_num }"> <!-- 수정수정수정 -->
							<img src="showcase/upload/<s:property value="show_resultClass.file_savname.split(',')[0]"/>"
									width="90" />	<!-- 수정수정 -->
							</a>
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="2">
									<tbody>	
										<tr height="25">
											<td width="120" align="left">신청 번호</td>
											<td align="center"><b><s:property value="order_resultClass.order_num" /></b><br></td>
										</tr>		
										<tr height="25">
											<td width="120" align="left">신청 일자</td>
											<td align="center"><b><s:property value="order_resultClass.order_date" /></b></td>
										</tr>										
									</tbody>
								</table>
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr height="23">
										<td width="70" align="left">전시명</td>
										<td width="120" align="center"><b><s:property value="order_resultClass.subject" /></b></td>
									</tr>
									<tr height="23">
										<td width="60" align="left">전시일정</td>
										<td align="center"><b><s:property value="order_resultClass.date" /></b></td>
									</tr>

									<tr height="23">
										<td width="60" align="left">전시장소</td>
										<td align="center"><b><s:property value="order_resultClass.address2" /></b></td>
									</tr>
								</table>
							</td>
							<td>
								<b><s:property value="order_resultClass.state" /></b>
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
								valign="middle"><font size="2"><b>신청인 정보</b></font></td>
							<td bgcolor="#F7F7F7">
								<table width="680" border="0" cellspacing="0" cellpadding="1"
									align="center">
									<tbody>
										<tr>
											<td width="110">&nbsp;I   &nbsp;<font color="#F7F7F7">_</font>   D &nbsp;:
											</td>
											<td>
											<input class="order" type="text" name="email" size="50" maxlength="70"
														value="${order_resultClass.email}" readonly/>
											</td>
										</tr>
										<tr>
											<td width="80">&nbsp;성<font color="#F7F7F7">_</font>명 :
											</td>
											<td>
											<input class="order" type="text" name="name" size="10" maxlength="20"
														value="${order_resultClass.name}" readonly></input>	
											</td>
										</tr>
										<!-- <tr>
											<td>&nbsp;</td>
										</tr> -->
										<tr>
											<td width="80">&nbsp;성<font color="#F7F7F7">_</font>별 :
											</td>
											<td>
											<input class="order" type="text" name="sex" size="10" maxlength="20"
														value="${order_resultClass.sex}" readonly/>
											</td>
										</tr>
										<tr>
											<td width="80">&nbsp;회<font color="#F7F7F7">_</font>사 :
											</td>
											<td>
											<input class="order" type="text" name="company" size="10" maxlength="20"
														value="${order_resultClass.company}" readonly/>	
											</td>
										</tr>
										<%-- <tr>
											<td width="110">&nbsp;우편번호 :</td>
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
											<td width="110">&nbsp;주<font color="#F7F7F7">_</font>소 :
											</td>
											<td>
											<input class="order" type="text" name="address" size="60" maxlength="100"
														value="${order_resultClass.address}" readonly/>
											</td>
										</tr>
										<tr>
											<td width="110"></td>
											<td></td>
										</tr>
										<tr>
											<td width="110">&nbsp;전화번호 :</td>
											<td>
											<input class="order" type="text" name="tel" size="15" maxlength="15"
														value="${order_resultClass.tel}" readonly/>
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
			<table border="0" width="700" cellpadding="7" cellspacing="2"
					bordercolordark="white" bordercolorlight="#626262" align="center"
					bgcolor="#E1E1E1">
					<tbody>
						<tr valign="top">
							<td bgcolor="#EFEFEF" height="20" align="center" width="150"
								valign="middle"><font size="2"><b>전시 입장 바코드</b></font></td>
							<td bgcolor="#F7F7F7">
								<table width="680" border="0" cellspacing="0" cellpadding="1"
									align="center">
									<tbody>
										<tr bgcolor="#F7F7F7">
											<td align="center">
											<img src="C:\\java\\YJ\\kong\\WebContent\\order\\barcode_images\\<s:property value="order_resultClass.barcode"/>"
									width="90" />
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
					<s:if test="order_resultClass.status == '티켓 만료'">
						<input type="button" name="cancelTicket" value="티켓취소" onClick="javascript:deleteError()">
					</s:if>
					<s:elseif test="order_resultClass.status =='티켓 취소'">
						<input type="button" name="cancelTicket" value="티켓취소" onClick="javascript:deleteError2()">
					</s:elseif>
					<s:else>
						<input type="submit" name="cancelTicket" value="티켓취소">
					</s:else> 
					
					<!-- 리스트로 -->
					<input type="button" name="list" value="목록으로" onClick="location.href='orderList.action?currentPage=<s:property value="currentPage"/>'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>