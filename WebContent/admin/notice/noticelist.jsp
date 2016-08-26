<%-- 
    Document   : noticelist
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
                <td align="left" colspan="2">공지사항</td>
            </tr>
            <tr>
                <td align="left" colspan="2">캔고루의 새로운 정보와 소식을 알려드립니다.</td>
            </tr>

            <tr align="center" bgcolor="#FFFFFF">
                <td width="50"><strong>번호</strong></td>
                <td width="420"><strong>제목</strong></td>
                <td width="80"><strong>작성일</strong></td>
                <td width="50"><strong>조회수</strong></td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="4"></td>
            </tr>
            <s:iterator value="list" status="stat">
                <s:url id="viewURL" action="viewAction">
                    <s:param name="notice_num">
                        <s:property value="notice_num"/>
                    </s:param>
                    <s:param name="currentPage">
                        <s:property value="currentPage"/>
                    </s:param>
                </s:url>
                <tr>
                    <td><s:property value="notice_num"/></td>
                    <td align="left">&nbsp;<s:a href="%{viewURL}"><s:property value="subject"/></s:a></td>
                    <td align="center"><s:property value="reg_date"/></td>
                    <td><s:property value="readcount"/></td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="4"></td>
                </tr>
                <s:if test="mc.admin > 0">
                    <tr align="right">
                        <td colspan="4">
                            <input type="button" value="글쓰기" class="inputb" onclick="javascript:location.href = 'writeForm.action?currentPage=<s:property value="currentPage"/>';">
                        </td>
                    </tr>
                </s:if>
            </s:iterator>
        </table>
    </body>
</html>
