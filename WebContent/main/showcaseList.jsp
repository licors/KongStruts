<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.HashMap"%>

<script type="text/javascript">
    function goodsdelete(showboard_num) {
        document.goodsform.action = "/showcase/scdelete_form.action?showboard_num="
                + showboard_num;
        document.goodsform.submit();
    }
    function goodsmodify(showboard_num) {
        document.goodsform.action = "/showcase/scmodify_form.action?showboard_num="
                + showboard_num;
        document.goodsform.submit();
    }
</script>

<!-- ############################## 카테고리별 list 출력(display, art, event) ############################## -->
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
                        <span style="font-size:18px; font-weight:normal;">

                            <!-- <img src="/template/image/main/title_main_display.jpg"> -->
                            <s:if test="showboard_category.equals(\"전시\")">
                                <img src="/template/image/main/title_main_display.jpg"></img>
                            </s:if> <s:else>
                                <s:if test="showboard_category.equals(\"미술\")">
                                    <img src="/template/image/main/title_main_art.jpg"></img>
                                </s:if>
                                <s:if test="showboard_category.equals(\"이벤트\")">
                                    <img src="/template/image/main/title_main_event.jpg"></img>
                                </s:if>
                            </s:else>

                        </span>
                    </div>
                </div>
                <div style="float:right;">
                    <div class="boxes">
                        <div class="box box1" style="cursor:pointer;">
                            <a></a>
                        </div>
                    </div>
                </div>
                <div style="clear:both;"></div>
                <div style="height:0px;margin-top:24px;"></div>
            </div>

            <div class="clearfix"></div>
            <!-- 검색 출력 결과 부분 시작-->
            <s:if test="list.size() <= 0"><!-- 글자체가 아예 아무것도 없을때 -->
                <s:if test="!search"><!-- 검색 시도시가 아니면 -->
                    <span style="color:#00b9ff; font-weight:bold;">등록된 게시물이 없습니다</span>
                </s:if>
                <s:else><!-- 검색 시도시일때 -->
                    <span style="color:#00b9ff; font-weight:bold;">검색 결과가 없습니다</span>
                </s:else>
            </s:if>
            <s:elseif test="searchKeyword == \"\""> <!-- 검색결과가 있을때 -->
                <span style="color:#00b9ff; font-weight:bold;">"<s:property value="searchKeyword"/>"</span>의 검색결과입니다.
            </s:elseif>
            <!-- 검색 출력 결과 부분 종료-->
            <br>
            <s:iterator value="list" status="stat">
                <s:url id="viewURL" action="scread">
                    <s:param name="showboard_num">
                        <s:property value="showboard_num" />
                    </s:param>
                </s:url>
                
            <div class="cgt-latest cgt-list-ctype-1">
                <div style="position:absolute; width:100%; z-index:100;">
                    <div style="float:right; width:40px; height:40px; border-radius:20px;  color:#FFF; text-align:center; font-weight:bold; line-height:40px; margin:10px 10px 0px 0px;"></div>
                    <div style="clear:both;"></div>
                </div>
                <a href ='/showcase/scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'target="_blank">
                    <!-- <img src="https://www.cangoto.kr/Resource/Poster/po(58).jpg" class="img-responsive"> -->
                    <img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>" class="img-responsive"
                        onerror="javascript:this.src='/template/image/main/noimg.png'"></></a>
                <!-- img -->
                
                
                    <!-- over layer -->
                    <div class="cgt_list_explanation">
                        <!-- <div class="subject">2016 국제자동화정밀기기전</div> --><!-- title -->
                    <a href ='/showcase/scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'target="_blank">
                    <div class="subject"><s:property value="subject"/></a></div><!-- title -->
                    <!-- <div class="schedule">09.06(화)~09.09(금) / 4일간</div> --><!-- date -->
                        <!-- <div class="schedule">09.06(화)~09.09(금) / 4일간</div> --><!-- date -->
                        <div class="schedule"><s:property value="date"/></div><!-- date -->
                        <div class="place_price">
                            <!-- <div class="place">고양 킨텍스</div> -->
                            <div class="place"><s:property value="address2"/></div>
                            <div style="width:30px; height:2px; background-color:#F470C9; margin:20px 0px 10px 0px;"></div>
                            <!-- <div class="price">무료</div> -->
                            <div class="price"><s:if test="pay == 0">무료</s:if><s:else><s:property value="pay"/>원</s:else></div>
                            </div>
                        </div><!-- contents-->
                        <!-- social -->
                        <div class="cgt_list_count clearfix" style="font-size: 12px; color: #666;">
                                <div><img src="/template/image/main/icon_apply.jpg" class="application_icon"><s:property value="ordercount"/></div><!-- applie -->
                        <div style="margin-right:10px;"><img src="/template/image/main/icon_eye.jpg" class="view_icon"><s:property value="readcount"/></div><!-- views -->
                    </div>
                </div>
            </s:iterator>
    </section>
</div>






<%--  <table width="700" style="border:0; padding:0; margin:auto;">
        <tr height="30">
                <td align="center" style="">
                <s:if test="showboard_category==null">
                                <img src="images/goods/all.jpg"></img>
                        </s:if> <s:else>
                                <s:if test="showboard_category.equals(\"전시\")">
                                        <img src="images/goods/outer.jpg"></img>
                                </s:if>
                                <s:if test="showboard_category.equals(\"미술\")">
                                        <img src="images/goods/top.jpg"></img>
                                </s:if>
                                <s:if test="showboard_category.equals(\"이벤트\")">
                                        <img src="images/goods/dress.jpg"></img>
                                </s:if>
                                <s:property value="showboard_category" />
                        </s:else></td>
        </tr>
</table>

<table width="700" style="border:0; padding:0; margin:auto;">
        <s:iterator value="list" status="stat">
                <s:url id="viewURL" action="scread">
                        <s:param name="showboard_num">
                                <s:property value="showboard_num" />
                        </s:param>
                           <s:param name="currentPage">
   <s:property value="currentPage"/>
   </s:param>
                </s:url>
                <s:if test="#stat.index % 3 eq 0"></s:if>
                <s:if test="#stat.index % 4 eq 0">
                        <tr></tr>
                </s:if>
                <td width="230" align="center"><a href ='scread.action?showboard_category=<s:property value="showboard_category"/>&goods_num=<s:property value="goods_num"/>&currentPage=<s:property value="currentPage"/>'>
                        <img src="./goods/upload/<s:property value="goods_savimage.split(',')[0]"/>" width="200px" height="250px"/></a>
                        <a href='scread.action?showboard_category=<s:property value="showboard_category"/>&showboard_num=<s:property value="showboard_num"/>'target="_blank">
                                <img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
                                width="200px" height="250px" onerror="javascript:this.src='/template/image/main/noimg.png'"></>
                </a> <br>
                <br> <s:property value="subject" /> <br>
                <s:property value="date" /> <br>
                <s:property value="address2" /> <br>
                <br> <s:if test="pay == 0">무료</s:if>
                        <s:else>
                                <s:property value="pay" />원</s:else> <br>
                <br>
                <br>
        </s:iterator>
        <tr>
                <td colspan="3" align="center">
                        <!-- <img src="images/goods/line_top.png"></img> -->
                </td>
        </tr>
        <s:if test="list.size() <= 0">
                <tr>
                        <td colspan="5" align="center">등록된 게시물이 없습니다</td>
                </tr>
        </s:if>
        <tr align="center">
                <td colspan="5">
                        <s:property value="pagingHtml" escape="false"/></td>
        </tr>
        </form>
        </td>
        </tr>
</table> --%>