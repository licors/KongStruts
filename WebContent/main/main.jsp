<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<style type="text/css">
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
<script>
function showcaseView(url) {
	window.open(url, "post", "toolbar=no, width=600, height=600 ,directories=no, status=no, scrollbars=yes, menubar=no, location=no, resizable=no");
	}
<%-- <script src="./js/desSlideshow.js"></script>
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
    }); --%>
    
</script>
</head>
<body>
<%-- <div id="desSlideshow1" class="desSlideshow">
	<div class="switchBigPic">
		<div>
                    <a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main00.jpg" /></a>
                    <p><strong>스프링리넨자켓</strong><br/>
                        내일이면 sold out!
                    </p>
      </div>
		<div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main01.jpg" /></a>
			<p><strong>스프링리넨자켓</strong><br/>
                        전지현씨가 방금 입어보기만 했어요~ 구매하지는 않았어요!
                    </p>
      </div>
		<div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main02.jpg" /></a>
                    <p><strong>제이롱블라우스</strong><br/>
                        사장님이 미쳤어요! 헐값에 처분!
                    </p>
      </div>
		<div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main03.jpg" /></a>
                    <p><strong>제이블라우스</strong><br/>
                        패션리더는 바로 당신 ! 아직 죽지않은 모습 보여주세요 !
                    </p>
      </div>
      <div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main04.jpg" /></a>
                    <p><strong>오프닝연청데님</strong><br/>
                        싼가격에 팔고 오늘 사표 내겠습니다.
                    </p>
      </div>
      <div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main05.jpg" /></a>
                    <p><strong>374 컷 데님</strong><br/>
                        방금 이미자 선생님께서 입으신다고 구매하셨습니다.
                    </p>
      </div>
      <div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main06.jpg" /></a>
                    <p><strong>이지 머메이드 스커트</strong><br/>
                        이거 입으면 송중기씨가 반한다는 신상품!!
                    </p>
      </div>
      <div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main07.jpg" /></a>
                    <p><strong>슬림 H 스커트</strong><br/>
                        내일 지진나면 구입못해요 ! 지금당장 사십시요 !
                    </p>
      </div>
      <div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main08.jpg" /></a>
                    <p><strong>에스닉요루원피스</strong><br/>
                        오빠 나 꿍꼬또 신상 봄옷 사는 꿍꼬도!!!
                    </p>
      </div>
            <div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main09.jpg" /></a>
                    <p><strong>니트 플리츠 원피스</strong><br/>
                        오다 주워서 판매중 껌값!!
                    </p>
      </div>
            <div><a title="" href="#"><img class="pic" width="900" height="550" src="./img/goods/main10.jpg" /></a>
                    <p><strong>이자벨 스터드 샌들</strong><br/>
                        캬~~ 봄신상신상 넘나 이쁜것
                    </p>
      </div>
  </div>
	<ul class="nav">
		<li><a href="#">스프링리넨자켓</a></li>
  		<li><a href="#">꽈베기 롱 가디건</a></li>
  		<li><a href="#">제이롱블라우스</a></li>
  		<li><a href="#">제이블라우스</a></li>
  		<li><a href="#">오프닝연청데님</a></li>
  		<li><a href="#">374 컷 데님</a></li>
  		<li><a href="#">이지 머메이드 스커트</a></li>
  		<li><a href="#">슬림 H 스커트</a></li>
  		<li><a href="#">에스닉요루원피스</a></li>
  		<li><a href="#">니트 플리츠 원피스</a></li>
  		<li><a href="#">이자벨 스터드 샌들</a></li>
	</ul>
</div> --%>

                    <s:if test="memresultClass.admin > 0" /><!-- 어드민 qna 작성 -->
                        <input name="support" type="button" value="전시글 작성"
                               onClick="javascript:location.href = '/showcase/scwrite_form.action'">
<!-- 리스트1(전시) 출력 -->
<br/><br/>
<table width="700" align="left" border="0">
		<tr height="30">
			<td align="center" style="">
				<img src="images/goods/all.jpg"></img>
				                <td align="right" colspan="5">

			</td>
		</tr>
	</table>
	
	
	<br/>
	<table width="700" align="center" border="0">
		<s:iterator value="list1" status="stat">
<s:if test="#stat.index % 4 eq 0"><tr></tr></s:if>
<td width="230" align="center">
<a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'>
			<img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>" width="200px" height="250px"/></a>
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
<a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'>
			<img src="../showcaseImg/<s:property value="img"/><s:property value="file_savname.split(',')[0]"/>" width="200px" height="250px"/></a>
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
<a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'>
			<img src="../showcaseImg/<s:property value="img"/><s:property value="file_savname.split(',')[0]"/>" width="200px" height="250px"/></a>
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