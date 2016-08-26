<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>


</head>
<body>
	<br/>
	<br/>
	<table width="700" align="left" border="0">
		<tr height="30">
			<td align="center" style=""><img src="images/goods/all.jpg"></img>
			</td>
		</tr>
	</table>

	<br/>
	<table width="700" align="center" border="0">
		<s:iterator value="list1" status="stat">

			<s:if test="#stat.index % 4 eq 0">
				<tr></tr>
			</s:if>
			<td width="230" align="center">
			<a href='상세보기.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>&currentPage=1'>
					<img src="./goods/upload/<s:property value="file_savname.split(',')[0]"/>"
					width="200px" height="250px" />
			</a>
			<br><br>
			<s:property value="subject" /> <br><br>
			<s:property value="pay" />원  <br><br>
		</s:iterator>
		</td>
		</tr>
	</table>

	<br/>
	<br/>
</body>
</html>