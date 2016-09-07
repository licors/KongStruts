<%-- 
    Document   : noticeview
    Created on : 2016. 8. 30, 오후 8:00:38
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QnA</title>
    </head>
    <body>
        <div class="table-bordered">
            <table align="center" width="600" class="table-condensed">
                <tr>
                    <td align="left" colspan="3">공지사항</td>
                    <s:if test="memresultClass.admin > 0">
                        <td align="right" colspan="3">
                            <input name="support" type="button" value="수정"
                                   onClick="javascript:location.href = '/notice/noticemodify_form.action?notice_num=<s:property value="rc.notice_num"/>'" class="btn btn-default btn-xs">
                            <input name="support" type="button" value="삭제"
                                   onClick="javascript:location.href = '/notice/noticedelete_form.action?notice_num=<s:property value="rc.notice_num"/>&currentPage=<s:property value="currentPage"/>'" class="btn btn-default btn-xs">
                        </td>
                    </s:if>
                </tr>
                <tr>
                    <td colspan="3"><s:property value="rc.subject"/></td>
                </tr>
            </table>
            <table align="center" width="600" class="table-condensed">
                <tr>
                    <td colspan="2" align="right" width="400">작성일&nbsp;<s:property value="rc.reg_date"/></td>
                    <td colspan="3" align="right" width="100">조회수&nbsp;<s:property value="rc.readcount"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="550" bgcolor="#FFFFFF"><s:property value="rc.content"/>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
