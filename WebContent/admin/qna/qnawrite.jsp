<%-- 
    Document   : qnawrite
    Created on : 2016. 8. 29, 오후 3:53:24
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
                var frm = document.qna;

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
        <div class="container" style="width: 900px; max-width: none !important;">
            <div class="panel panel-default">
                <div class="panel-heading"><p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">QnA</p></div>
                <div class="panel-body">
                    <s:if test="rc == null">
                        <form name="qna" action="/qna/qnawrite.action" method="post" onsubmit="return check()">
                        </s:if>
                        <s:else>
                            <form name="qna" action="/qna/qnamodify.action" method="post" onsubmit="return check()">
                                <s:hidden name="qna_num" value="%{rc.qna_num}"/>
                            </s:else>
                            <table align="center" class="table-condensed">
                                <tr>
                                    <td align="right" colspan="2">
                                        <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50" align="center"><label for="subject"><font color="#FF0000">&nbsp;&nbsp;*</font>Q.</label></td>
                                    <td>
                                        <s:if test="rc == null">
                                            <input class="form-control" type="text" name="subject" value="" size="20" maxlength="50" id="subject"/>
                                        </s:if>
                                        <s:else>
                                            <input class="form-control" type="text" name="subject" value="<s:property value="rc.subject"/>" size="20" maxlength="50" id="subject"/>
                                        </s:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2" width="50" align="center"><label for="content"><font color="#FF0000">&nbsp;&nbsp;*</font>A.</label></td>
                                    <td rowspan="2">
                                        <s:if test="rc == null">
                                            <textarea name="content" cols="57" rows="10" class="form-control" id="content"></textarea> 
                                        </s:if>
                                        <s:else>
                                            <textarea name="content" cols="57" rows="10" class="form-control" id="content"><s:property value="rc.content"/></textarea> 
                                        </s:else>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <input name="submit" type="submit" value="보내기" class="btn btn-default btn-xs">
                                    </td>
                                </tr>
                            </table>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>

