<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function doImgPop(img) {
		img1 = new Image();
		img1.src = (img);
		imgControll(img);
	}

	function imgControll(img) {
		if ((img1.width != 0) && (img1.height != 0)) {
			viewImage(img);
		} else {
			controller = "imgControll('" + img + "')";
			intervalID = setTimeout(controller, 20);
		}
	}
	function viewImage(img) {
		W = img1.width;
		H = img1.height;
		O = "width=" + W + ",height=" + H + ",scrollbars=yes";
		imgWin = window.open("", "", O);
		imgWin.document.write("<html><head><title>티켓 상세보기</title></head>");
		imgWin.document.write("<body topmargin=0 leftmargin=0>");
		imgWin.document
				.write("<img src="
						+ img
						+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		imgWin.document.close();
	}
	function deletecheck() {
		if (confirm("신청을 취소하시겠습니까?")) {
		} else {
			alert("취소되었습니다");
			return false;
		}
	}
	function deleteError() {
		alert("티켓 기간이 만료되어 취소가 불가능 합니다." + "\n" + "고객센터로 연락주세요" + "\n"
				+ "\t1544-1234 (주)KOnG");
	}
	function deleteError2() {
		alert("이미 티켓이 취소 되었습니다." + "\n" + "고객센터로 연락주세요" + "\n"
				+ "\t1544-1234 (주)KOnG");
	}
</script>
<style type="text/css">
.container { /*컨테이너를 덮어서 고정 폭 사용*/
	width: 600px;
	max-width: none !important;
}
</style>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<!-- 위쪽 제목 -->
			<div class="panel-heading">티켓 신청 상세보기</div>
			<div class="panel-body">
				<!-- 본문 -->
				<form name="detailForm" method="post"
					action="/order/orderCancel.action" onsubmit="return deletecheck()"
					class="form-control-static">
					<s:hidden name="order_num" value="%{order_resultClass.order_num}" />
					<s:hidden name="barcode" value="%{order_resultClass.barcode}" />

					<table width="500" align="center" class="table-condensed">
						<tr>
							<td><a
								href="/showcase/scread.action?showboard_category=${show_resultClass.showboard_category}&showboard_num=${show_resultClass.showboard_num }">
									<img
									src="../showcaseImg/<s:property value="show_resultClass.file_savname.split(',')[0]"/>"
									width="100px"
									onerror="javascript:this.src='/template/image/main/noimg.png'"></>
							</a></td>
							<td>
								<h3>
									<s:property value="order_resultClass.subject" />
									<br> <small> <s:property
											value="order_resultClass.address2" /><br> <s:property
											value="order_resultClass.date" />
									</small>
								</h3>
							</td>
						</tr>

						<tr>
							<td align="right" colspan="3"><font color="#FF0000"><b>*
										<s:property value="order_resultClass.status" /> 완료
								</b></font><br> <s:property value="order_resultClass.order_date" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="100"><label for="email">ID(E-MAIL)</label></td>
							<td><input class="form-control" type="text" name="email"
								maxlength="70" value="${order_resultClass.email}" readonly /></td>
						</tr>
						<tr>
							<td width="100"><label for="name">성명</label></td>
							<td><input class="form-control" type="text" name="name"
								maxlength="20" value="${order_resultClass.name}" readonly></td>
						</tr>
						<tr>

							<td width="100"><label for="sex">성별</label></td>
							<td><input class="form-control" type="text" name="name"
								maxlength="20" value="${order_resultClass.sex}" readonly></td>
						</tr>
						<tr>
							<td width="100"><label for="company">회사</label></td>
							<td><input class="form-control" type="text" name="company"
								maxlength="20" value="${memresultClass.company}" readonly /></td>
						</tr>
						<tr>
							<td width="100"><label for="address">주소</label></td>
							<td><input class="form-control" type="text" name="address"
								maxlength="100" value="${order_resultClass.address}" readonly /></td>
						</tr>
						<tr>
							<td width="100"><label for="tel">전화번호</label></td>
							<td><input class="form-control" type="text" name="tel"
								maxlength="15" value="${order_resultClass.tel}" readonly /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="100"><label for="tel">티켓(바코드)</label></td>
							<td align="center" colspan="2"><s:if
									test='%{order_resultClass.status  =="티켓 신청"}'>
									<img
										src="../barcodeImg/<s:property value="order_resultClass.barcode"/>.png"
										style="cursor: pointer;"
										onclick="doImgPop('../barcodeImg/<s:property value="order_resultClass.barcode"/>.png')"
										width="100%" />
								</s:if> <br>
							<small>* 티켓을 취소 하시면 바코드는 즉시 폐기 됩니다.</small></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="center" colspan="5"><s:if
									test='%{order_resultClass.status == "티켓 만료"}'>
									<input type="button" name="cancelTicket" value="티켓취소"
										onClick="javascript:deleteError()"
										class="btn btn-success btn-sm">
								</s:if> <s:elseif test='%{order_resultClass.status =="티켓 취소"}'>
									<input type="button" name="cancelTicket" value="티켓취소"
										onClick="javascript:deleteError2()"
										class="btn btn-success btn-sm">
								</s:elseif> <s:else>
									<input type="submit" name="cancelTicket" value="티켓취소"
										class="btn btn-success btn-sm">
								</s:else> <!-- 리스트로 --> <s:if test='%{memresultClass.member_num == 1}'>
									<input type="button" name="list" value="목록으로"
										onClick="location.href='/order/adminOrderList.action?currentPage=<s:property value="%{currentPage}"/>'"
										class="btn btn-default btn-sm">
								</s:if> <s:else>
									<input type="button" name="list" value="목록으로"
										onClick="location.href='/order/orderList.action?currentPage=<s:property value="%{currentPage}"/>'"
										class="btn btn-default btn-sm">

								</s:else></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<%-- 


	<div style="width: 800px" class="container">
		<form name="detailForm" method="post"
			action="/order/orderCancel.action" onsubmit="return deletecheck()">
			<table width="700" border="0" cellspacing="0" cellpadding="2"
				align="center">
				<s:hidden name="order_num" value="%{order_resultClass.order_num}" />
				<s:hidden name="barcode" value="%{order_resultClass.barcode}" />
				<!-- 더 넘겨줘야되나 -->
				<tbody>
				</tbody>
			</table>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>

					<table width="700" border="0" cellspacing="1" cellpadding="5"
						align="center" bgcolor="#CCCCCC" class="table table-bordered">

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
								<td><a
									href="/showcase/scread.action?showboard_category=${show_resultClass.showboard_category}&showboard_num=${show_resultClass.showboard_num }">
										<img
										src="../showcaseImg/<s:property value="show_resultClass.file_savname.split(',')[0]"/>"
										width="100px"
										onerror="javascript:this.src='/template/image/main/noimg.png'"></>
								</a></td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="2">
										<tbody>
											<tr height="25">
												<td width="120" align="left">신청 번호</td>
												<td align="center"><b><s:property
															value="order_resultClass.order_num" /></b><br></td>
											</tr>
											<tr height="25">
												<td width="120" align="left">신청 일자</td>
												<td align="center"><b><s:property
															value="order_resultClass.order_date" /></b></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr height="23">
											<td width="70" align="left">전시명</td>
											<td width="120" align="center"><b><s:property
														value="order_resultClass.subject" /></b></td>
										</tr>
										<tr height="23">
											<td width="60" align="left">전시일정</td>
											<td align="center"><b><s:property
														value="order_resultClass.date" /></b></td>
										</tr>

										<tr height="23">
											<td width="60" align="left">전시장소</td>
											<td align="center"><b><s:property
														value="order_resultClass.address2" /></b></td>
										</tr>
									</table>
								</td>
								<td><b><s:property value="order_resultClass.status" /></b>
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
					<table width="700" border="0" cellspacing="1" cellpadding="5"
						align="center" bgcolor="#CCCCCC" class="table table-bordered">
						<tbody>
							<tr bgcolor="#F0F0F0">
								<td colspan="5" align="center"><strong>신청자 정보</strong></td>
							</tr>
							<tr valign="top" bgcolor="#FFFFFF">
								<td>
									<table width="680" border="0" cellspacing="0" cellpadding="1"
										align="center">
										<tbody>
											<tr>
												<td width="110">&nbsp;I &nbsp;<font color="#F7F7F7">_</font>
													D &nbsp;:
												</td>
												<td><input class="order" type="text" name="email"
													size="50" maxlength="70" value="${order_resultClass.email}"
													readonly /></td>
											</tr>
											<tr>
												<td width="80">&nbsp;성<font color="#F7F7F7">_</font>명 :
												</td>
												<td><input class="order" type="text" name="name"
													size="10" maxlength="20" value="${order_resultClass.name}"
													readonly></input></td>
											</tr>
											<!-- <tr>
											<td>&nbsp;</td>
										</tr> -->
											<tr>
												<td width="80">&nbsp;성<font color="#F7F7F7">_</font>별 :
												</td>
												<td><input class="order" type="text" name="sex"
													size="10" maxlength="20" value="${order_resultClass.sex}"
													readonly /></td>
											</tr>
											<tr>
												<td width="80">&nbsp;회<font color="#F7F7F7">_</font>사 :
												</td>
												<td><input class="order" type="text" name="company"
													size="10" maxlength="20"
													value="${order_resultClass.company}" readonly /></td>
											</tr>
											<tr>
												<td width="110">&nbsp;주<font color="#F7F7F7">_</font>소
													:
												</td>
												<td><input class="order" type="text" name="address"
													size="60" maxlength="100"
													value="${order_resultClass.address}" readonly /></td>
											</tr>
											<tr>
												<td width="110"></td>
												<td></td>
											</tr>
											<tr>
												<td width="110">&nbsp;전화번호 :</td>
												<td><input class="order" type="text" name="tel"
													size="15" maxlength="15" value="${order_resultClass.tel}"
													readonly /></td>
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
			<table width="700" border="0" cellspacing="1" cellpadding="5"
				align="center" bgcolor="#CCCCCC" class="table table-bordered">
				<tbody>
					<tr bgcolor="#F0F0F0">
						<td colspan="5" align="center"><strong>전시회 입장 바코드</strong></td>
					</tr>
					<tr valign="middle">
						<td bgcolor="#F7F7F7" align="center" valign="middle">
							<s:if test='<s:property value="order_resultClass.status" /> == "티켓 신청"'>
							<s:if test='%{order_resultClass.status  =="티켓 신청"}'>
								<table width="680" border="0" cellspacing="0" cellpadding="1"
									align="center">
									<tbody>
										<tr>
											<td align="center"><img
												src="../barcodeImg/<s:property value="order_resultClass.barcode"/>.png"
												width="70%" /></td>
										</tr>
									</tbody>
								</table>
							</s:if> <br>티켓을 취소 하시면 바코드는 즉시 폐기 됩니다.
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
				bgcolor="#FFFFFF">
				<tr>
					<td align="center" colspan="5"><s:if
							test='%{order_resultClass.status == "티켓 만료"}'>
							<input type="button" name="cancelTicket" value="티켓취소"
								onClick="javascript:deleteError()"
								class="btn btn-success btn-sm">
						</s:if> <s:elseif test='%{order_resultClass.status =="티켓 취소"}'>
							<input type="button" name="cancelTicket" value="티켓취소"
								onClick="javascript:deleteError2()"
								class="btn btn-success btn-sm">
						</s:elseif> <s:else>
							<input type="submit" name="cancelTicket" value="티켓취소"
								class="btn btn-success btn-sm">
						</s:else> <!-- 리스트로 --> <s:if test='%{memresultClass.member_num == 1}'>
							<input type="button" name="list" value="목록으로"
								onClick="location.href='/order/adminOrderList.action?currentPage=<s:property value="%{currentPage}"/>'"
								class="btn btn-default btn-sm">
						</s:if> <s:else>
							<input type="button" name="list" value="목록으로"
								onClick="location.href='/order/orderList.action?currentPage=<s:property value="%{currentPage}"/>'"
								class="btn btn-default btn-sm">

						</s:else></td>
				</tr>
			</table>
		</form>
	</div> --%>
</body>
</html>