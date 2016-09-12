 
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" href="css/style.css" />
<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<script>
function dongCheck() {
	if (document.zipform.area3.value == "") {
		alert("동 이름을 입력하세요");
		document.zipform.area3.focus();
		return;
	}
	document.zipform.submit();
}

function sendAddress(zipcode, area1, area2, area3, area4) {
	var address = area1 + " " + area2 + " " + area3 + " " + area4;
	opener.document.joinform.zipcode.value = zipcode;
	opener.document.joinform.address.value = address;
	self.close();
}
</script>

	<table align="center">
		<form name="zipform" method="post" action="zipcodeF2.action">
			<tr>
				<td align="center"><br>동이름 입력 : <input name="area3" type="text">
					<input type="button" class="btn btn-success" value="검색" onclick="dongCheck();">
		
					</td>
			</tr>
			<input type="hidden" name="check" value="n">
		</form>
		<s:if test='%{check=="n"}'>
		<s:if test="%{zipcodeList.isEmpty()}">
			<tr>
				<td align="center"><br>검색된 결과가 없습니다</td>
			</tr>
		</s:if>
		</s:if>
		<tr>
			<td align="center"><br>검색 후, 우편번호 클릭하세요</td>
		</tr>
		<s:iterator value="%{zipcodeList}" status="stat">

			<tr>
				<td align="center">
				<a href="javascript:sendAddress('<s:property value="zipcode"/>',
				'<s:property value="area1"/>','<s:property value="area2"/>','<s:property value="area3"/>','<s:property value="area4"/>')">
						<s:property value="zipcode" />&nbsp;<s:property value="area1" />&nbsp;<s:property
							value="area2" />&nbsp;<s:property value="area3" />&nbsp;<s:property
							value="area4" />&nbsp;
				</a><br></td>
			</tr>
		</s:iterator>
		
		
		<tr>
			<td align="center"><br> <a href="javascript:this.close();">닫기</a></td>
		</tr> 
	</table>

	
		 
