<%-- 
    Document   : noticeview
    Created on : 2016. 8. 30, 오후 8:00:38
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
                <td align="left" colspan="3">공지사항</td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                    <s:if test="mc.admin > 0">
                        <!-- http://localhost:8080/notice/noticeread.action?notice_num=2&currentPage=1 -->
                        <input name="support" type="button" value="수정"
                               onClick="javascript:location.href = '/notice/noticemodify_form.action?notice_num=<s:property value="rc.notice_num"/>'">
                        <input name="support" type="button" value="삭제"
                               onClick="javascript:location.href = '/notice/noticedelete_form.action?notice_num=<s:property value="rc.notice_num"/>&currentPage=<s:property value="currentPage"/>'">
                    </s:if>
                </td>
            </tr>
            <tr>
                <td colspan="2"><s:property value="rc.subject"/></td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="3"></td>
            </tr>
            <tr>
                <td colspan="2" align="right" width="400">작성일&nbsp;<s:property value="rc.reg_date"/></td>
                <td colspan="3" align="right" width="100">조회수&nbsp;<s:property value="rc.readcount"/></td>
            </tr>
            <tr>
                <td colspan="3" height="1"></td>
            </tr>
            <tr>
                <td colspan="3" width="550" bgcolor="#FFFFFF"><s:property value="rc.content"/>
                </td>
            </tr>

            <tr bgcolor="#777777">
                <td height="1" colspan="3"></td>
            </tr>
        </table>
    </body>
</html>
