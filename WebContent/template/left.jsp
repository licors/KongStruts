<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.HashMap"%>

<%-- <script type="text/javascript">

</script>

<section style="padding: 0px 0px 0px 0px;">

	<div class="cgt-banner-container slick-initialized slick-slider"
		style="margin-top: 10px; margin-bottom: 40px; padding-bottom: 20px;"
		role="toolbar">
		<button type="button" data-role="none" class="slick-prev slick-arrow"
			aria-label="Previous" role="button" style="display: block;">Previous</button>
		<div aria-live="polite" class="slick-list draggable"
			style="padding: 0px 50px;">
			<div class="slick-track" role="listbox"
				style="opacity: 1; width: 55000px; transform: translate3d(-2329px, 0px, 0px); transition: transform 1000ms ease;">
				
				
				<s:iterator value="list1" status="stat">
				<s:url id="viewURL" action="scread">
			<s:param name="showboard_num">
				<s:property value="showboard_num" />
			</s:param>
			</s:url>
				
				<div class="cgt-banner slick-slide slick-cloned"
					data-slick-index="-2" aria-hidden="true" tabindex="-1">
					<div class="mask"></div>
					<div style="position: absolute; width: 100%;">
						<div class="ribbon">
							<img src="/content/img/ctype-1-ribbon.png" alt="리본" style="">
						</div>
					</div>
					<!-- <img src="https://www.cangoto.kr/Resource/Ticket/TI(147).jpg" -->
					<img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
						alt="행사이미지" style="height: 281px; width: 480px; max-width: 600px;"
						class="cgt-slide-img"> <a id=""
						href="/Event/1/3575/2016-서울기프트쇼"
						class="ctype-1 btn-detail cgt-single-load" tabindex="-1"> <img
						src="/content/img/view_big_btn.png" alt="상세보기">
					</a> <a id="" href="#"
						onclick="MoveAppDownLoadConfirm('유료 행사는 캔고루앱에서 신청 및 구매 하실 수 있습니다. 캔고루 앱을 받아보시겠습니까?'); return false;"
						class="ctype-1 btn-application" tabindex="-1"> <img
						src="/content/img/application_big_btn.png" alt="신청하기">
					</a>
				</div>
				
				</s:iterator>


