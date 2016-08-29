<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>	

<script>
/* function basketlogin(){
	alert("로그인을 하셔야 볼 수 있습니다");
	window.location.href='basketLOF.action';
}
function buylogin(){
	alert("로그인을 하셔야 볼 수 있습니다");
	window.location.href='buyLOF.action';
} */

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


		
<!-- 		<div class="header_wrap">
				<a href="main.action">
	    			<h1 class="logo"></h1>
	        	</a>
       		 <div class="searchKeyword">
        			<form name="findgoods" action="gboardL.action" method="post" >
            			<input class="serchText" type="text" name="searchKeyword" size="10" value=""/>
                		<input class="serchButton" type="submit" value=""/> 
           			 </form>
       		 </div> -->
       		 		<div class="header_wrap">
				<a href="main.action">
	        	</a>
       		 <div class="searchKeyword">
        			<form name="findshowcase" action="showboardL.action" method="post" >
            			<input type="text" name="searchKeyword" size="10" value=""/>
                		<input type="submit" value="검색"/> 
           			 </form>
       		 </div>
       		 
       		 
       		 
<%--              <div class="memberArea">
             	<ul>
             	    <s:if test="memresultClass.getId() == 'admin'">
                	<li><input type="button" class="mem_out" value="" onclick="return logout()"/></li>
                	<li><a href="adminmemberL.action"><input type="button" class="memberlist" value=""/></a></li>
                	<li><a href="adminorderL.action"><input type="button" class="adminorder" value=""/></a></li>
                	<li><a href="admingoodsL.action"><input type="button" class="admingoods" value=""/></a></li>
                	</s:if>
      				<s:else>
      				<s:if test="memresultClass.getId() != null">
                	<li><input type="button" class="mem_out" value="" onclick="return logout()"/></li>
                	<li><a href="memberMF.action"><input type="button" class="mypage" value=""/></a></li>
                	<li><a href="basketL.action"><input type="button" class="basket" value="" /></a></li>
                    <li><a href="orderL.action"><input type="button" class="order" value=""/></a></li>
                	</s:if>
                	<s:else>
      				<li><a href="memberLOF.action"><input type="button" class="mem_in" value=""  /></a></li>
                    <li><a href="joinRule.action"><input type="button" class="mem_join" value="" /></a></li>
                    <li><input type="button" class="basket" value="" onclick="return basketlogin()"/></li>
                    <li><input type="button" class="order" value="" onclick="return buylogin()"></li>
                    </s:else>
                    </s:else>
                </ul>
			</div>
		</div> --%>
		             <div class="memberArea">
             	<ul>
             	    <s:if test="memresultClass.getEmail() == 'admin'">
                	<li><input type="button" value="로그아웃" onclick="return logout()"/></li>
                	<li><a href="adminmemberL.action"><input type="button" value="회원목록"/></a></li>
                	<li><a href="adminorderL.action"><input type="button" value="주문목록"/></a></li>
                	<li><a href="admingoodsL.action"><input type="button" value="행사목록"/></a></li>
                	</s:if>
      				<s:else>
      				<s:if test="memresultClass.getEmail() != null">
                	<li><input type="button"  value="로그아웃" onclick="return logout()"/></li>
                	<li><a href="memberMF.action"><input type="button" value="회원정보수정"/></a></li> <!-- //memberMF 액션경로 수정필요 -->
                	<li><a href="basketL.action"><input type="button" value="장바구니" /></a></li>  <!-- basketL 액션경로 수정필요 -->
                    <li><a href="orderList.action"><input type="button" value="주문목록"/></a></li>
                	</s:if>
                	<s:else>
      				<li><a href="memberLoginForm.action"><input type="button" value="로그인"  /></a></li>
                    <li><a href="joinRule.action"><input type="button" value="회원가입" /></a></li>     <!-- joinRule.action 이용약관 동의처리로가는 액션명 수정필요 -->
                    <li><input type="button" class="basket" value="장바구니" onclick="return basketlogin()"/></li>
                    <li><input type="button" class="order" value="주문목록" onclick="return buylogin()"></li>
                    </s:else>
                    </s:else>
                </ul>
			</div>
		</div>