<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div style="margin-bottom: 0px; height: 40px;">
	<div style="position: absolute; width: 100%; left: 0px; box-sizing: border-box;" id="cgt-top-menu-bg">
		<div style="width: 50%; background: #12B1DB; height: 40px; float: left;"></div>
		<div style="width: 50%; background: #FBA92C; height: 40px; float: left;"></div>
	</div>
	<div style="position: absolute; width: 100%; left: 0px;" align="center" id="cgt-top-menu-front">
		<div style="line-height: 40px; max-width: 1200px; box-sizing: border-box; font-size: 16px; left: 0px;"
			id="menu" data-bind="foreach: TopMenuNavData">
			
			    <a href="/showcase/scdlist.action?showboard_category=전시">
			    <!-- <a href="/Event/1" data-bind="attr: { href:  '/Event/' + CTYPE }"> -->
			    <div data-bind="css:'cgt_m_menu_ctype_' + ($index() + 1)"
					style="float: left; width: 314px;" class="cgt_m_menu_ctype_1">
					<span data-bind="text: MENU_NM">전시</span>
				</div>
				</a> 
				
				<a href="/showcase/scdlist.action?showboard_category=미술">
				<!-- <a href="/Event/5" data-bind="attr: { href:  '/Event/' + CTYPE }"> -->
				<div data-bind="css:'cgt_m_menu_ctype_' + ($index() + 1)"
					style="float: left; width: 314px;" class="cgt_m_menu_ctype_2">
					<span data-bind="text: MENU_NM">미술</span>
				</div>
				</a> 
				
				<a href="/showcase/scdlist.action?showboard_category=이벤트">
				<!-- <a href="/Event/6" data-bind="attr: { href:  '/Event/' + CTYPE }"> -->
				<div data-bind="css:'cgt_m_menu_ctype_' + ($index() + 1)"
					style="float: left; width: 314px;" class="cgt_m_menu_ctype_3">
					<span data-bind="text: MENU_NM">이벤트</span>
				</div>
				</a>
		</div>
	</div>
</div>


















<div class="navi_wrap">
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
				src="/template/image/navi/notice.jpg" alt="서포트리스트뭐지" /></a></li>

		<!--     <li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/showcase/scdlist.action'"></a></li>  전체상품 All 출력
    <li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/showcase/scdlist.action?showboard_category=전시'"></a></li>
	<li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/showcase/scdlist.action?showboard_category=미술'"></a></li>
	<li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/showcase/scdlist.action?showboard_category=이벤트'"></a></li>
	<li><img src="/template/image/navi/all.jpg" onClick="javascript:location.href = '/notice/noticelist.action'"></a></li>
	<li class="community"><a href="/notice/noticelist.action"><img src="/template/image/navi/notice.jpg" alt="공지사항" /></a></li>
	<li class="community"><a href="/qna/qnalist.action"><img src="/template/image/navi/qna.jpg" alt="질의응답" /></a></li>
	<li class="community"><a href="supportlist.action"><img src="/template/image/navi/notice.jpg" alt="서포트리스트뭐지" /></a></li> -->

	</ul>
</div>