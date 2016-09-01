<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="stylesheet" href="css/goodsList.css" />
<link rel="stylesheet" href="css/index.css" />
<script language="javascript" type="text/javascript" src="js/index.js">
</script> --%>

<script type="text/javascript">
function goodsdelete(goods_num,currentPage){
	document.goodsform.action="./gboardD.action?goods_num="+goods_num+"&currentPage="+currentPage;
	document.goodsform.submit();
}
function goodsmodify(goods_num,currentPage){
	document.goodsform.action="./gboardMF.action?goods_num="+goods_num+"&currentPage="+currentPage;
	document.goodsform.submit();
}
</script>
	





		<table width="700" align="left">
		<tr height="30">
			<td align="center" style="">
			<s:if test="goods_category==null">
				<img src="images/goods/all.jpg"></img>
			</s:if>
			<s:else>
				<s:if test="goods_category=='outer'">
				<img src="images/goods/outer.jpg"></img>
				</s:if>
				<s:if test="goods_category=='top'">
				<img src="images/goods/top.jpg"></img>
				</s:if>
				<s:if test="goods_category=='blouse'">
				<img src="images/goods/dress.jpg"></img>
				</s:if>
				<s:if test="goods_category=='pants'">
				<img src="images/goods/pants.jpg"></img>
				</s:if>
				<s:if test="goods_category=='skirts'">
				<img src="images/goods/skirts.jpg"></img>
				</s:if>
				<s:if test="goods_category=='shoes'">
				<img src="images/goods/shoes.jpg"></img>
				</s:if>
			<%--<s:property value="goods_category"/> --%>
			</s:else>
			</td>
		</tr>
	</table>
	
	<table width="700" align="center">
		<s:iterator value="list" status="stat">
   <s:url id="viewURL" action="gboardV">
   <s:param name="goods_num">
   <s:property value="goods_num"/>
   </s:param>
   <s:param name="currentPage">
   <s:property value="currentPage"/>
   </s:param>
   </s:url>
   
<%-- <s:if test="#stat.index % 3 eq 0"></s:if>--%>
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>
<td width="230" align="center">
<a href ='gboardV.action?goods_category=<s:property value="goods_category"/>&goods_num=<s:property value="goods_num"/>&currentPage=<s:property value="currentPage"/>'>
			<img src="./goods/upload/<s:property value="goods_savimage.split(',')[0]"/>" width="200px" height="250px"/></a>
				
				<br><br>
	<!-- 베스트상품처리	 -->
	  <s:if test='goods_best == 0'>
	  <img src="images/goods/0.png" border="0">
	  </s:if>
	  <s:elseif test='goods_best  == 1'>
      <img src="images/goods/1.png" border="0">
      </s:elseif>
      <s:elseif test='goods_best  == 2'>
      <img src="images/goods/2.png" border="0">
      </s:elseif>
      <s:elseif test='goods_best == 3'>
      <img src="images/goods/3.png" border="0">
      </s:elseif>
				
							
				<br><br>
				
				<s:property value="goods_name"/>
				
								
				<br><br>
				
				<s:property value="goods_price"/>원
				<br><br><br>
	</s:iterator>
	
	<tr><td colspan="3" align="center">
		<!-- <img src="images/goods/line_top.png"></img> -->
	</td></tr>
	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다</td>
		</tr>
	</s:if>

	<tr align="center">
		<td colspan="5"><s:property value="pagingHtml" escape="false"/></td>
	</tr> 
			</form>
		</td>
	</tr>
</table>

