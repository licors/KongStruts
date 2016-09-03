<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.HashMap" %>
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
        <script src="../js/jquery.tabs.pack.js" type="text/javascript"></script>
        <%-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script> --%>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRSeEVl3pSPGUVWwW4DSwZNDu0Q3AuSpc"></script> 
        <%-- <script src="../js/google_map.js" type="text/javascript"></script> --%>
        <link rel="stylesheet" href="../js/jquery.tabs.css" type="text/css" media="print, projection, screen">

        <script type="text/javascript">
            $(function () {
                $('#detail-tab').tabs({fxSlide: true, fxFade: true, fxSpeed: 'normal'});
            });

            var map;
            function initialize() {
                var mapOptions = {
                    zoom: 16,
                    center: new google.maps.LatLng(35.87110100714382, 128.60169690333006)
                };
                map = new google.maps.Map(document.getElementById('map-canvas'),
                        mapOptions);
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
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
                    <s:if test="memresultClass.admin > 0">
                        <input name="support" type="button" value="수정" onClick="javascript:location.href = 'scmodify_form.action?showboard_num=<s:property value="%{resultClass.showboard_num}"/>'">
                        <input name="support" type="button" value="삭제" onClick="javascript:location.href = 'scdelete_form.action?showboard_num=<s:property value="%{resultClass.showboard_num}"/>'">
                    </s:if>
                    <input name="basket" type="button" value="관심티켓" onClick="javascript:location.href = '/basket/addBasket.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
                    <input name="order" type="button" value="신청하기" onClick="javascript:location.href = '/order/orderForm.action?showboard_num=<s:property value="%{resultClass.showboard_num}" />'">
                </td>

            </tr>
            <tr>
                <td colspan="3">
                    <div id="detail-tab">
                        <ul>
                            <li><a href="#detail-showcase"><span>상세보기</span></a></li>
                            <li><a href="#detail-pay"><span>두번째</span></a></li>
                            <li><a href="#detail-map"><span>지도</span></a></li>
                            <li><a href="#detail-comment"><span>Comment</span></a></li>
                        </ul>
                        <div id="detail-showcase">
                        	
                            <s:property value="commentResultClass.content" />
                            ${content}

                            <!-- img 가 null 인 경우는 어떻게 처리할 것인가 -->
                            <img src="showcase/upload/<s:property value="resultClass.file_savname.split(',')[1]"/>" width="50" height="50" border="0">
                            <img src="showcase/upload/<s:property value="resultClass.file_savname.split(',')[2]"/>" width="50" height="50" border="0">
                            <img src="showcase/upload/<s:property value="resultClass.file_savname.split(',')[3]"/>" width="50" height="50" border="0"> 
                        </div>




                        <div id="detail-pay">
                            <iframe src="member/memberLoginForm.action" name="test" id="test" scrolling="auto" align="left">두번째탭</iframe>
                        </div>





                        <div id="detail-map">
                            <!-- <div id="map_view" style="width:500px; height:300px;"></div> -->
                            <div id="map-canvas" style="height:300px; width:500px"></div>
                        </div>





                        <div id="detail-comment">
                        	<iframe src="showcase/commentListAction.action" name="test" id="test" scrolling="auto" align="left">세번째탭</iframe>
                            <!-- 코멘트 입력 폼 -->
                            <%-- <form name="commentForm" action="/showcase/commentWriteAction.action" method="post" onsubmit="return validation();">
                                <s:hidden name="showboard_num" value="%{showboard_num}" />
								<s:hidden name="member_num" value="%{member_num}" />

                                <table width="600" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="right" colspan="2"><font color="#FF0000">*</font> 는 필수 입력사항</td>
                                    </tr>
                                    <tr bgcolor="#777777">
                                        <td height="1" colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>내용</td>
                                        <td bgcolor="#FFFFFF">
                                            <s:textarea name="content" value="%{CommentResultClass.content}" cols="50" rows="10"></s:textarea>
                                            </td>
                                        </tr>
                                        <tr bgcolor="#777777">
                                            <td height="1" colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td height="10" colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <input name="submit" type="submit" value="댓글입력" class="inputb">
                                            </td>
                                        </tr>	
                                    </table>
                                </form>

                                <!-- 코멘트 리스트 -->
                                <table width="600" border="0" cellspacing="0" cellpadding="2">
                                    <tr align="center" bgcolor="#f3f3f3">
                                        <td width="350"><strong>내용</strong></td>
                                        <td width="70"><strong>글쓴이</strong></td>
                                        <td width="80"><strong>날짜</strong></td>
                                    </tr>

                                    <tr bgcolor="#777777">
                                        <td height="1" colspan="5"></td>
                                    </tr>

                                <s:iterator value="list" status="stat">
                                    <s:url id="viewURL" action="viewAction">
                                        <s:param name="no">
                                            <s:property value="no" />
                                        </s:param>
                                        <s:param name="currentPage">
                                            <s:property value="currentPage" />
                                        </s:param>
                                    </s:url>

                                    <tr>
                                        <td align="left">
                                            <s:if test="re_level != 0"> 
                                                <c:forEach var = "i" begin = "${re_level}" end = "0">&nbsp;</c:forEach>→
                                            </s:if>	
                                            <s:property value="content" />
                                        </td>
                                        <td><s:property value="name" /></td>
                                        <td><s:property value="reg_date" /></td>
                                    </tr>

                                    <tr bgcolor="#777777">
                                        <td height="1" colspan="5"></td>
                                    </tr>

                                </s:iterator>

                                <s:if test="list.size() <= 0">
                                    <tr>
                                        <td colspan="5" align="center">등록된 게시물이 없습니다</td>
                                    </tr>
                                </s:if>

                                <tr align="center">
                                    <td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
                                </tr> --%>
                        </div>
                    </div>
                </td>
            </tr>
        </table>



        <%-- <tr align="right">
                <td colspan="5">
                        <input type="button" value="글쓰기" class="inputb" onclick="javascript:location.href='writeForm.action?currentPage=<s:property value="currentPage" />';" />
                </td>
        </tr> --%>

    </table>

</body>
</html>