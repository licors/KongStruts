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
/* function goodsdelete(showboard_num,currentPage){
	document.goodsform.action="./gboardD.action?showboard_num="+showboard_num+"&currentPage="+currentPage;
	document.goodsform.submit();
}
function goodsmodify(showboard_num,currentPage){
	document.goodsform.action="./gboardMF.action?showboard_num="+showboard_num+"&currentPage="+currentPage;
	document.goodsform.submit();
} */
function goodsdelete(showboard_num){
	document.goodsform.action="./scdelete_form.action?showboard_num="+showboard_num;
	document.goodsform.submit();
}
function goodsmodify(showboard_num){
	document.goodsform.action="./scmodify_form.action?showboard_num="+showboard_num;
	document.goodsform.submit();
}
</script>

<%-- 		<table width="700" align="left">
		<tr height="30">
			<td align="center" style="">
			<s:if test="showboard_category==null">
				<img src="images/goods/all.jpg"></img>
			</s:if>
			<s:else>
				<s:if test="showboard_category=='outer'">
				<img src="images/goods/outer.jpg"></img>
				</s:if>
				<s:if test="showboard_category=='top'">
				<img src="images/goods/top.jpg"></img>
				</s:if>
				<s:if test="showboard_category=='blouse'">
				<img src="images/goods/dress.jpg"></img>
				</s:if>
				<s:if test="showboard_category=='pants'">
				<img src="images/goods/pants.jpg"></img>
				</s:if>
				<s:if test="showboard_category=='skirts'">
				<img src="images/goods/skirts.jpg"></img>
				</s:if>
				<s:if test="showboard_category=='shoes'">
				<img src="images/goods/shoes.jpg"></img>
				</s:if>
			<s:property value="goods_category"/>
			</s:else>
			</td>
		</tr>
	</table> --%>
	
			<table width="700" align="left">
		<tr height="30">
			<td align="center" style="">
			<s:if test="showboard_category==null">
				<img src="images/goods/all.jpg"></img>
			</s:if>
			<s:else>
				<s:if test="showboard_category.equals(\"전시\")">
				<img src="images/goods/outer.jpg"></img>
				</s:if>
				<s:if test="showboard_category.equals(\"미술\")">
				<img src="images/goods/top.jpg"></img>
				</s:if>
				<s:if test="showboard_category.equals(\"이벤트\")">
				<img src="images/goods/dress.jpg"></img>
				</s:if>
			<%--<s:property value="goods_category"/> --%>
			</s:else>
			</td>
		</tr>
	</table>
	
	<table width="700" align="center">
		<s:iterator value="list" status="stat">
   <s:url id="viewURL" action="scread">
   <s:param name="showboard_num">
   <s:property value="showboard_num"/>
   </s:param>
<%--    <s:param name="currentPage">
   <s:property value="currentPage"/>
   </s:param> --%>
   </s:url>
   
<%-- <s:if test="#stat.index % 3 eq 0"></s:if>--%>
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>
<td width="230" align="center">

<%-- <a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&goods_num=<s:property value="goods_num"/>&currentPage=<s:property value="currentPage"/>'>
			<img src="./goods/upload/<s:property value="goods_savimage.split(',')[0]"/>" width="200px" height="250px"/></a> --%>
<a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'>
			<img src="<s:property value="img"/><s:property value="file_savname.split(',')[0]"/>" width="200px" height="250px"/></a>
				
				<br><br>
				<s:property value="subject"/>
				<br><s:property value="date"/>
				<br><s:property value="address2"/>						
				
				<br><br>
				<s:if test="pay == 0">무료</s:if><s:else><s:property value="pay"/>원</s:else>
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
		<td colspan="5"><%-- <s:property value="pagingHtml" escape="false"/></td> --%>
	</tr> 
			</form>
		</td>
	</tr>
</table>

