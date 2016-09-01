<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%-- <style type="text/css">
h2{
	color: red;
}
pre{
	padding: 4px;
	border: #F90 dotted 1px;
}
</style>
<link href="./css/style.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
<script src="./js/desSlideshow.js"></script>
<script language="javascript" type="text/javascript">
    $(function() {
        $("#desSlideshow1").desSlideshow({
            autoplay: 'enable',
            slideshow_width: '1200',
            slideshow_height: '550',
            thumbnail_width: '320',
            time_Interval: '5000',
            directory: './img/'
        });
    });
</script> --%>
</head>
<body>
<!-- #################### 행사 리스트1 #################### -->
	<table width="700" align="center" border="0">
		<s:iterator value="list1" status="stat">
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>

<td width="230" align="center">
<a href ='showcaseDetail.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'></a>
			<img src="./showcase/upload/<s:property value="file_savname.split(',')[0]"/>" width="200px" height="250px"/></a>
				<br><br>
				<s:property value="subject"/>
				<br><br>
				<s:property value="pay"/>원
				<br/><br/><br/>
				</td>
	</s:iterator>
	</tr>
</table>
<!-- #################### 행사 리스트2 #################### -->
	<table width="700" align="center" border="0">
		<s:iterator value="list2" status="stat">
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>

<td width="230" align="center">
<a href ='showcaseDetail.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'>
			<img src="./showcase/upload/<s:property value="file_savname.split(',')[0]"/>" width="200px" height="250px"/></a>
				
				<br><br>
				<s:property value="subject"/>
				
				<br><br>
				<s:property value="pay"/>원
				<br/><br/><br/>
				</td>
	</s:iterator>
	</tr>
</table>

<!-- #################### 행사 리스트3 #################### -->
	<table width="700" align="center" border="0">
		<s:iterator value="list3" status="stat">
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>

<td width="230" align="center">
<a href ='showcaseDetail.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'>
			<img src="./showcase/upload/<s:property value="file_savname.split(',')[0]"/>" width="200px" height="250px"/></a>
				<br><br>
				<s:property value="subject"/>
				<br><br>
				<s:property value="pay"/>원
				<br/><br/><br/>
				</td>
	</s:iterator>
	</tr>
</table>
<br/><br/>

</body>
</html>