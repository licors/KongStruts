<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function doImgPop(img){ 
	 img1= new Image(); 
	 img1.src=(img); 
	 imgControll(img); 
	} 
	  
	function imgControll(img){ 
	 if((img1.width!=0)&&(img1.height!=0)){ 
	    viewImage(img); 
	  } 
	  else{ 
	     controller="imgControll('"+img+"')"; 
	     intervalID=setTimeout(controller,20); 
	  } 
	}
	function viewImage(img){ 
	 W=img1.width; 
	 H=img1.height; 
	 O="width="+W+",height="+H+",scrollbars=yes"; 
	 imgWin=window.open("","",O); 
	 imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
	 imgWin.document.write("<body topmargin=0 leftmargin=0>");
	 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	 imgWin.document.close();
	}
 	function deletecheck(num) {
 		if (confirm("주문을 취소하시겠습니까?")) {
 			location.href("/order/orderCancel.action?order_num="+num);
		} else {
			alert("취소되었습니다");
			return false;
		}
 	}
</script>
</head>
<body>
	<tr height="20"></tr>
	<form name="orderList" method="post">
		<table width="700" align="center">
			<tr>
				<td colspan="6" align="center">
					<h1>주문 내역 페이지</h1>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<hr>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF" align="center">
				<td align="center">사진</td>
				<td align="center">신청일자</td>
				<td align="center" colspan="2">티켓 정보</td>
				<td align="center">바코드</td>
				<td align="center" width="100">상태</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<hr>
				</td>
			</tr>

			<s:iterator value="orderList" status="stat">
				<tr height="80">
					<td>
						<img src="">
					</td>
					<td width="90" align="center">
						<fmt:formatDate value="${order_date }" pattern="yyyy-MM-dd hh:mm" /></td>
					<td colspan="2" align="center">
						<table width="100%" border="0" cellspacing="0" cellpadding="2">
							<tbody>
							<tr height="23">
								<td width="30" align="right"><b>전시명:</b> </td>
								<td width="110" align="center"><a
						href="/order/orderView.action?order_num=${order_num}&currentPage=${currentPage }">
							${subject } </a></td>
							</tr>
							<tr height="23">
								<td width="70" align="right">전시일정:</td>
								<td align="center"> ${date }</td>
							</tr>
							<tr height="23">
								<td width="70" align="right">전시장소:</td>
								<td align="center"> ${address2 }</td>
							</tr>
							</tbody>
						</table>
					</td>
					<s:if test='%{status == "티켓 신청" }'>
					<td width="80" height="30" align="center">
						<img src="../barcodeImg/${barcode}.png" style="cursor: pointer;" 
							onclick="doImgPop('../barcodeImg/${barcode}.png')" width="100"/>
					</td>
					<td align="center" width="100">
						<table>
							<tbody>
						<tr>
							<td>${status }</td>
						</tr>
						<tr>
							<td>							
								<input type="button" name="status" value="취소하기" onclick="return deletecheck(${order_num})">
							</td>
						</tr>
						</tbody>
						</table>
					</td>
					</s:if>
					<s:else>
					<td width="80" height="30" align="center">-</td>
					<td align="center" width="100">${status }</td>
					</s:else>
				</tr>
					
			</s:iterator>
			
			<s:if test="orderList.size() == 0">
				<tr>
					<td colspan="6" align="center"><font size="2">
					신청하신 전시회가 없습니다.</font></td>
				</tr>
			</s:if>
			
			<tr>
				<td colspan="6" align="center">
					<hr>
				</td>
			</tr>
			
			<tr>
				<td colspan="6" align="center">
					<s:property value="pagingHtml" escape="false" />
				</td>
			</tr>

		</table>
	</form>
</body>
</html>