<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>	
<html>
<script>
function basketlogin(){
	alert("�α����� �ϼž� �� �� �ֽ��ϴ�");
	window.location.href='memberLoginForm.action';
}
function buylogin(){
	alert("�α����� �ϼž� �� �� �ֽ��ϴ�");
	window.location.href='memberLoginForm.action';
}
function logout(){
	if (confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")) {
	alert("�̿����ּż� �����մϴ�");
	window.location.href = 'memberLogout.action';
	} else {
	alert("��ҵǾ����ϴ�");
	}
}
</script>
<body>
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
        			<form name="findshowcase" action="showcaselist.action" method="post" >
            			<input type="text" name="searchKeyword" size="10" value=""/>
                		<input type="submit" value="�˻�"/> 
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
             	    <!-- #####�������� ��##### -->
             	    <s:if test="memresultClass.getEmail() == 'admin@localhot'">
                	<li><input type="button" value="�α׾ƿ�" onclick="return logout()"/></li>
                	<!-- <li><a href="adminmemberL.action"><input type="button" value="ȸ�����"/></a></li> -->
                	<li><input type="button" value="ȸ�����" onClick="javascript:location.href='memberLoginForm.action'"> <!-- ������ ȸ����ϸ���Ʈ ��μ����ʿ�(��ȣ 0829) -->
                	<!-- <li><a href="adminorderL.action"><input type="button" value="�ֹ����"/></a></li> -->
                	<li><input type="button" value="�ֹ����" onClick="javascript:location.href='orderList.action'"> <!-- ������ �ֹ���ϸ���Ʈ ��μ����ʿ�(��ȣ 0829) -->
                	<!-- <li><a href="admingoodsL.action"><input type="button" value="�����"/></a></li> -->
                    <li><input type="button" value="�����" onClick="javascript:location.href='scwrit_form.action'"> <!-- ������ ��ǰ����Ʈ ��μ����ʿ�(��ȣ 0829) -->
                	</s:if>
                	
                	
                	
                	
                	<!-- #####ȸ���� ��##### -->
      				<s:else>
      				<s:if test="memresultClass.getEmail() != null">
                	<li><input type="button"  value="�α׾ƿ�" onclick="return logout()"/></li>
                	<!-- <li><a href="memberMF.action"><input type="button" value="ȸ����������"/></a></li>  -->
                	<li><input type="button" value="ȸ������ ����" onClick="javascript:location.href='memberLoginForm.action'"><!-- ȸ���������������� ��� �����ʿ�(��ȣ 0829) -->

                	<!-- <li><a href="basketL.action"><input type="button" value="��ٱ���" /></a></li> -->
                	<li><input type="button" value="��ٱ���" onClick="javascript:location.href='basketList.action'"><!-- ��ٱ��ϸ���Ʈ�� ��� �����ʿ�(��ȣ 0829) -->
                    <!-- <li><a href="orderList.action"><input type="button" value="�ֹ����"/></a></li> -->
                    <li><input type="button" value="�ֹ����" onClick="javascript:location.href='orderList.action'">
                	</s:if>
                	
                	
                	
                	
                	<!-- #####��ȸ���� ��##### -->
                	<s:else>
      				<!-- <li><a href="memberLoginForm.action"><input type="button" value="�α���"  /></a></li> -->
      				<li><input type="button" value="�α���" onClick="javascript:location.href='memberLoginForm.action'">
                    <!--  <li><a href="memberJoinForm.action"><input type="button" value="ȸ������" /></a></li> -->
                    <li><input type="button" value="ȸ������" onClick="javascript:location.href='memberJoinForm.action'">
                    <li><input type="button" value="��ٱ���" onclick="return basketlogin()"/></li>
                    <li><input type="button" value="�ֹ����" onclick="return buylogin()"></li>
                    </s:else>
                    </s:else>
                </ul>
			</div>
		</div>
		</body>
		</html>
		
		
		
		
		
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
	body{font-size:12px; font-family:"���� ���", arial} /*BODY�ȿ� ���� ��ü ��Ʈ �Ӽ� ����*/
	ul{list-style:none}
	a{color:#000; text-decoration:none}
	.gnb{
		height:85px; /*��ü ������ �� ���κ� ���� ����*/
	}
	
    /* ���θ޴� ���� */
    .gnb>ul{
     width:924px; height:70px; background:#ccc; /*�޴� ���� ����*/
     padding:0px 0 0 0px; /*�ΰ�κ� ����*/
     }

   .gnb>ul>li{
     float:left; width:130px; height:70px; margin-right:2px;  /*�ָ޴� ���� ���� */
     position:relative;z-index:2;
   }
   .gnb>ul>li.st a{color:red}

   .gnb>ul>li>a{
     display:block; width:100%; height:100%;   /*�ָ޴� �κ� ����*/
     font:bold 17px/70px "���� ���", arial; /* about, rooms...~�κ�*/
     text-align:center; color:#ccc; background:white; 
   }

   .gnb ul li a:hover{color:#000; background:#white}   /*�ָ޴��κп� ���콺 ������ �̺�Ʈ ����*/


    /* ����޴� ����*/
    .gnb ul ul{display:none}

   .gnb>ul>li:hover ul{
      display:block; width:100px; height:30px;   /*���� �޴� ���� ����*/
      position:absolute; left:0; top:70px; /*����ܸ��߱�*/
      
   }

   .gnb li li{width:120px; height:30px; background-color:white; text-align:center; border-top:2px solid #ccc; }   /*����޴� �κ�����*/

    .gnb li li a{
     display:block; width:100%; height:100%;
     font:bold 12px/25px "���� ���", arial;      /*����޴� ��Ʈ����*/
   }

    .gnb li li a:hover{
     color:#6EE3F7; background:none;         /*����޴��� ���콺 ������ �̺�Ʈ ����*/
   }
  
</style>
<body>
<div style="text-align:left;margin:0 0 10px 0;width:40%;float:left;">
	<b>���ã��</b><br/>
	<img width ="200px" height="45px" src="/project/template/image/logo.png" style="cursor: pointer;">
</div>
<div style="text-align:right;margin:0 0 10px 0;width:60%;float:right;">
	<a href="javascript:go(0)" class="top-link"><b>HOME</b></a> &nbsp;|&nbsp;
	
	<!-- ��ȸ�� -->
	<c:if test="${session.id == null}">
	<a href="javascript:go(1)" class="top-link">ȸ������</a> &nbsp;|&nbsp;
	<a href="javascript:go(2)" class="top-link">�α���</a> &nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
	<!-- ȸ�� -->
	<c:if test="${session.id != null}">
	<b><s:property value="#session.name" /> �� </b>&nbsp;|&nbsp;
	<a href="javascript:go(3)" class="top-link">�α׾ƿ�</a> &nbsp;|&nbsp;
	</c:if>
	<c:if test="${session.id!='admin' && session.id != null}">
	<a href="javascript:go(4)" class="top-link">MyPage</a> &nbsp;|&nbsp;
	<a href="javascript:go(5)" class="top-link">���� Ȯ��/���</a> &nbsp;|&nbsp;
	</c:if>
</div>
<div style="text-align:center;margin:auto;width:80%;float:center;">
	<img width ="650px" height="80px" src="/project/template/image/search.png" style="cursor: pointer;">
</div> 
</body>
</html> --%>