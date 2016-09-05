<%-- 
    Document   : scwrite
    Created on : 2016. 8. 25, 오후 6:51:53
    Author     : user2
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
        <s:if test="rc == null">
            <form name="sc" action="/showcase/scwrite.action" method="post" enctype="multipart/form-data" onsubmit="return check()">
            </s:if>
            <s:else>
                <form name="sc" action="/showcase/scmodify.action" method="post" enctype="multipart/form-data" onsubmit="return check()">
                    <s:hidden name="showboard_num" value="%{rc.showboard_num}"/>
                </s:else>
                <table align="center" width="600">
                    <tr>
                        <td align="right" colspan="2">
                            <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 전시명 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>전시명</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="subject" value="<s:property value="rc.subject"/>" size="30" maxlength="50"/>
                        </td>
                    </tr>

                    <tr bgcolor="#777777"><!-- 카테고리 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>카테고리</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <s:if test="rc == null">
                                <select name="showboard_category" size="1" >
                                    <option value="">카테고리</option>
                                <option value="전시">전시</option>
                                <option value="미술">미술</option>
                                <option value="이벤트">이벤트</option>
                                </select>   
                            </s:if>
                            <s:else>
                                <select name="showboard_category" size="1" >
                                    <option value="<s:property value="rc.showboard_category"/>"><s:property value="rc.showboard_category"/></option>
                                </select>   
                            </s:else>

                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 전시 장소 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>장소</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="address1" value="<s:property value="rc.address1"/>" size="10" maxlength="10"/>&nbsp;(시/도)<br>
                            <input class="input" type="text" name="address2" value="<s:property value="rc.address2"/>" size="30" maxlength="100"/>&nbsp;(나머지)
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 전시기간 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>일정</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="date" value="<s:property value="rc.date"/>" size="20" maxlength="25"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 입장료 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>입장료</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="pay" value="<s:property value="rc.pay"/>" size="10" maxlength="7"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 문의전화 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>문의전화</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="tel" value="<s:property value="rc.tel"/>" size="20" maxlength="15"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- tag -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4">&nbsp;&nbsp;&nbsp;태그</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="tag" value="<s:property value="rc.tag"/>" size="20" maxlength="50"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 내용 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>내용</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <textarea name="content" cols="67" rows="10"><s:property value="rc.content"/></textarea> 
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 전시 위치 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>지도위치</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="map" value="<s:property value="rc.map"/>" size="40" maxlength="40"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 사진1 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4">&nbsp;&nbsp;&nbsp;사진1</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <s:file name="upload" theme="simple"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 사진2 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4">&nbsp;&nbsp;&nbsp;사진2</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <s:file name="upload" theme="simple"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 사진3 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4">&nbsp;&nbsp;&nbsp;사진3</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <s:file name="upload" theme="simple"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 사진4 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4">&nbsp;&nbsp;&nbsp;사진4</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <s:file name="upload" theme="simple"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <input name="submit" type="submit" value="작성" class="write">
                            <input name="list" type="button" value="돌아가기" class="list" 
                                   onClick="javascript:location.href = ''">
                        </td>
                    </tr>
                </table>
            </form>
    </body>
</html>
