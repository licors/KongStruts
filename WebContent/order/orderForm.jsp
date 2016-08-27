<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function begin() {
		document.orderForm.name.focus();
	}       
	function checkIt() {
		var orderForm = eval("document.orderForm");

		if (!orderForm.name.value) {
			alert("신청인 이름을 입력하세요");
			document.orderForm.name.focus();
			return false;
		}
		if (!orderForm.tel.value) {
			alert("신청인 핸드폰번호를 입력하세요");
			document.orderForm.tel.focus();
			return false;
		}
 
		document.orderForm.action = "orderInsert.action"
		document.orderForm.submit();
	}
</script> 
</head>
<body onload="begin()">
<!-- 장바구니에서 넘어왔을때 -->

<!-- 상세보기에서 넘어왔을때 -->

<!-- 메인화면에서 넘어왔을때 -->
	<form name="orderForm" method="post" enctype="multipart/form-data" onsubmit="return checkIt();">	<!-- 수정! memresultClass=MemberVO, goods_resultClass= --> 
		<s:hidden name="member_num" value="%{memresultClass.getMember_num()}"/>
		<s:hidden name="showboard_num" value="%{goods_resultClass.showboard_num}"/>	<!-- 클래스명 수정하기 -->
		<s:hidden name="subject" value="%{good_resultClass.subject}"/>
		<s:hidden name="pay" value="%{goods_resultClass.address1}"/>
		<%-- <s:hidden name="order_num" value="기존것 + 1"> --%>
		
		<table width="700" border="0" cellspacing="0" cellpadding="2" align="center">
			<tbody>
				<tr>
					<td width="15">◎</td>
					<td><b><font size="2">신청인정보와 결제방식을 입력해주세요.</font></b></td>
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
					<td colspan="5" align="center"><strong>신청 티켓</strong></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<td width="90">전시</td>
					<td>전시회 종류</td>
					<td width="200">전시 기타사항</td>
					<td width="60">주문/취소</td>
				</tr>

				<tr bgcolor="#FFFFFF" align="center">
					<td><img
						src="goods/upload/<s:property value="goods_resultClass.file_savname.split(',')[0]"/>"
						width="90" /></td>
					<!-- 수정! 이미지 url수정 -->
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="2">
							<tbody>
								<tr>
									<td width="80" align="left">전시번호 :</td>
									<td align="center"><b><s:property
												value="%{getshowboard_num()}" /></b><br></td>
								</tr>
								<tr>
									<td width="80" align="left">전시명 :</td>
									<td align="center"><b><s:property
												value="goods_resultClass.subject" /></b></td>
								</tr>
								<tr>
									<td width="80" align="left">전시장소 :</td>
									<td align="center"><b> <s:property
												value="goods_resultClass.address2" /></b></td>	<!-- 수정: 건물명 뽑기 goods_resultClass.address2.split(',')[0]-->
								</tr>
								<tr>
									<td width="80" align="left">전시날짜 :</td>
									<td align="center"><b> <s:property
												value="goods_resultClass.date" />
									</b></td>
								</tr>								
							</tbody>
						</table>
					</td>
					<td>
						기타
					</td>
					<td>
						<%-- <s:if test="%{status == 0}">
						</s:if>
						<s:else>
						</s:else> status에 따라 주문취소 구현--%>
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
								valign="middle"><font size="2"><b>신청인 정보</b></font></td>
							<td bgcolor="#F7F7F7">
								<table width="600" border="0" cellspacing="0" cellpadding="1"
									align="center">
									<tbody>
										<tr>
											<td width="110">&nbsp;I   &nbsp;<font color="#F7F7F7">_</font>   D &nbsp;:
											</td>
											<td>
											<input class="order" type="text" name="email" size="50" maxlength="70"
														value="${memresultClass.email}" readonly/>
											</td>
										</tr>
										<tr>
											<td width="80">&nbsp;성<font color="#F7F7F7">_</font>명 :
											</td>
											<td>
											<input class="order" type="text" name="name" size="10" maxlength="20"
											value="${memresultClass.name }"></input>	
											</td>
										</tr>
										<!-- <tr>
											<td>&nbsp;</td>
										</tr> -->
										<tr>
											<td width="80">&nbsp;성<font color="#F7F7F7">_</font>별 :
											</td>
											<td>
											<input class="order" type="radio" name="sex" value="남성"/> 남성
											<input class="order" type="radio" name="sex" value="여성"/> 여성
											</td>
										</tr>
										<tr>
											<td width="80">&nbsp;회<font color="#F7F7F7">_</font>사 :
											</td>
											<td>
											<input class="order" type="text" name="company" size="10" maxlength="20"
														value="${memresultClass.company}"/>	
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
														value="${memresultClass.address}"/>
											</td>
										</tr>
										<tr>
											<td width="110"></td>
											<td></td>
										</tr>
										<tr>
											<td width="110">&nbsp;전화번호 :</td>
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
		<!-- 개인정보활용동의로 -->
		<tr>
			<td align="center">
				<table width="700" border="0" cellspacing="0" cellpadding="2"
					align="center">
					<tbody>
						<tr>
							<td width="30" colspan="2">
								<textarea name="agreecheck" cols="100" rows="10">행사 및 서비스를 예약 및 구매하고자 할 경우, 원활한 서비스 제공을 위해 필요한 최소한의 개인정보만을 관련 기업에게 아래와 같이 공유하고 있습니다.

귀하께서 행사 및 서비스의 주최기업(판매자)로부터 상품 및 입장권 및 서비스를 예약하거나 구매하고자 할 경우, 원활한 서비스 제공을 위해서 필요한 최소한의 개인정보만을, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2 (개인정보 제공 동의 등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. “개인정보공유 동의”를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다. 이용목적이 달성되고 보유기간이 종료된 이후에는 고객의 개인정보를 지체없이 파기합니다.

“개인정보 공유 동의”를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.

동의 거부 시 불이익 :
본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 행사의 참여나 상품구매가 제한될 수있습니다. 회원 가입 시 동의하신 바 있는 개인정보 제3자 제공 및 개인정보 취급 위탁에 대한 동의를 철회하고자 하는경우에는 고객센터로 연락 주시기 바랍니다.
								</textarea>
							</td>
						</tr>
						<tr>
							<td width="30" colspan="2">▶ <b><font color="black"
									size="2">개인정보제3자 제공동의</font> </b> &nbsp;<input
								type="radio" name="same" value="y">
								예 
								<input type="radio" name="same" value="n" checked=""> 아니오
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<!-- <tr height="50">
			<td colspan="2" bgcolor="white" align="center"><a
								href="javascript:checkIt()">
								주문하기
								</a>&nbsp;&nbsp; <a
								href="javascript:history.go(-1)">
								주문취소
								</a></td>
		</tr> -->
		<tr height="50">
			<td colspan="2" bgcolor="white" align="center">
				<input type="submit" name="submit" value="신청하기">
				&nbsp;&nbsp;
				<input type="button" name="back" value="돌아가기" onClick="javascript:history.go(-1)"/>
			</td>
		</tr>
	</tbody>
</table>
</td>
</tr>									
</form>
</body>
</html>