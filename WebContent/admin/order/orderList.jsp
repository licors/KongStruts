<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>관리자용 티켓 신청 리스트</title>
<!--<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
    $(function() {
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });

</script>
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
 		if (confirm("신청을 취소하시겠습니까?")) {
 			location.href("/order/adminOrderCancel.action?order_num="+num);
		} else {
			alert("취소되었습니다");
			return false;
		}
 	}
 	function change() {
 		var num = document.orderList.searchNum.value;
 		
	 	if(num == 2) {
	 		//신청날짜 선택했을 때
	 		return 2;
	 	}
	 	if(num == 3) {
	 		//신청상태 선택했을 때
	 		return 3;	 		
	 	}
	 	return num;
 	}
</script>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-2thk {
	background-color: #c0c0c0;
	text-align: center
}

.tg .tg-j4kc {
	background-color: #efefef;
	text-align: center
}
</style>

</head>
<body>
	<tr height="20"></tr>
	<form name="orderList" method="post"
		action="/order/adminOrderSearch.action">
		<table width="100%" align="center" class="tg">
			<tr>
				<td colspan="9" align="center">
					<h1>관리자용 신청 내역 페이지</h1>
				</td>
			</tr>
			<tr>
				<th class="tg-2thk" colspan="5">신청 정보</th>
				<th class="tg-2thk" colspan="4">신청자 정보</th>
			</tr>
			<tr>
				<td class="tg-j4kc">신청번호</td>
				<td class="tg-j4kc">신청일자</td>
				<td class="tg-j4kc">신청 전시회</td>
				<td class="tg-j4kc">바코드</td>
				<td class="tg-j4kc">신청 상태</td>
				<td class="tg-j4kc">회원번호</td>
				<td class="tg-j4kc">E-mail( ID )</td>
				<td class="tg-j4kc">성명</td>
				<td class="tg-j4kc">연락처</td>
			</tr>

			<s:iterator value="orderList" status="stat">
				<tr>
					<td class="tg-yw4l" width="30" align="center"><b>${order_num}</b></td>
					<td class="tg-yw4l" width="90" align="center"><fmt:formatDate
							value="${order_date }" pattern="yyyy-MM-dd hh:mm" /></td>
					<td class="tg-yw4l">${showboard_num} ) <a
						href="/order/orderView.action?order_num=${order_num}&currentPage=${currentPage }">
							${subject } </a></td>

					<s:if test='%{status == "티켓 신청" }'>
						<td class="tg-yw4l" align="center" width="150"><img
							src="../barcodeImg/${barcode}.png" style="cursor: pointer;"
							onclick="doImgPop('../barcodeImg/${barcode}.png')" width="150" /></td>
						<td class="tg-yw4l" align="center" width="65">${status }<br>
							<input type="button" name="status" value="취소하기"
							onclick="return deletecheck(${order_num})">
						</td>
					</s:if>
					<s:else>
						<td class="tg-yw4l" width="150">-</td>
						<td class="tg-yw4l" align="center" width="65">${status }</td>
					</s:else>

					<td class="tg-yw4l" align="center" width="30"><b>${member_num}</b></td>
					<td class="tg-yw4l">${email}</td>
					<td class="tg-yw4l" align="center" width="80">${name}</td>
					<td class="tg-yw4l" align="center">${tel}</td>
				</tr>
			</s:iterator>

			<s:if test="orderList.size() == 0">
				<tr>
					<td colspan="9" align="center"><font size="2"> 신청된 전시가
							없습니다.</font></td>
				</tr>
			</s:if>

			<tr>
				<td colspan="9" align="center"><s:property value="pagingHtml"
						escape="false" /></td>
			</tr>
			<tr align="center">
				<td colspan="9">
				<select name="searchNum">
						<option value="0">신청자ID(E-mail)</option>
						<option value="1">전시회명</option>
						<option value="2">신청상태</option>
				</select>
				<input class="searchk" type="text" name="searchKeyword" size="15"
					maxlength="20" /> 				
				<p>조회기간:
    <input type="text" id="datepicker1" name="datepicker1"> ~
    <input type="text" id="datepicker2" name="datepicker2">
</p>
				<input class="click" name="search" type="submit" value="검색" />
				</td>
				
			</tr>
			
		</table>
	</form>
	
</body>
</html>