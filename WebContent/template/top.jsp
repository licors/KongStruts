<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>	

<script>
function basketlogin(){
	alert("로그인을 하셔야 볼 수 있습니다");
	window.location.href='memberLoginForm.action';
}
function buylogin(){
	alert("로그인을 하셔야 볼 수 있습니다");
	window.location.href='memberLoginForm.action';
}
function logout(){
	if (confirm("로그아웃 하시겠습니까?")) {
	alert("이용해주셔서 감사합니다safsafsaf");
	window.location.href = 'memberLogout.action';
	} else {
	alert("취소되었습니다");
	}
}
</script>
<head>
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
	<h1 id="logo"><img width ="200px" height="50px" src="/kong/template/image/header/logo.jpg" style="cursor: pointer;">
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
	</div>
	
		             <div class="memberArea">
		             
             	<ul>
             	    <!-- #####관리자일 때##### -->
             	    <s:if test="memresultClass.getEmail() == 'admin@localhost'">
                	<li><input type="button" value="로그아웃" onclick="return logout()"/></li>
                	<!-- <li><a href="adminmemberL.action"><input type="button" value="회원목록"/></a></li> -->
                	<li><input type="button" value="회원목록" onClick="javascript:location.href='memberLoginForm.action'"> <!-- 관리자 회원목록리스트 경로수정필요(수호 0829) -->
                	<!-- <li><a href="adminorderL.action"><input type="button" value="주문목록"/></a></li> -->
                	<li><input type="button" value="주문목록" onClick="javascript:location.href='orderList.action'"> <!-- 관리자 주문목록리스트 경로수정필요(수호 0829) -->
                	<!-- <li><a href="admingoodsL.action"><input type="button" value="행사목록"/></a></li> -->
                    <li><input type="button" value="행사목록" onClick="javascript:location.href='scwrit_form.action'"> <!-- 관리자 상품리스트 경로수정필요(수호 0829) -->
                	</s:if>
                	
                	
                	
                	
                	<!-- #####회원일 때##### -->
      				<s:else>
      				<s:if test="memresultClass.getEmail() != null">
                	<li><input type="button"  value="로그아웃" onclick="return logout()"/></li>
                	<!-- <li><a href="memberMF.action"><input type="button" value="회원정보수정"/></a></li>  -->
                	<li><input type="button" value="회원정보 수정" onClick="javascript:location.href='memberModifyForm.action'"><!-- 회원정보수정폼으로 경로 수정필요(수호 0829) -->

                	<!-- <li><a href="basketL.action"><input type="button" value="장바구니" /></a></li> -->
                	<li><input type="button" value="장바구니" onClick="javascript:location.href='basketList.action'"><!-- 장바구니리스트로 경로 수정필요(수호 0829) -->
                    <!-- <li><a href="orderList.action"><input type="button" value="주문목록"/></a></li> -->
                    <li><input type="button" value="주문목록" onClick="javascript:location.href='orderList.action'">
                	</s:if>
                	
                	
                	
                	
                	<!-- #####비회원일 때##### -->
                	<s:else>
      				<!-- <li><a href="memberLoginForm.action"><input type="button" value="로그인"  /></a></li> -->
      				<li><input type="button" value="로그인" onClick="javascript:location.href='memberLoginForm.action'">
                    <!-- <li><a href="memberJoinForm.action"><input type="button" value="회원가입" /></a></li> -->
                    <li><input type="button" value="회원가입" onClick="javascript:location.href='memberJoinForm.action'">
                    <li><input type="button" class="basket" value="장바구니" onclick="return basketlogin()"/></li>
                    <li><input type="button" class="order" value="주문목록" onclick="return buylogin()"></li>
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