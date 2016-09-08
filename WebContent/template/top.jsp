<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>	

<script type="text/javascript" src="/js/bootstrap.min.js"></script>

<!-- ###############수호 0908 캔고루 소스 상단1(앱,페북,로그인,회원가입,고객센터등)############### -->
<div>
        <section>
<nav class="navbar" style="margin:0px; padding:0px; min-height:0px;">
    <div style="width:100%; background-color:#E9E9E9; ">
        <div style="max-width:1200px;height:52px;margin:0px auto;padding-top:10px;">
            <div style="float: left;padding-top:4px;">
                <ul>
                    <li style="list-style:none; display:inline-block;">
                        <a href="#" onclick="MoveAppDownLoadConfirm(''); return false;" target="_blank">
                            <img src="/template/image/header/cangoruappdownloadlogo.jpg">
                        </a> <a href="https://itunes.apple.com/kr/app/mulyo-hal-intikes-kaengolu/id649328104?mt=8" target="_blank"></a>
                    </li>
                    <li style="list-style:none; display:inline-block;margin-left:2px;">
                        <a href="https://www.facebook.com/ucangoto" target="_blank">
                            <img src="/template/image/header/cangorufacebooklogo.jpg">
                        </a>
                    </li>
                </ul>
            </div>
            <div style="float:right;height:28px">
                <ul>
                

                
                <!-- #####관리자일 때##### -->
            <s:if test="memresultClass.getEmail() == 'admin@localhost'">
                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" href="/member/memberModifyForm.action">사람 이미지로 바꿀예정</a></li>
                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" onclick="return logout()">로그아웃</a></li>
                        <li class="dropdown topshortlink" style="list-style:none; display:inline-block;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/showcase/scwrite_form.action">상품등록</a>
                            </li>
                            <li>
                                <a href="/order/adminOrderList.action">주문목록</a>
                            </li>
                            <li>
                                <a href="/member/memberlist.action">회원관리</a>
                            </li>
                            <li>
                                <a href="/member/memberModifyForm.action">내 정보</a>
                            </li>
                       </ul>
                        <li class="dropdown topshortlink" style="list-style:none; display:inline-block;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/qna/qnalist.action">FAQ</a>
                            </li>
                            <li>
                                <a href="/notice/noticelist.action">공지사항</a>
                            </li>
                            <li>
                                <!-- <a href="supportlist.action" target="_blank">광고(제휴)문의</a> -->
                                <a href="supportlist.action">광고(제휴)문의</a>
                            </li>
                            
                    </s:if>
                    
            <!-- #####회원일 때##### -->
            <s:else>
                <s:if test="memresultClass.getEmail() != null">
                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" href="/member/memberModifyForm.action">사람 이미지로 바꿀예정</a></li>
                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" onclick="return logout()">로그아웃</a></li>
                    <!-- <li><input type="button" class="mem_out" value="" onclick="return logout()"/></li> -->
                        <li class="dropdown topshortlink" style="list-style:none; display:inline-block;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/order/orderList.action">마이티켓</a>
                            </li>
                            <li>
                                <a href="/basket/basketList.action">관심티켓</a>
                            </li>
                            <li>
                                <a href="supportlist.action">1:1문의</a>
                            </li>
                                                        <li>
                                <a href="/member/memberModifyForm.action">내 정보</a>
                            </li>
                       </ul>
                    <!-- <li><a href="/member/memberModifyForm.action"><input type="button" class="mypage" value=""/></a></li> -->
