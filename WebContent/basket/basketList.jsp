<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>K O N G</title>
<%-- 
<script language="javascript" type="text/javascript" src="js/index.js">
	
</script>
<script language="javascript" type="text/javascript"
	src="js/jquery-1.6.4.js"></script>
	 --%>
<script>
	function deletecheck() {
		if (confirm("삭제하시겠습니까?")) {
		} else {
			alert("취소되었습니다");
		}
	}
</script>
</head>
<body>

	<div
		style="width: 100%; background-color: #FFF; padding: 0px 20px 20px 20px;">
		<div id="ContentPanel"></div>
		<section class="content-wrapper main-content clear-fix">

		<div class="cgt-latest-wrap clearfix">
			<div
				style="margin: 1px auto; padding-top: 48px; clear: both; max-width: 1200px;">
				<div style="float: left; font-size: 20px; font-weight: bold;">
					<div style="box-sizing: border-box; font-size: 16px;">
						<span style="font-size: 18px; font-weight: normal;">
						<img src="../template/image/order_basket/interestLogo.png">
						</span>
					</div>
				</div>
				<div style="clear: both;"></div>
				<div style="height: 0px; margin-top: 24px;"></div>
			</div>
			<div style="margin: 1px auto; clear: both;">
				<div style="float: right; font-size: 20px; font-weight: bold;">
					<div style="box-sizing: border-box; font-size: 16px;">
						<s:if test="basketList.size() == 0">					
							<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/sclist.action'"
								class="btn btn-sm btn-default">
						</s:if>
						<s:else>
							<input type="button" name="orderB" value="전체 신청"
								onClick="location.href='/order/order_checkB.action'"
								class="btn btn-sm btn-success">
							<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/sclist.action'"
								class="btn btn-sm btn-default">
						</s:else>
					</div>
				</div>
				<div style="clear: both;"></div>
				<div style="height: 0px; margin-top: 24px;"></div>
			</div>
			<div class="clearfix"></div>

			<s:iterator value="basketList" status="stat">
				<s:url id="viewURL" action="scread">
					<s:param name="showboard_num">
						<s:property value="showboard_num" />
					</s:param>
				</s:url>
				<div class="cgt-latest cgt-list-ctype-1">
					<div class="cgt_latest_image_area">
						<a
							href="/showcase/scread.action?showboard_category=<s:property value="showboard_category" />&showboard_num=<s:property value="showboard_num" />">
							<img
							src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
							width="100px" height="150px"
							onerror="javascript:this.src='/template/image/main/noimg.png'"></>
						</a>
					</div>
					<!-- img -->
					<div class="cgt_list_mask" style="width: 284px; height: 295px;"></div>

					<!-- over layer -->
					<div class="cgt_list_explanation">
						<!-- title -->
						<div class="subject">
							<a
								href="/showcase/scread.action?showboard_category=<s:property value="showboard_category" />&showboard_num=<s:property value="showboard_num" />">
								<s:property value="subject" />
							</a>
						</div>

						<!-- date -->
						<div class="schedule">
							<s:property value="date" />
						</div>


						<div class="place_price">
							<div class="place">
								<s:property value="address2" />
							</div>
							<div
								style="width: 30px; height: 2px; background-color: #F470C9; margin: 20px 0px 10px 0px;"></div>
							<!-- <div class="price">무료</div> -->
							<div class="price">
								<s:if test="pay == 0">무료</s:if>
								<s:else>
									<s:property value="pay" />원</s:else>
							</div>
						</div>

					</div>
					<!-- contents-->
					<!-- social -->
					<div class="cgt_list_count clearfix"
						style="font-size: 12px; color: #666;">
						<div style="float: left;">
							<input type="button" name="order" value="신청"
								onClick="location.href='/order/order_check.action?showboard_num=<s:property value="showboard_num" />'"
								class="btn btn-xs btn-success"> <input type="button"
								name="deleteB" value="취소"
								onClick="location.href='/basket/deleteBasket.action?basket_num=<s:property value="basket_num"/>'"
								class="btn btn-xs btn-default">
						</div>
						<div>
							<div>
								<img src="/template/image/main/icon_apply.jpg"
									class="application_icon">
								<s:property value="ordercount" />
							</div>
							<!-- applie -->
							<div style="margin-right: 10px;">
								<img src="/template/image/main/icon_eye.jpg" class="view_icon">
								<s:property value="readcount" />
							</div>
							<!-- views -->
						</div>
					</div>
				</div>
			</s:iterator>

			<div style="margin: 1px auto; clear: both; max-width: 1200px; text-align:center;">
				<div style="font-size: 20px; font-weight: bold;">
					<div style="box-sizing: border-box; font-size: 16px;">
						<td colspan="7" align="center"><s:property value="pagingHtml" escape="false"/></td>
					</div>
				</div>
				<div style="clear: both;"></div>
				<div style="height: 0px; margin-top: 24px;"></div>
			</div>
		</section>
	</div>

	<%--원래 장바구니
 <div class="container">
	<form name="basketList" method="post">
		<table width="600" align="center" class="table table_condensed table-hover">
			<tr>
				<tr align="center" class="active">
				<td align="center">사진</td>
				<td align="center">전시명</td>
				<td align="center">전시기간</td>
				<td align="center">장소</td>
				<td align="center">취소 </td>
				</tr>

				<s:iterator value="basketList" status="stat">
					<tr>		<!-- img 수정 -->							
						<td width="80" align="center">
						<img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
				width="100px" height="150px" onerror="javascript:this.src='/template/image/main/noimg.png'"></>
						</td>
						<td width="300" align="center">${subject}</td>
						<td width="80"align="center">${date}</td>
						<td width="80"align="center">${address2}</td>
						<td width="80" align="center">
							<input type="button" name="deleteB" value="삭제" 
							onClick="location.href='/basket/deleteBasket.action?basket_num=<s:property value="basket_num"/>'" class="btn btn-xs btn-danger">
						</td>
					</tr> 

				</s:iterator>
					<s:if test="basketList.size() == 0">
						<tr>
							<td colspan="7" align="center"><font size="2">장바구니에
									담긴 상품이 없습니다.</font></td>
						</tr>
						<tr height="40">
							<td align="right" colspan="6">
								<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/sclist.action'" class="btn btn-xs btn-default">
							</td>
						</tr>
					</s:if>
					<s:else>
						<tr height="40">
							<td align="right" colspan="6">
								<input type="button" name="orderB" value="주문하기"
								onClick="location.href='/order/order_checkB.action'" class="btn btn-xs btn-success">
								<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/sclist.action'" class="btn btn-xs btn-default">
							</td>						
						</tr>
					</s:else>
					<tr>
						<td colspan="7" align="center"><s:property value="pagingHtml" escape="false"/></td>
					</tr>
			</table>
		</form>
		</div> --%>
</body>
</html>