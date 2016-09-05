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
                <td align="left" colspan="3">자주 물어보시는 질문입니다.</td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                    <input name="support" type="button" value="1:1 문의"
                           onClick="javascript:location.href = '/support/supportlist.action'">
                    <s:if test="memresultClass.admin > 0">
                        <input name="support" type="button" value="QnA 추가"
                               onClick="javascript:location.href = '/qna/qnawriteform.action'">
                    </s:if>
                </td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="4"></td>
            </tr>
            <s:iterator value="list" status="stat">
                <tr>
                    <td colspan="1" width="50" align="left" bgcolor="#FFFFFF">Q.</td>
                    <td colspan="2" width="430" align="left" bgcolor="#FFFFFF"><s:property value="subject"/></td>
                    <s:if test="memresultClass.admin > 0">
                        <td colspan="3" width="120" align="center">
                            <input name="support" type="button" value="수정" onClick="javascript:location.href = '/qna/qnamodifyform.action?qna_num=<s:property value="qna_num"/>'">
                            <input name="support" type="button" value="삭제" onClick="javascript:location.href = '/qna/qnadeleteform.action?qna_num=<s:property value="qna_num"/>'">
                        </td>
                    </s:if>
                </tr>
                <tr>
                    <td colspan="1" width="50" bgcolor="#FFFFFF">A.</td>
                    <td colspan="2" width="550" bgcolor="#FFFFFF"><s:property value="content"/></td>
                    <td colspan="3"></td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="4"></td>
                </tr>
            </s:iterator>
        </table>
    </body>
</html>
