<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<!--<style type="text/css">

</style>-->
<!--<link href="./css/style.css" rel="stylesheet" type="text/css" />-->
        <script type="text/javascript" src="/js/bootstrap.min.js"></script> <!-- 메인 드랍다운용 -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script> <!-- 메인 드랍다운용 -->
<script>
function showcaseView(url) {
	window.open(url, "post", "toolbar=no, width=600, height=600 ,directories=no, status=no, scrollbars=yes, menubar=no, location=no, resizable=no");
	}
</script>
</head>
<body>

<%-- <br/><br/>
<table width="700" style="border:0; padding:0; margin:auto;">
		<tr height="30">
			<td align="center" style="">
				<!-- <img src="images/goods/all.jpg"></img> -->
				<h1>전시</h1>
				                <td align="right" colspan="5">

			</td>
		</tr>
	</table>
	
	
	<br/>
	<table width="700" style="border:0; padding:0; margin:auto;">
		<s:iterator value="list1" status="stat">
				<s:url id="viewURL" action="scread">
			<s:param name="showboard_num">
				<s:property value="showboard_num" />
			</s:param>
			   <s:param name="currentPage">
   <s:property value="currentPage"/>
   </s:param>
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
</table> --%>









<div style="width:100%; background-color:#FFF; padding:0px 20px 20px 20px;">
        <div id="ContentPanel"></div>
        <section class="content-wrapper main-content clear-fix">

<!-- <noscript>
    &lt;img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=268494990193919&amp;ev=PageView&amp;noscript=1" /&gt;
</noscript> -->
<!-- End Facebook Pixel Code -->

<div class="cgt-latest-wrap clearfix">
        <div style="margin:1px auto;padding-top: 48px; clear: both; max-width: 1200px; ">
            <div style="float:left;font-size:20px;font-weight:bold;">
                <div style="box-sizing: border-box; font-size:16px;">
                    <span style="font-size:18px; font-weight:normal;"><img src="/template/image/main/title_main_display.jpg"></span>
                </div>
            </div>
            <div style="float:right;">
                <div class="boxes">
                    <div class="box box1" style="cursor:pointer;">
                        <a href="/Event/1"><img src="/template/image/main/more.jpg" style="margin-top:7px;"></a>
                    </div>
                </div>
            </div>
            <div style="clear:both;"></div>
            <div style="height:0px;margin-top:24px;"></div>
        </div>
        <div class="clearfix"></div>
            <div class="cgt-latest cgt-list-ctype-1">
                <div style="position:absolute; width:100%; z-index:100;">
                    <div style="float:right; width:40px; height:40px; border-radius:20px; background-color:#EB009F; color:#FFF; text-align:center; font-weight:bold; line-height:40px; margin:10px 10px 0px 0px;">개최중</div>
                    <div style="clear:both;"></div>
                </div>
                <div class="cgt_latest_image_area">
                    <img src="https://www.cangoto.kr/Resource/Poster/po(58).jpg" class="img-responsive">
                </div><!-- img -->
                <div class="cgt_list_mask" style="width: 284px; height: 295px;"></div>
                <div class="cgt_list_button">
                    <a class="btn-detail cgt-single-load" href="/Event/1/3732/2016-%EA%B5%AD%EC%A0%9C%EC%9E%90%EB%8F%99%ED%99%94%EC%A0%95%EB%B0%80%EA%B8%B0%EA%B8%B0%EC%A0%84"><img alt="상세보기" src="/content/img/view_small_btn.png"></a>
                            <a id="link" href="#" onclick="return fnConfirmMoveUrl('로그인을 하셔야 이용하실수 있습니다.\n로그인 페이지로 이동하시겠습니까??', '/Account/Login');" class="ctype-1 btn-application">
                                <img src="/content/img/application_small_btn.png" alt="">
                            </a>
                </div>
                <!-- over layer -->
                <div class="cgt_list_explanation">
                    <div class="subject">2016 국제자동화정밀기기전</div><!-- title -->
                    <div class="schedule">09.06(화)~09.09(금) / 4일간</div><!-- date -->
                    <div class="place_price">
                        <div class="place">고양 킨텍스</div>
                        <div style="width:30px; height:2px; background-color:#F470C9; margin:20px 0px 10px 0px;"></div>
                        <div class="price">무료</div>
                    </div>
                </div><!-- contents-->
                <!-- social -->
                <div class="cgt_list_count clearfix" style="font-size: 12px; color: #666;">
                    <div><img src="/content/img/icon_apply.jpg" class="application_icon">1,998</div><!-- applie -->
                    <div style="margin-right:10px;"><img src="/content/img/icon_eye.jpg" class="view_icon"> 20,442</div><!-- views -->
                </div>
            </div>
            
            
           <%--  전체 감싸주는 </section> </div> --%>
       </section>
    </div>
    
    
