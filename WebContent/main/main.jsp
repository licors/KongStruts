<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<!--<style type="text/css">
h2{
	color: red;
}
pre{
	padding: 4px;
	border: #F90 dotted 1px;
}
</style>-->
<!--<link href="./css/style.css" rel="stylesheet" type="text/css" />-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
<script>
function showcaseView(url) {
	window.open(url, "post", "toolbar=no, width=600, height=600 ,directories=no, status=no, scrollbars=yes, menubar=no, location=no, resizable=no");
	}
</script>
</head>
<body>
                    <s:if test="memresultClass.admin > 0"><!-- 어드민 qna 작성 -->
                        <input name="support" type="button" value="전시글 작성"
                               onClick="javascript:location.href = '/showcase/scwrite_form.action'">
                    </s:if>

<!-- 리스트1(전시) 출력 -->
<br/><br/>
<table width="700" align="left" border="0">
		<tr height="30">
			<td align="center" style="">
				<!-- <img src="images/goods/all.jpg"></img> -->
				<h1>전시</h1>
				                <td align="right" colspan="5">

			</td>
		</tr>
	</table>
	
	
	<br/>
	<table width="700" align="center" border="0">
		<s:iterator value="list1" status="stat">
				<s:url id="viewURL" action="scread">
			<s:param name="showboard_num">
				<s:property value="showboard_num" />
			</s:param>
			<%--    <s:param name="currentPage">
   <s:property value="currentPage"/>
   </s:param> --%>
		</s:url>
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>
<td width="230" align="center">
<a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'target="_blank">
				<img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
				width="200px" height="250px" onerror="javascript:this.src='/template/image/main/noimg.png'"></img></a>

				<br><br>
				<s:property value="subject"/>
				<br><s:property value="date"/>
				<br><s:property value="address2"/>						
				<br><br>
				<s:if test="pay == 0">무료</s:if><s:else><s:property value="pay"/>원</s:else>
				<br><br><br>
	</s:iterator>
	</tr>
</table>


<!-- 리스트2(미술) 출력 -->
<br/><br/>
<table width="700" align="left" border="0">
		<tr height="30">
			<td align="center" style="">
				<img src="images/goods/all.jpg"></img>
			</td>
		</tr>
	</table>
	
	<br/>
	<table width="700" align="center" border="0">
		<s:iterator value="list2" status="stat">
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>
<td width="300" align="center">
<a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'target="_blank">
				<img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
				width="200px" height="250px" onerror="javascript:this.src='/template/image/main/noimg.png'"></img></a>
				<br><br>
				<s:property value="subject"/>
				<br><s:property value="date"/>
				<br><s:property value="address2"/>						
				<br><br>
				<s:if test="pay == 0">무료</s:if><s:else><s:property value="pay"/>원</s:else>
				<br><br><br>
	</s:iterator>
		</td>
	</tr>
</table>


<!-- 리스트3(이벤트) 출력 -->
<br/><br/>
<table width="700" align="left" border="0">
		<tr height="30">
			<td align="center" style="">
				<img src="images/goods/all.jpg"></img>
			</td>
		</tr>
	</table>
	<br/>
	<table width="700" align="center" border="0">
		<s:iterator value="list3" status="stat">
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>
<td width="230" align="center">
<a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'target="_blank">
				<img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
				width="200px" height="250px" onerror="javascript:this.src='/template/image/main/noimg.png'"></img></a>
				<br><br>
				<s:property value="subject"/>
				<br><s:property value="date"/>
				<br><s:property value="address2"/>						
				<br><br>
				<s:if test="pay == 0">무료</s:if><s:else><s:property value="pay"/>원</s:else>
				<br><br><br>
	</s:iterator>
		</td>
	</tr>
</table>
<br/><br/>

</body>
</html>