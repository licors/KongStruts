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
	alert("이용해주셔서 감사합니다");
	window.location.href = 'memberLogout.action';
	} else {
	alert("취소되었습니다");
	}
}
</script>
<head>
<style>

.TopSearch { float:left; margin:16px auto 0;  }
select { height:24px; padding:1px 0 2px 1px; border:solid #cccccc 1px; }
 
</style>
</head>

<!-- <div style="text-align:left;margin:0 0 10px 0;width:40%;float:left;">
	<b>캔고루</b><br/>
	<img width ="200px" height="45px" src="/konggaru/template/image/header/logo.jpg" style="cursor: pointer;">
</div>
<div style="text-align:right;margin:0 0 10px 0;width:60%;float:right;">
	<a href="sclist.action" class="top-link"><b>HOME</b></a> &nbsp;|&nbsp; -->
		<h1 id="logo"><a href="/kong"><img src="/kong/template/image/header/logo.jpg" /></a></h1>
		<div class="TopSearch">
		<fieldset>
			<legend>검색</legend>
			<form name="findshowcase" id="mainSearch" action="#">
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
             	    <s:if test="memresultClass.getEmail() == 'admin@localhot'">
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
                	<li><input type="button" value="회원정보 수정" onClick="javascript:location.href='memberLoginForm.action'"><!-- 회원정보수정폼으로 경로 수정필요(수호 0829) -->

                	<!-- <li><a href="basketL.action"><input type="button" value="장바구니" /></a></li> -->
                	<li><input type="button" value="장바구니" onClick="javascript:location.href='basketList.action'"><!-- 장바구니리스트로 경로 수정필요(수호 0829) -->
                    <!-- <li><a href="orderList.action"><input type="button" value="주문목록"/></a></li> -->
                    <li><input type="button" value="주문목록" onClick="javascript:location.href='orderList.action'">
                	</s:if>
                	
                	
                	
                	
                	<!-- #####비회원일 때##### -->
                	<s:else>
      				<!-- <li><a href="memberLoginForm.action"><input type="button" value="로그인"  /></a></li> -->
      				<li><input type="button" value="로그인" onClick="javascript:location.href='memberLoginForm.action'">
                    <!--  <li><a href="memberJoinForm.action"><input type="button" value="회원가입" /></a></li> -->
                    <li><input type="button" value="회원가입" onClick="javascript:location.href='memberJoinForm.action'">
                    <li><input type="button" class="basket" value="장바구니" onclick="return basketlogin()"/></li>
                    <li><input type="button" class="order" value="주문목록" onclick="return buylogin()"></li>
                    </s:else>
                    </s:else>
                </ul>
			</div>
		</div>

<!-- 메뉴칸 -->
		<nav id="top_menu">
	<ul>
		<li><a href="">전시</a></li>
		<li><a href="">미술</a></li>
		<li><a href="../music/musiclist.do">이벤트</a></li>
	</ul>
</nav>
		
		
		
		
<%-- 		<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<script type="text/javascript">
	function go(a){
		var url = ['index.action','joinForm.action','loginForm.action','logout.action','memModForm.action','myRes.action'];
		window.location.href = url[a];
	}
</script>
<style type="text/css">
	body, div, ul, li{padding:0}
	body{font-size:12px; font-family:"맑은 고딕", arial} /*BODY안에 들어가는 전체 폰트 속성 제어*/
	ul{list-style:none}
	a{color:#000; text-decoration:none}
	.gnb{
		height:85px; /*전체 사이즈 및 윗부분 여백 제어*/
	}
	
    /* 메인메뉴 영역 */
    .gnb>ul{
     width:924px; height:70px; background:#ccc; /*메뉴 영역 제어*/
     padding:0px 0 0 0px; /*로고부분 여백*/
     }

   .gnb>ul>li{
     float:left; width:130px; height:70px; margin-right:2px;  /*주메뉴 영역 제어 */
     position:relative;z-index:2;
   }
   .gnb>ul>li.st a{color:red}

   .gnb>ul>li>a{
     display:block; width:100%; height:100%;   /*주메뉴 부분 제어*/
     font:bold 17px/70px "맑은 고딕", arial; /* about, rooms...~부분*/
     text-align:center; color:#ccc; background:white; 
   }

   .gnb ul li a:hover{color:#000; background:#white}   /*주메뉴부분에 마우스 오버시 이벤트 제어*/


    /* 서브메뉴 영역*/
    .gnb ul ul{display:none}

   .gnb>ul>li:hover ul{
      display:block; width:100px; height:30px;   /*서브 메뉴 영역 제어*/
      position:absolute; left:0; top:70px; /*서브단맞추기*/
      
   }

   .gnb li li{width:120px; height:30px; background-color:white; text-align:center; border-top:2px solid #ccc; }   /*서브메뉴 부분제어*/

    .gnb li li a{
     display:block; width:100%; height:100%;
     font:bold 12px/25px "맑은 고딕", arial;      /*서브메뉴 폰트제어*/
   }

    .gnb li li a:hover{
     color:#6EE3F7; background:none;         /*서브메뉴에 마우스 오버시 이벤트 제어*/
   }
  
</style>
<body>
<div style="text-align:left;margin:0 0 10px 0;width:40%;float:left;">
	<b>즐겨찾기</b><br/>
	<img width ="200px" height="45px" src="/project/template/image/logo.png" style="cursor: pointer;">
</div>
<div style="text-align:right;margin:0 0 10px 0;width:60%;float:right;">
	<a href="javascript:go(0)" class="top-link"><b>HOME</b></a> &nbsp;|&nbsp;
	
	<!-- 비회원 -->
	<c:if test="${session.id == null}">
	<a href="javascript:go(1)" class="top-link">회원가입</a> &nbsp;|&nbsp;
	<a href="javascript:go(2)" class="top-link">로그인</a> &nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
	<!-- 회원 -->
	<c:if test="${session.id != null}">
	<b><s:property value="#session.name" /> 님 </b>&nbsp;|&nbsp;
	<a href="javascript:go(3)" class="top-link">로그아웃</a> &nbsp;|&nbsp;
	</c:if>
	<c:if test="${session.id!='admin' && session.id != null}">
	<a href="javascript:go(4)" class="top-link">MyPage</a> &nbsp;|&nbsp;
	<a href="javascript:go(5)" class="top-link">예약 확인/취소</a> &nbsp;|&nbsp;
	</c:if>
</div>
<div style="text-align:center;margin:auto;width:80%;float:center;">
	<img width ="650px" height="80px" src="/project/template/image/search.png" style="cursor: pointer;">
</div> 
</body>
</html> --%>