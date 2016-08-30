<%-- 
    Document   : noticeawrite
    Created on : 2016. 8. 30, 오후 7:21:13
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QnA 추가</title>
        <script type="text/javascript">
            function check() {
                var frm = document.notice;

                if (frm.subject.value == "") {
                    alert("제목을 입력해주세요.");
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
            <form name="notice" action="noticewrite.action" method="post" onsubmit="return check()">
            </s:if>
            <s:else>
                <form name="notice" action="noticemodify.action" method="post" onsubmit="return check()">
                </s:else>
                <table align="center" width="600">
                    <tr>
                        <td align="right" colspan="2">
                            <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 제목 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td width="180" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>제목</td>
                        <td width="420" bgcolor="#FFFFFF">
                            <s:if test="rc == null">
                                <input class="input" type="text" name="subject" value="" size="20" maxlength="50"/>
                            </s:if>
                            <s:else>
                                <input class="input" type="text" name="subject" value="<s:property value="rc.subject"/>" size="20" maxlength="50"/>
                            </s:else>
                        </td>
                    </tr>
                    <tr bgcolor="#777777"><!-- 내용 -->
                        <td height="1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td rowspan="2" width="180" bgcolor="#F4F4F4"><font color="#FF0000">&nbsp;&nbsp;*</font>내용</td>
                        <td rowspan="2" width="420" bgcolor="#FFFFFF">
                            <s:if test="rc == null">
                                <textarea name="content" cols="57" rows="10"></textarea> 
                            </s:if>
                            <s:else>
                                <textarea name="content" cols="57" rows="10"><s:property value="rc.content"/></textarea> 
                            </s:else>
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

