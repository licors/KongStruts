<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주 문 성 공</title>
</head>
<body>
	<center>
		<tr>
			<td bgcolor="white" height="50" align="center" width="170"
				colspan="2">
				<h3>
					신청이 <font color="red"><b>완료</b></font>되었습니다.
				</h3>
				<br>
			</td>
		</tr>
		<table width="400" cellpadding="7" cellspacing="2"
			bordercolordark="white" bordercolorlight="white" bgcolor="#E1E1E1"
			style="margin: 20px 0 0 0;">
			<tbody align="center">
				<b> 전시회에 입장하실 때 바코드를 제시해 주세요. </b><br>
				바코드는 신청내역에서 확인하실 수 있습니다.<br><br>

				<tr>
					<td bgcolor="white" height="30" align="center" width="150"
						colspan="2"><input type="button" value="구매목록"
						onclick="javascript:location.href='/order/orderList.action?currentPage=1'">
					 &nbsp;&nbsp;&nbsp;
					<input type="button" value="메인으로"
						onclick="javascript:location.href='/showcase/sclist.action'">
					</td>

					<!-- 수정 : 메인으로가기
							<td bgcolor="white" height="30" align="center" width="150" colspan="2">
							<a href="/order/main.action?currentPage=1"> 구매목록  </a>
							</td>		
								 -->
				</tr>
				<tr>
					5초후에 메인으로 이동합니다.
					<meta http-equiv="Refresh" content="5;url=/showcase/sclist.action">
				</tr>
			</tbody>
		</table>
	</center>
</body>
</html>