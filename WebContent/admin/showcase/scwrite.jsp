<%-- 
 Document: scwrite
 Created on : 2016. 8. 25, 오후 6:51:53
 Author  : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>전시글 쓰기</title>
        <script type="text/javascript">
            function check() {
                var frm = document.sc;

                if (frm.subject.value == "") {
                    alert("전시명을 입력해주세요.");
                    return false;
                } else if (frm.showboard_category.value == "") {
                    alert("카테고리를 선택해주세요.");
                    return false;
                } else if (frm.address1.value == "") {
                    alert("시/도 구분을 선택해주세요.");
                    return false;
                } else if (frm.address1.value == "" || frm.address2.value == "") {
                    alert("전시 장소를 입력해주세요.");
                    return false;
                } else if (frm.pay.value == "") {
                    alert("입장료를 입력해주세요.");
                    return false;
                } else if (frm.tel.value == "") {
                    alert("문의전화번호를 입력해주세요.");
                    return false;
                } else if (frm.content.value == "") {
                    alert("내용을 입력해주세요.");
                    return false;
                } else if (frm.map.value == "") {
                    alert("지도위치를 입력해주세요.");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="container" style="width: 600px; max-width: none !important;"> <!-- 여기 선언해서 고정폭사용 -->
            <div class="panel panel-default"> <!-- 위쪽 제목 -->
                <div class="panel-heading">글작성하기</div>
                <div class="panel-body"> <!-- 본문 -->
                    <s:if test="rc == null">
                        <form name="sc" action="/showcase/scwrite.action" method="post" enctype="multipart/form-data" onsubmit="return check()" class="form-control-static">
                        </s:if>
                        <s:else>
                            <form name="sc" action="/showcase/scmodify.action" method="post" enctype="multipart/form-data" onsubmit="return check()" class="form-control-static">
                                <s:hidden name="showboard_num" value="%{rc.showboard_num}"/>
                            </s:else>
                            <table align="center" class="table-condensed">
                                <tr>
                                    <td align="right" colspan="2">
                                        <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="subject"><font color="#FF0000">&nbsp;&nbsp;*</font>전시명</label></td>
                                    <td>
                                        <input class="form-control" type="text" name="subject" value="<s:property value="rc.subject"/>" size="30" maxlength="50"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="showboard_category"><font color="#FF0000">&nbsp;&nbsp;*</font>카테고리</label></td>
                                    <td>
                                        <s:if test="rc == null">
                                            <select name="showboard_category" size="1" class="form-control">
                                                <option value="">카테고리</option>
                                                <option value="전시">전시</option>
                                                <option value="미술">미술</option>
                                                <option value="이벤트">이벤트</option>
                                            </select>
                                        </s:if>
                                        <s:else>
                                            <select name="showboard_category" size="1" class="form-control">
                                                <option value="<s:property value="rc.showboard_category"/>"><s:property value="rc.showboard_category"/></option>
                                            </select>
                                        </s:else>

                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="address1"><font color="#FF0000">&nbsp;&nbsp;*</font>장소</label></td>
                                    <td>
                                        <select name="address1" size="1" class="form-control">
                                            <option value="">시/도</option>
                                            <option value="서울특별시">서울특별시</option>
                                            <option value="부산광역시">부산광역시</option>
                                            <option value="대구광역시">대구광역시</option>
                                            <option value="인천광역시">인천광역시</option>
                                            <option value="광주광역시">광주광역시</option>
                                            <option value="대전광역시">대전광역시</option>
                                            <option value="울산광역시">울산광역시</option>
                                            <option value="세종특별자치시">세종특별자치시</option>
                                            <option value="경기도">경기도</option>
                                            <option value="강원도">강원도</option>
                                            <option value="충청북도">충청북도</option>
                                            <option value="충청남도">충청남도</option>
                                            <option value="전라북도">전라북도</option>
                                            <option value="전라남도">전라남도</option>
                                            <option value="경상북도">경상북도</option>
                                            <option value="경상남도">경상남도</option>
                                            <option value="제주특별자치도">제주특별자치도</option>
                                        </select>
                                        <input class="form-control" type="text" name="address2" value="<s:property value="rc.address2"/>" size="30" maxlength="100" placeholder="나머지"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="date"><font color="#FF0000">&nbsp;&nbsp;*</font>일정</label></td>
                                    <td>
                                        <input class="form-control" type="text" name="date" value="<s:property value="rc.date"/>" size="20" maxlength="25"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="pay"><font color="#FF0000">&nbsp;&nbsp;*</font>입장료</label></td>
                                    <td>
                                        <input class="form-control" type="text" name="pay" value="<s:property value="rc.pay"/>" size="10" maxlength="7"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="tel"><font color="#FF0000">&nbsp;&nbsp;*</font>문의전화</label></td>
                                    <td>
                                        <input class="form-control" type="text" name="tel" value="<s:property value="rc.tel"/>" size="20" maxlength="15"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="tag">&nbsp;&nbsp;&nbsp;태그</label></td>
                                    <td>
                                        <input class="form-control" type="text" name="tag" value="<s:property value="rc.tag"/>" size="20" maxlength="50"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="content"><font color="#FF0000">&nbsp;&nbsp;*</font>내용</label></td>
                                    <td>
                                        <textarea name="content" cols="67" rows="10" class="form-control"><s:property value="rc.content"/></textarea> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="map"><font color="#FF0000">&nbsp;&nbsp;*</font>지도위치</label></td>
                                    <td>
                                        <input class="form-control" type="text" name="map" value="<s:property value="rc.map"/>" size="40" maxlength="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="upload">&nbsp;&nbsp;&nbsp;사진1</label></td>
                                    <td>
                                        <s:file name="upload" theme="simple"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="upload">&nbsp;&nbsp;&nbsp;사진2</label></td>
                                    <td>
                                        <s:file name="upload" theme="simple"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="upload">&nbsp;&nbsp;&nbsp;사진3</label></td>
                                    <td>
                                        <s:file name="upload" theme="simple"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100"><label for="upload">&nbsp;&nbsp;&nbsp;사진4</label></td>
                                    <td>
                                        <s:file name="upload" theme="simple"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <input name="submit" type="submit" value="작성" class="btn btn-default btn-xs">
                                        <input name="list" type="button" value="돌아가기" class="btn btn-default btn-xs" 
                                               onClick="javascript:location.href = ''">
                                    </td>
                                </tr>
                            </table>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>
