<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>	

<style type="text/css">
*{border:0; padding:0; margin:auto;}

#header {
     width:100%; height:113px; border-bottom:1px solid #bbbbbb;
}
#header .header_wrap{width:1000px;margin:auto;overflow:hidden;}
#header .logo{
    width:245px; height:113px; background-image:url(/template/image/header/cangorulogo.jpg); background-repeat:no-repeat; float:left;
}

#header .searchKeyword{
    margin:70px 0 0 170px; width:250px; height:26px;  float:left;
}
#header .searchKeyword .serchText{
    width:220px; height:22px; float:left; border:1px solid #ebebeb ; color:#504f4f; font-family:Adobe Gothic Std; float:top;
}
#header .searchKeyword .serchButton{
    width:26px; height:26px; float:left; background-image:url(/template/image/header/s_button.jpg); cursor:pointer;
}
#header .memberArea{
    margin:78px 0 0 57px;float:left; width:278px; height:16px;
}

#header .memberArea .mem_in{
    float:left; width:62px; height:16px; background-image:url(/template/image/header/login.jpg); background-repeat:no-repeat; cursor:pointer;
}
#header .memberArea .mem_out{
    float:left; width:62px; height:16px; background-image:url(/template/image/header/logout.jpg); background-repeat:no-repeat; cursor:pointer;
}	
#header .memberArea .mem_join{
    float:left; width:72px; height:16px; background-image:url(/template/image/header/mem_join.jpg); background-repeat:no-repeat; cursor:pointer;
}	
#header .memberArea .basket{
    float:left; width:74px; height:16px; background-image:url(/template/image/header/basket.jpg); background-repeat:no-repeat; cursor:pointer;
}	
#header .memberArea .mypage{
    float:left; width:70px; height:16px; background-image:url(/template/image/header/mypage.png); background-repeat:no-repeat; cursor:pointer;
}
#header .memberArea .adminorder{
    float:left; width:70px; height:16px; background-image:url(/template/image/header/order_management.png); background-repeat:no-repeat; cursor:pointer;
}
#header .memberArea .admingoods{
    float:left; width:70px; height:16px; background-image:url(/template/image/header/admingoods.png); background-repeat:no-repeat; cursor:pointer;
}
#header .memberArea .memberlist{
    float:left; width:70px; height:16px; background-image:url(/template/image/header/member_management.png); background-repeat:no-repeat; cursor:pointer;
}  
#header .memberArea .order{ 
    float:left; width:70px; height:16px; background-image:url(/template/image/header/buy_list.jpg); background-repeat:no-repeat; cursor:pointer;
}
</style>

<div class="header_wrap">
    <a href="/showcase/sclist.action">
        <h1 class="logo"></h1>
    </a>
    <div class="searchKeyword">
    <s:if test="showboard_category != null">
        <form name="findgoods" action="scdSlist.action?showboard_category=<s:property value="showboard_category"/>" method="post" >
<%--         	<s:hidden name="showboard_category" value="%{showboard_category}"/> --%>
    </s:if>
    <s:else>
    	<form name="findgoods" action="scdlist.action" method="post" >
    </s:else>
                <input class="serchText" type="text" name="searchKeyword" size="10" value="" />
            <input class="serchButton" type="submit" value=""/> 
        </form>
    </div> 
    
    
    <div class="memberArea">
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