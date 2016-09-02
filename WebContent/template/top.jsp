<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>	

<div class="header_wrap">
    <a href="sclist.action">
        <h1 class="logo"></h1>
    </a>
    <div class="searchKeyword">
        <form name="findgoods" action="gboardL.action" method="post" >
            <input class="serchText" type="text" name="searchKeyword" size="10" value=""/>
            <input class="serchButton" type="submit" value=""/> 
        </form>
    </div> 
    
    
    <div class="memberArea">
        <ul>
            <!-- #####관리자일 때##### -->
            <s:if test="memresultClass.getEmail() == 'admin@localhost'">
                <li><input type="button" class="mem_out" value="" onclick="return logout()"/></li>
                <li><a href="memberList.action"><input type="button" class="memberlist" value=""/></a></li>
                <li><a href="orderList.action"><input type="button" class="adminorder" value=""/></a></li>
                <li><a href="scwrite_form.action"><input type="button" class="admingoods" value=""/></a></li>
                    </s:if>
            <!-- #####회원일 때##### -->
            <s:else>
                <s:if test="memresultClass.getEmail() != null">
                    <li><input type="button" class="mem_out" value="" onclick="return logout()"/></li>
                    <li><a href="memberModifyForm.action"><input type="button" class="mypage" value=""/></a></li>
                    <li><a href="basketList.action"><input type="button" class="basket" value="" /></a></li>
                    <li><a href="orderList.action"><input type="button" class="order" value=""/></a></li>  <!-- 일반회원용 주문현황으로 변경필요 09.02 -->
                        </s:if>
                <!-- #####비회원일 때##### -->
                <s:else>
                    <li><a href="memberLoginForm.action"><input type="button" class="mem_in" value=""  /></a></li>
                    <li><a href="memberJoinForm.action"><input type="button" class="mem_join" value="" /></a></li>
                    <li><input type="button" class="basket" value="" onclick="return basketlogin()"/></li>
                    <li><input type="button" class="order" value="" onclick="return buylogin()"></li>
                    </s:else>
                </s:else>
        </ul>
    </div>
</div>


<!-- <div class="navi_wrap">
<ul>

    <li><a href="gboardL.action"><img src="/template/image/navi/all.jpg" alt="전체상품" /></a></li>
	<li><a href="gboardL.action?goods_category=outer"><img src="/template/image/navi/outer.jpg" alt="겉옷" /></a></li>
	<li><a href="gboardL.action?goods_category=top&tee"><img src="/template/image/navi/top.jpg" alt="티" /></a></li>
	<li><a href="gboardL.action?goods_category=blouse"><img src="/template/image/navi/dress.jpg" alt="원피스" /></a></li>
	<li><a href="gboardL.action?goods_category=pants"><img src="/template/image/navi/pants.jpg" alt="바지" /></a></li>
	<li><a href="gboardL.action?goods_category=skirts"><img src="/template/image/navi/skirts.jpg" alt="치마" /></a></li>
	<li><a href="gboardL.action?goods_category=shoes"><img src="/template/image/navi/shoes.jpg" alt="신발" /></a></li>
	
	<li class="community"><a href="qlist.action"><img
			src="/template/image/navi/qna.jpg" alt="질문과 답" /></a></li>
	<li class="community"><a href="noticeboardL.action"><img
			src="/template/image/navi/notice.jpg" alt="공지사항" /></a></li>
			
</ul>
</div> -->