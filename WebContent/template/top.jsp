<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>	

<%-- <head>
<style type="text/css">
        body, div, ul, li{padding:0}
        ul{list-style:none}
        a{color:#000; text-decoration:none}

.TopSearch { float:left; margin:20px auto 0;  }
select { height:24px; padding:1px 0 2px 1px; border:solid #cccccc 1px; }
 
</style>
</head>

<div style="text-align:left; margin:0px 0;width:40%;float:left;">
        <!-- <a href="/kong"><b>캔고루</b><br/> -->
        <h1 id="logo"><img width ="200px" height="50px" src="/kong/template/image/header/cangorulogo.jpg" style="cursor: pointer;">
</div>
<div style="text-align:right; margin:0 0 10px 0;width:60%;float:right;">
        <!-- <a href="sclist.action" class="top-link"><b>HOME</b></a> &nbsp;|&nbsp; -->
    <!-- <h1 id="logo"><a href="/kong"><img src="/kong/template/image/header/logo.jpg" /></a></h1> -->
                <div class="TopSearch">
                <fieldset>
                        <legend></legend>
                        <form name="findshowcase" id="mainSearch" action="">
                        <select name="searchKind" id="searchKind" class="">
                                <option value="all" selected=selected>통합</option>
                                <option value="showcase">전시</option>
                                <option value="art">미술</option>
                                <option value="event">이벤트</option>
                        </select>
                        <input type="text" name="searchFind" id="searchFind" class="" />
                        <input type="image" src="/kong/template/image/header/s_button.jpg" />
                        </form>
                </fieldset>
        </div> --%>



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

<!-- 전시행사 카테고리 선택칸 -->
<nav id="top_menu">
    <ul>
        <li><a href="">전시</a></li>
        <li><a href="">미술</a></li>
        <li><a href="../music/musiclist.do">이벤트</a></li>
    </ul>
</nav>