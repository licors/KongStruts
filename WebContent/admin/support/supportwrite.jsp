<%-- 
    Document   : supportwrite
    Created on : 2016. 8. 25, 오후 8:43:11
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>문의하기</title>
        <script type="text/javascript">
            function check() {
                var frm = document.supportwrite;

                if (frm.type.value == "") {
                    alert("문의분류를 선택해주세요.");
                    return false;
                } else if (frm.content.value == "") {
                    alert("내용을 입력해주세요.");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <s:if test="rc == null">
            <form name="supportwrite" action="/support/supportwrite.action" method="post" onsubmit="return check()">
                <s:hidden name="member_num" value="%{memresultClass.member_num}"/>
            </s:if>
            <s:else>
                <form name="supportmodify" action="/support/supportmodify.action" method="post" onsubmit="return check()">
                </s:else>
                <table align="center" width="600">
                    <tr>
                        <td align="right" colspan="2">
                            <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 문의 분류 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="180" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>무엇이 궁금하세요</td>
                        <td width="420" bgcolor="#FFFFFF">
                            <select name="type" size="1" >
                                <option value="">무엇이 궁금하세요</option>
                                <option value="전시/행사/공연 제보">전시/행사/공연 제보</option>
                                <option value="제휴문의">제휴문의</option>
                                <option value="앱 사용/오류 문의">앱 사용/오류 문의</option>
                                <option value="결제 및 환불 문의">결제 및 환불 문의</option>
                                <option value="기타문의">기타문의</option>
                                <option value="전시회(부스)참가문의">전시회(부스)참가문의</option>
                            </select>                          
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 이메일 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="180" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>이메일</td>
                        <td width="420" bgcolor="#FFFFFF">
                            <s:if test="rc == null">
                                <input class="input" type="text" name="email" value="<s:property value="memresultClass.email"/>" size="20" maxlength="50"/>
                            </s:if>
                            <s:else>
                                <input class="input" type="text" name="email" value="<s:property value="rc.email"/>" size="20" maxlength="50"/>
                            </s:else>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 내용 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td rowspan="2" width="180" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>문의내용</td>
                        <td rowspan="2" width="420" bgcolor="#FFFFFF">
                            <textarea name="content" cols="57" rows="10"><s:property value="rc.content"/></textarea> 
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <input name="submit" type="submit" value="보내기" class="write">
                        </td>
                    </tr>
                </table>
            </form>
    </body>
</html>
