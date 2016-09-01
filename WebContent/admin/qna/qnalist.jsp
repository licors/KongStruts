<%-- 
    Document   : qnalist
    Created on : 2016. 8. 26, 오후 4:57:51
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="admin.member.memberadminlist" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QnA</title>
    </head>
    <body>
        <table align="center" width="600">
            <tr>
                <td align="left" colspan="2">자주 물어보시는 질문입니다.</td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <input name="support" type="button" value="1:1 문의" class="list" 
                           onClick="javascript:location.href = '1:1문의 링크'">
                    <s:if test="memresultClass.admin > 0"><!-- 어드민 qna 작성 -->
                        <input type="button" name="qna" value="QnA 추가">
                    </s:if>
                </td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="2"></td>
            </tr>
            <s:iterator value="list" status="stat">
                <tr>
                    <td width="50" bgcolor="#FFFFFF">Q.</td>
                    <td width="550" bgcolor="#FFFFFF"><s:property value="subject"/>
                    </td>
                </tr>
                <tr>
                    <td width="50" bgcolor="#FFFFFF">A.</td>
                    <td width="550" bgcolor="#FFFFFF"><s:property value="content"/>
                    </td>
                </tr>

                <tr bgcolor="#777777">
                    <td height="1" colspan="2"></td>
                </tr>
            </s:iterator>
        </table>
    </body>
</html>
