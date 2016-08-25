<%-- 
    Document   : supportwrite
    Created on : 2016. 8. 25, 오후 8:43:11
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!
    String mainpage = ""; //메인 타일즈? 입력
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>전시글 쓰기</title>
        <script type="text/javascript">
//            function check() {
//                var frm = document.scwrite;
//
//                if (frm.subject.value == "") {
//                    alert("전시명을 입력해주세요.");
//                    return false;
//                }
//            }
        </script>
    </head>
    <body>
        <s:if test="rc == null">
            <form name="scwrite" action="scwrite.action" method="post" enctype="multipart/form-data" onsubmit="return check()">
                <s:hidden name="currentPage" value="%{currentPage}"/>
                <s:hidden name="upload" value="%{rc.file_savname}"/>
            </s:if>
            <s:else>
                <form name="scmodify" action="scmodify.action" method="post" enctype="multipart/form-data" onsubmit="return check()">
                    <s:hidden name="showboard_num" value="%{rc.showboard_num}"/>
                    <s:hidden name="currentPage" value="%{currentPage}"/>
                    <s:hidden name="upload" value="%{rc.file_savname}"/>
                </s:else>
                <table align="center" width="600">
                    <tr>
                        <td align="right" colspan="2">
                            <font color="#FF0000">*</font>는 필수 입력 사항입니다.</td>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 전시명 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>전시명</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="subject" value="<s:property value="rc.subject"/>" size="20" maxlength="50"/>
                        </td>
                    </tr>

                    <tr bgcolor="#777777"><!-- 카테고리 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>카테고리</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <select name="showboard_category" size="1" >
                                <option value="showcase">전시</option>
                                <option value="art">미술</option>
                                <option value="event">이벤트</option>
                            </select>                        
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 전시 장소 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>장소</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="address1" value="<s:property value="rc.address1"/>" size="20" maxlength="50"/><br>
                            <input class="input" type="text" name="address2" value="<s:property value="rc.address2"/>" size="20" maxlength="50"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 입장료 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>입장료</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="pay" value="<s:property value="rc.pay"/>" size="20" maxlength="50"/>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 문의전화 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>문의전화</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="tel" value="<s:property value="rc.tel"/>" size="20" maxlength="50"/>
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
                            <textarea name="content" cols="50" rows="10"><s:property value="rc.content"/></textarea> 
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 전시 위치 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>지도위치</td>
                        <td width="500" bgcolor="#FFFFFF">
                            <input class="input" type="text" name="map" value="<s:property value="rc.map"/>" size="20" maxlength="50"/>
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
                                   onClick="javascript:location.href = mainpage">
                        </td>
                    </tr>
                </table>
            </form>
    </body>
</html>