<!-- 				<div class="cgt-banner slick-slide" data-slick-index="6"
					aria-hidden="true" tabindex="-1" role="option"
					aria-describedby="slick-slide06">
					<div class="mask" style="width: 480px; height: 281px; opacity: 0;"></div>
					<div style="position: absolute; width: 100%;">
						<div class="ribbon">
							<img src="/content/img/ctype-1-ribbon.png" alt="리본" style="">
						</div>
					</div>
					<img src="https://www.cangoto.kr/Resource/Banner/bbbbbbbb.jpg"
						alt="행사이미지" style="height: 281px; width: 480px; max-width: 600px;"
						class="cgt-slide-img"> <a id="link"
						href="/Event/1/3573/호텔페어"
						class="ctype-1 btn-detail cgt-single-load" tabindex="-1"
						style="left: 0px; opacity: 0;"> <img
						src="/content/img/view_big_btn.png" alt="상세보기">
					</a> <a id="link" href="#"
						onclick="return fnConfirmMoveUrl('로그인을 하셔야 이용하실수 있습니다.\n로그인 페이지로 이동하시겠습니까?' , '/Account/Login' );"
						class="ctype-1 btn-application" tabindex="-1"
						style="right: 0px; opacity: 0;"> <img
						src="/content/img/application_big_btn.png" alt="신청하기">
					</a>
				</div>
				
				
				<div class="cgt-banner slick-slide" data-slick-index="7"
					aria-hidden="true" tabindex="-1" role="option"
					aria-describedby="slick-slide07">
					<div class="mask" style="width: 480px; height: 281px; opacity: 0;"></div>
					<div style="position: absolute; width: 100%;">
						<div class="ribbon">
							<img src="/content/img/ctype-1-ribbon.png" alt="리본" style="">
						</div>
					</div>
					<img src="https://www.cangoto.kr/Resource/Ticket/ti(191).jpg"
						alt="행사이미지" style="height: 281px; width: 480px; max-width: 600px;"
						class="cgt-slide-img"> <a id="link"
						href="/Event/1/3867/LMFKorea-엘엠에프-코리아"
						class="ctype-1 btn-detail cgt-single-load" tabindex="-1"
						style="left: 0px; opacity: 0;"> <img
						src="/content/img/view_big_btn.png" alt="상세보기">
					</a> <a id="link" href="#"
						onclick="return fnConfirmMoveUrl('로그인을 하셔야 이용하실수 있습니다.\n로그인 페이지로 이동하시겠습니까?' , '/Account/Login' );"
						class="ctype-1 btn-application" tabindex="-1"
						style="right: 0px; opacity: 0;"> <img
						src="/content/img/application_big_btn.png" alt="신청하기">
					</a>
				</div>


				<div class="cgt-banner slick-slide" data-slick-index="10"
					aria-hidden="true" tabindex="-1" role="option"
					aria-describedby="slick-slide010">
					<div class="mask"></div>
					<div style="position: absolute; width: 100%;">
						<div class="ribbon">
							<img src="/content/img/ctype-1-ribbon.png" alt="리본" style="">
						</div>
					</div>
					<img src="https://www.cangoto.kr/Resource/Banner/rol(8).jpg"
						alt="행사이미지" style="height: 281px; width: 480px; max-width: 600px;"
						class="cgt-slide-img"> <a id="link"
						href="/Event/1/3832/2016-대구경향하우징페어-KOREA-BUILD"
						class="ctype-1 btn-detail cgt-single-load" tabindex="-1"> <img
						src="/content/img/view_big_btn.png" alt="상세보기">
					</a> <a id="link" href="#"
						onclick="return fnConfirmMoveUrl('로그인을 하셔야 이용하실수 있습니다.\n로그인 페이지로 이동하시겠습니까?' , '/Account/Login' );"
						class="ctype-1 btn-application" tabindex="-1"> <img
						src="/content/img/application_big_btn.png" alt="신청하기">
					</a>
				</div> -->


				

			</div>
		</div>




		<button type="button" data-role="none" class="slick-next slick-arrow"
			aria-label="Next" role="button" style="display: block;">Next</button>
		<ul class="slick-dots" style="display: block;" role="tablist">
			
			
			<li class="" aria-hidden="true" role="presentation"
				aria-selected="true" aria-controls="navigation00" id="slick-slide00"><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">1</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation01" id="slick-slide01" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">2</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation02" id="slick-slide02" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">3</button></li>
			<li aria-hidden="false" role="presentation" aria-selected="false"
				aria-controls="navigation03" id="slick-slide03" class="slick-active"><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">4</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation04" id="slick-slide04" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">5</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation05" id="slick-slide05" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">6</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation06" id="slick-slide06" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">7</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation07" id="slick-slide07" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">8</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation08" id="slick-slide08" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">9</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation09" id="slick-slide09" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">10</button></li>
			<li aria-hidden="true" role="presentation" aria-selected="false"
				aria-controls="navigation010" id="slick-slide010" class=""><button
					type="button" data-role="none" role="button" aria-required="false"
					tabindex="0">11</button></li>
		</ul>
	</div>
	<div style="clear: both;"></div>
</section> --%>



<!-- <콩 초기소스 참고용> -->
<!-- <div class="navi_wrap">
	<ul>

		<li><a href="/showcase/scdlist.action"><img
				src="/template/image/navi/all.jpg" alt="전체상품" /></a></li>
		<li><a href="/showcase/scdlist.action?showboard_category=전시"><img
				src="/template/image/navi/all.jpg" alt="전시" /></a></li>
		<li><a href="/showcase/scdlist.action?showboard_category=미술"><img
				src="/template/image/navi/all.jpg" alt="미술" /></a></li>
		<li><a href="/showcase/scdlist.action?showboard_category=이벤트"><img
				src="/template/image/navi/all.jpg" alt="이벤트" /></a></li>
		<li class="community"><a href="/notice/noticelist.action"><img
				src="/template/image/navi/notice.jpg" alt="공지사항" /></a></li>
		<li class="community"><a href="/qna/qnalist.action"><img
				src="/template/image/navi/qna.jpg" alt="질의응답" /></a></li>
		<li class="community"><a href="supportlist.action"><img
				src="/template/image/navi/notice.jpg" alt="서포트리스트뭐지" /></a></li> -->


<!-- <기존 아줌마소스 참고용> -->
<!--     <li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/showcase/scdlist.action'"></a></li>  전체상품 All 출력
    <li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/showcase/scdlist.action?showboard_category=전시'"></a></li>
	<li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/showcase/scdlist.action?showboard_category=미술'"></a></li>
	<li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/showcase/scdlist.action?showboard_category=이벤트'"></a></li>
	<li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/notice/noticelist.action'"></a></li>
	<li class="community"><a href="/notice/noticelist.action"><img src="/template/image/navi/notice.jpg" alt="공지사항" /></a></li>
	<li class="community"><a href="/qna/qnalist.action"><img src="/template/image/navi/qna.jpg" alt="질의응답" /></a></li>
	<li class="community"><a href="supportlist.action"><img src="/template/image/navi/notice.jpg" alt="서포트리스트뭐지" /></a></li> -->