<!--                     <li><a href="/basket/basketList.action"><input type="button" class="basket" value="" /></a></li> 유진:basket,order 경로수정
                    <li><a href="/order/orderList.action"><input type="button" class="order" value=""/></a></li>  일반회원용 주문현황으로 변경필요 09.02 -->
                        <li class="dropdown topshortlink" style="list-style:none; display:inline-block;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/qna/qnalist.action">FAQ</a>
                            </li>
                            <li>
                                <a href="/notice/noticelist.action">공지사항</a>
                            </li>
                            <li>
                                <!-- <a href="supportlist.action" target="_blank">광고(제휴)문의</a> -->
                                <a href="supportlist.action">광고(제휴)문의</a>
                            </li>
                       </ul>
                            
                        </s:if>
                        
                <!-- #####비회원일 때##### -->
                <s:else>
                <li class="topshortlink" style="list-style:none; display:inline-block;"><img style="height:28px;"><a class="login-button" href="/member/memberLoginForm.action">로그인</a></li>
                    <!-- <li><a href="/member/memberLoginForm.action"><input type="button" class="mem_in" value=""  /></a></li> -->
                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" href="/member/memberJoinForm.action">회원가입</a></li>
                    <!-- <li><a href="/member/memberJoinForm.action"><input type="button" class="mem_join" value="" /></a></li> -->
                        <li class="dropdown topshortlink" style="list-style:none; display:inline-block;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/qna/qnalist.action">FAQ</a>
                            </li>
                            <li>
                                <a href="/notice/noticelist.action">공지사항</a>
                            </li>
                            <li>
                                <!-- <a href="supportlist.action" target="_blank">광고(제휴)문의</a> -->
                                <a href="supportlist.action">광고(제휴)문의</a>
                            </li>
                       </ul>
                       
                    </s:else>
                </s:else>




                        
                    </li>
                </ul>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
</nav>

<!-- ###############수호 0908 캔고루 소스 상단2(로고, 검색창, 캔고루 종 로고)############### -->
<div style="background-color:#FFFFFF;">
    <div style="max-width:900px; margin:0px auto; text-align:center; padding:30px 0px;">
        <div class="boxes">
            <div class="box box2" style="text-align:center;padding-top:5px">
                <div style="display: inline-block; margin: 0px auto;">
                    <a href="/"><img src="/template/image/header/cangorulogo.jpg" alt="CANGOTO" height="40" style="float:left;margin-right:50px"></a>
                    <div style="float:left;">
                    
                    
                    <s:if test="showboard_category != null">
        <form name="findgoods" action="/showcase/scdSlist.action?showboard_category=<s:property value="showboard_category"/>" method="post" >
        </s:if>
    <s:else>
    	<form name="findgoods" action="/showcase/scdSlist.action" method="post" >
    </s:else>            
                    <input type="text" class="form-control mainSerchBox" placeholder="검색어, #해시태그" id="txtMainSearch" name="searchKeyword" value=""></div>
                        <div style="float:left; background-color:#12B1DB; width:40px; height:40px; line-height:40px;margin-right:30px">
                        
                        <!-- 수호 0908 이미지경로 수정필요 밑에 이 경로가 아이콘 서치버튼 이미지경로임 -->
                            <!-- <img src="/template/image/header/icon_search.jpg"> -->
                            <input class=""  type="submit" value=""/> 
                            
                            
                        </div>
                    </a>
                    <div style="clear:both;"></div>
                </div>
            </div>
            <div class="box box3" style="text-align:right;">
                    <img src="/template/image/header/searchrightjong.png">
            </div>
        </div>
    </div>
</div>


