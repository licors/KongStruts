<%-- 
    Document   : supportview
    Created on : 2016. 9. 1, 오후 5:23:05
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
                <td align="left" colspan="4">
                    문의답변
                </td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="4"></td>
            </tr>
            <tr>
                <td colspan="4" align="center" width="100">종류&nbsp;_<s:property value="rc.type"/></td>
            </tr>
            <tr>
                <td colspan="4" align="center" width="100">이메일&nbsp;_<s:property value="rc.email"/></td>
            </tr>
            <tr>
                <td colspan="4" align="center" width="100">등록일&nbsp;_<s:property value="rc.reg_date"/></td>
            </tr>
            <tr>
                <td colspan="4" align="center" width="100">내용&nbsp;_<s:property value="rc.content"/></td>
            </tr>
        </table>
    </body>
</html>