<!--             <div class="cgt-latest cgt-list-ctype-1">
                <div style="position:absolute; width:100%; z-index:100;">
                    <div style="float:right; width:40px; height:40px; border-radius:20px; background-color:#EB009F; color:#FFF; text-align:center; font-weight:bold; line-height:40px; margin:10px 10px 0px 0px;">개최중</div>
                    <div style="clear:both;"></div>
                </div>
                <div class="cgt_latest_image_area">
                    <img src="http://www.cangoto.kr/Resource/AppTemp/thumbs/3dd48b7b-a3f7-46a7-9283-d7f77dca662d.png" class="img-responsive">
                </div>img
                <div class="cgt_list_mask" style="width: 284px; height: 295px; opacity: 0;"></div>
                <div class="cgt_list_button">
                    <a class="btn-detail cgt-single-load" href="/Event/1/3871/2016-%EC%84%B8%EA%B3%84%ED%83%9C%EC%96%91%EC%97%90%EB%84%88%EC%A7%80-%EC%97%91%EC%8A%A4%ED%8F%AC" style="left: -38px; opacity: 0;"><img alt="상세보기" src="/content/img/view_small_btn.png"></a>
                            <a id="link" href="#" onclick="return fnConfirmMoveUrl('로그인을 하셔야 이용하실수 있습니다.\n로그인 페이지로 이동하시겠습니까??', '/Account/Login');" class="ctype-1 btn-application" style="right: -38px; opacity: 0;">
                                <img src="/content/img/application_small_btn.png" alt="">
                            </a>
                </div>
                over layer
                <div class="cgt_list_explanation">
                    <div class="subject">2016 세계태양에너지 엑스포</div>title
                    <div class="schedule">09.07(수)~09.09(금) / 3일간</div>date
                    <div class="place_price">
                        <div class="place">고양 킨텍스</div>
                        <div style="width:30px; height:2px; background-color:#F470C9; margin:20px 0px 10px 0px;"></div>
                        <div class="price">마감</div>
                    </div>
                </div>contents
                social
                <div class="cgt_list_count clearfix" style="font-size: 12px; color: rgb(102, 102, 102);">
                    <div><img src="/Content/img/icon_apply.jpg" class="application_icon">1,555</div>applie
                    <div style="margin-right:10px;"><img src="/Content/img/icon_eye.jpg" class="view_icon"> 29,369</div>views
                </div>
            </div> -->
            









<%--                     <s:if test="memresultClass.admin > 0"><!-- 어드민 qna 작성 -->
                        <input name="support" type="button" style="float:right;" value="전시글 작성"
                               onClick="javascript:location.href = '/showcase/scwrite_form.action'">
                    </s:if> --%>

<!-- 리스트1(전시) 출력 -->
<br/><br/>
<table width="700" style="border:0; padding:0; margin:auto;">
		<tr height="30">
			<td align="center" style="">
				<!-- <img src="images/goods/all.jpg"></img> -->
				<h1>전시</h1>
				                <td align="right" colspan="5">

			</td>
		</tr>
	</table>
	
	
	<br/>
	<table width="700" style="border:0; padding:0; margin:auto;">
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
<table width="700" style="border:0; padding:0; margin:auto;">
		<tr height="30">
			<td align="center" style="">
				<img src="images/goods/all.jpg"></img>
			</td>
		</tr>
	</table>
	
	<br/>
	<table width="700" style="border:0; padding:0; margin:auto;">
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
<table width="700" style="border:0; padding:0; margin:auto;">
		<tr height="30">
			<td align="center" style="">
				<img src="images/goods/all.jpg"></img>
			</td>
		</tr>
	</table>
	<br/>
	<table width="700" style="border:0; padding:0; margin:auto;">
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