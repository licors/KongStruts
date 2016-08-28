<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<table>
		<tr>
			<th colspan="3"><b><s:property value="resultClass.subject" /></b></th>
		</tr>
		<tr>
			<td rowspan="6"><img src="showcase/upload/<s:property value="resultClass.file_savname.split(',')[0]"/>" width="50" height="50" border="0"></td>
			<td>주소</td>
			<td><s:property value="resultClass.address1" />&nbsp;<s:property value="resultClass.address2" /></td>
		</tr>
		<tr>
			<td>일정</td>
			<td><s:property value="resultClass.date" /></td>
		</tr>
		<tr>
			<td>입장료</td>
			<td><s:property value="resultClass.pay" /></td>
		</tr>
		<tr>
			<td>문의전화</td>
			<td><s:property value="resultClass.tel" /></td>
		</tr>
		<tr>
			<td>태그</td>
			<td><s:property value="resultClass.tag" /></td>
		</tr>
		<tr>
			<td>공유하기</td>
			<td> 페이스북</td>
		</tr>
		<tr>
			<td colspan="3" align="right"> 
				<input name="basket" type="button" value="관심티켓" onClick="javascript:location.href='/kong/basket/basketInsert.action?currentPage=<s:property value="%{resultClass.showboard_num}" />'">
				<input name="order" type="button" value="신청하기" onClick="javascript:location.href='/kong/order/orderForm.action?currentPage=<s:property value="%{resultClass.showboard_num}" />'">
			</td>
			
		</tr>
		<tr>
			<td colspan="3">
				탭구현? , 상세내용
				<s:property value="resultClass.content" />
				<!-- img 가 null 인 경우는 어떻게 처리할 것인가 -->
				<img src="showcase/upload/<s:property value="resultClass.file_savname.split(',')[1]"/>" width="50" height="50" border="0">
				<img src="showcase/upload/<s:property value="resultClass.file_savname.split(',')[2]"/>" width="50" height="50" border="0">
				<img src="showcase/upload/<s:property value="resultClass.file_savname.split(',')[3]"/>" width="50" height="50" border="0">
			</td>
		</tr>
	</table>

</body>
</html>