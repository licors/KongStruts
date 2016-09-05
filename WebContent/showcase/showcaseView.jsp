<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

<title>전시 상세보기</title>
<script src="../js/jquery-1.1.3.1.pack.js" type="text/javascript"></script>
<script src="../js/jquery.history_remote.pack.js" type="text/javascript"></script>
<%-- <script src="../js/jquery.tabs.pack.js" type="text/javascript"></script> --%>
<%-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script> --%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRSeEVl3pSPGUVWwW4DSwZNDu0Q3AuSpc"></script>
<%-- <script src="../js/google_map.js" type="text/javascript"></script> --%>
<!-- <link rel="stylesheet" href="../js/jquery.tabs.css" type="text/css" media="print, projection, screen"> -->
<link rel="stylesheet" type="text/css" href="../css/index.css" />
<script type="text/javascript">
	$(function() {
		$('#detail-tab').tabs({
			fxSlide : true,
			fxFade : true,
			fxSpeed : 'normal'
		});
	});
	
	var map_x=37.498107;
	var map_y=127.030949;
	var map;

	function setLocation(x, y) {
		map_x = x;
		map_y = y;
	}
	
	function initialize() {
		var cairo = {lat: map_x, lng: map_y};
		var mapOptions = {
			zoom : 16,
			scaleControl: true,
			/* center: new google.maps.LatLng(35.87110100714382, 128.60169690333006) */
			center : cairo
		};
		map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
		
		var infowindow = new google.maps.InfoWindow;
		infowindow.setContent('<b>aaaa</b>');
		
		var marker = new google.maps.Marker({map: map, position: cairo});
		marker.addListener('click', function() {
		  infowindow.open(map, marker);
		});
	}

	function geocode(address1, address2) {
		var address = "";
		address = address1 + address2;
		alert(address);
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : address,
			'partialmatch' : true
		}, geocodeResult);
	}

	function geocodeResult(results, status) {
		//if( status == google.maps.GeocoderStatus.OK ) {
		if (status == 'OK' && results.length > 0) {
			//map.fitBounds(results[0].geometry.viewport);
			alert(results[0].geometry.location.lat());
			alert(results[0].geometry.location.lng());
		} else {
			alert("Geocode was not successful for the following reason: "
					+ status);
		}
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
	<table width="400">
		<tr>
			<th colspan="3"><b><s:property value="resultClass.subject" /></b></th>
		</tr>
		<tr>
			<td rowspan="6" align="center"><img
				src="<s:property value="img"/><s:property value="resultClass.file_savname.split(',')[0]"/>"
				width="120" height="150" border="1"></td>
			<td>주소</td>
			<td><s:property value="resultClass.address1" />&nbsp;<s:property
					value="resultClass.address2" /></td>
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
			<td>페이스북</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><s:property
					value="resultClass.content" /> ${content} <br> <!-- img 가 null 인 경우는 어떻게 처리할 것인가 -->

				<img
				src="<s:property value="img"/><s:property value="resultClass.file_savname.split(',')[1]"/>"
				width="200" height="150" border="0" /><br> <img
				src="<s:property value="img"/><s:property value="resultClass.file_savname.split(',')[2]"/>"
				width="200" height="150" border="0" /><br> <img
				src="<s:property value="img"/><s:property value="resultClass.file_savname.split(',')[3]"/>"
				width="200" height="150" border="0" /></td>
		</tr>
		<tr>
			 	<td colspan="3">
			 		<div id="map-canvas" style="height: 300px; width: 400px"></div>
			 	</td>
		</tr>
		<tr>
			<td colspan="3" align="right"><s:if
					test="memresultClass.admin > 0">
					<input name="support" type="button" value="수정"
						onClick="javascript:location.href = 'scmodify_form.action?showboard_num=<s:property value="%{resultClass.showboard_num}"/>'">
					<input name="support" type="button" value="삭제"
						onClick="javascript:location.href = 'scdelete_form.action?showboard_num=<s:property value="%{resultClass.showboard_num}"/>'">
				</s:if> <input name="basket" type="button" value="관심티켓"
				onClick="javascript:location.href = '/basket/addBasket.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
				<input name="order" type="button" value="신청하기"
				onClick="javascript:location.href = '/order/orderForm.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
				<input name="comment" type="button" value="댓글달기"
				onClick="javascript:location.href = '/comment/commentListAction.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
				<!-- <input name="basket" type="button" value="메인으로" onClick="javascript:location.href = '/showcase/sclist.action'"> -->
			</td>
		</tr>
	</table>
</body>
</html>