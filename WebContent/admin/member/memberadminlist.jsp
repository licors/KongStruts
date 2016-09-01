<%-- 
    Document   : memberadminlist
    Created on : 2016. 9. 1, 오후 5:42:43
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
    </head>
    <body>
        <table align="center" width="600">
            <tr>
                <td align="left" colspan="5">맴버 리스트</td>
            </tr>
            <tr align="center" bgcolor="#FFFFFF">
                <td width="80"><strong>No.</strong></td>
                <td width="170"><strong>이메일</strong></td>
                <td width="100"><strong>이름</strong></td>
                <td width="150"><strong>주소</strong></td>
                <td width="100"><strong>회사</strong></td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="5"></td>
            </tr>
            <s:iterator value="list" status="stat">
                <s:url id="viewURL" action="noticeread">
                    <s:param name="notice_num">
                        <s:property value="notice_num"/>
                    </s:param>
                    <s:param name="currentPage">
                        <s:property value="currentPage"/>
                    </s:param>
                </s:url>
                <tr>
                    <td><s:property value="member_num"/></td>
                    <td align="left">&nbsp;<s:a href="%{viewURL}"><s:property value="email"/></s:a></td>
                    <td align="center"><s:property value="name"/></td>
                    <td align="center"><s:property value="address"/></td>
                    <td align="center"><s:property value="company"/></td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="5"></td>
                </tr>
            </s:iterator>
            <s:if test="list.size() <= 0">
                <tr bgcolor="#FFFFFF" align="center">
                    <td colspan="5">가입한 회원이 없습니다.</td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="5"></td>
                </tr>
            </s:if>
            <tr align="center">
                <td colspan="5"><s:property value="pagingHtml" escape="false"/></td>
            </tr>
        </table>
    </body>
</html>