<!-- ###############수호 0908 캔고루 소스 상단3(전시, 미술, 이벤트 카테고리 클릭칸)############### -->
<div style="margin-bottom:0px;height:40px;">
    <div style="position: absolute; width: 100%; left: 0px; box-sizing: border-box;" id="cgt-top-menu-bg">
        <div style="width: 50%; background: #12B1DB; height: 40px; float: left;"></div><div style="width: 50%; background: #FBA92C; height: 40px; float: left; "></div>
    </div>
    <div style="position: absolute; width: 100%; left: 0px;" align="center" id="cgt-top-menu-front">
        <div style="line-height: 40px; max-width: 1200px; box-sizing: border-box; font-size: 16px; left: 351.5px;" id="menu" data-bind="foreach: TopMenuNavData">
            <a href="/showcase/scdlist.action?showboard_category=전시" data-bind="attr: { href:  '/Event/' + CTYPE }"><div data-bind="css:'cgt_m_menu_ctype_' + ($index() + 1)" style="float: left; width: 400px;" class="cgt_m_menu_ctype_1"><span data-bind="text: MENU_NM">전시</span></div></a>
        
            <a href="/showcase/scdlist.action?showboard_category=미술" data-bind="attr: { href:  '/Event/' + CTYPE }"><div data-bind="css:'cgt_m_menu_ctype_' + ($index() + 1)" style="float: left; width: 400px;" class="cgt_m_menu_ctype_2"><span data-bind="text: MENU_NM">미술</span></div></a>
        
            <a href="/showcase/scdlist.action?showboard_category=이벤트" data-bind="attr: { href:  '/Event/' + CTYPE }"><div data-bind="css:'cgt_m_menu_ctype_' + ($index() + 1)" style="float: left; width: 400px;" class="cgt_m_menu_ctype_3"><span data-bind="text: MENU_NM">이벤트</span></div></a>
        </div>
    </div>
</div>
<div style="clear:both;"></div>
        </section>
    </div>




<!-- 폐기처리된 아줌마 소스들....... 혹시나 나중에 필요할까봐 둔다.. 이거하려고 시간이 얼마나 걸렸는데..... -->
<%-- <div class="header_wrap">
    <a href="/showcase/sclist.action">
        <h1 class="logo" ></h1>
    </a>
    <div class="searchKeyword">
    <s:if test="showboard_category != null">
        <form name="findgoods" action="/showcase/scdSlist.action?showboard_category=<s:property value="showboard_category"/>" method="post" >
        	<s:hidden name="showboard_category" value="%{showboard_category}"/>
    </s:if>
    <s:else>
    	<form name="findgoods" action="/showcase/scdSlist.action" method="post" >
    </s:else>
<%--                 <input class="serchText" type="text" name="searchKeyword" size="10" value="" />
            <input class="serchButton" style="border:0; padding:0; margin:auto;" type="submit" value=""/> 
        </form>
    </div>  --%>
    
<%--     <div class="memberArea">
        <ul>
            <!-- #####관리자일 때##### -->
            <s:if test="memresultClass.getEmail() == 'admin@localhost'">
                <li><input type="button" class="mem_out" value="" onclick="return logout()"/></li>
                <li><a href="/member/memberlist.action"><input type="button" class="memberlist" value=""/></a></li>
                <li><a href="/order/adminOrderList.action"><input type="button" class="adminorder" value=""/></a></li> <!-- 유진:어드민 오더리스트 경로 수정 0903 -->
                <li><a href="/showcase/scwrite_form.action"><input type="button" class="admingoods" value=""/></a></li>
                    </s:if>
            <!-- #####회원일 때##### -->
            <s:else>
                <s:if test="memresultClass.getEmail() != null">
                    <li><input type="button" class="mem_out" value="" onclick="return logout()"/></li>
                    <li><a href="/member/memberModifyForm.action"><input type="button" class="mypage" value=""/></a></li>
                    <li><a href="/basket/basketList.action"><input type="button" class="basket" value="" /></a></li> <!-- 유진:basket,order 경로수정-->
                    <li><a href="/order/orderList.action"><input type="button" class="order" value=""/></a></li>  <!-- 일반회원용 주문현황으로 변경필요 09.02 -->
                        </s:if>
                <!-- #####비회원일 때##### -->
                <s:else>
                    <li><a href="/member/memberLoginForm.action"><input type="button" class="mem_in" value=""  /></a></li>
                    <li><a href="/member/memberJoinForm.action"><input type="button" class="mem_join" value="" /></a></li>
                    <li><input type="button" class="basket" value="" onclick="return basketlogin()"/></li>
                    <li><input type="button" class="order" value="" onclick="return buylogin()"></li>
                    </s:else>
                </s:else>
        </ul>
    </div> --%>