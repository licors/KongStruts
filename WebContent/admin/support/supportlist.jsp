<%-- 
    Document   : supportlist
    Created on : 2016. 8. 26, 오후 4:57:51
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
        <script>
            function login() {
                window.location.href = '/member/memberLoginForm.action';
            }
            function support() {
                window.location.href = '/support/supportwrite_form.action';
            }
        </script>
    </head>
    <body>
        <s:if test="memresultClass == null">
            <script>
                login()
            </script>
        </s:if>
        <s:elseif test="memresultClass != null && memresultClass.admin == 0">
            <script>
                support()
            </script>
        </s:elseif>
        <table align="center" width="600">
            <tr>
                <td align="left" colspan="2">1:1 문의목록</td>
            </tr>
            <tr>
                <td align="left" colspan="2">캔고루 문의목록</td>
            </tr>
            <tr align="center" bgcolor="#FFFFFF">
                <td width="50"><strong>번호</strong></td>
                <td width="200"><strong>종류</strong></td>
                <td width="200"><strong>이메일</strong></td>
                <td width="50"><strong>등록일</strong></td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="4"></td>
            </tr>
            <s:iterator value="list" status="stat">
                <s:url id="viewURL" action="support/supportread">
                    <s:param name="support_num">
                        <s:property value="support_num"/>
                    </s:param>
                    <s:param name="currentPage">
                        <s:property value="currentPage"/>
                    </s:param>
                </s:url>
                <tr>
                    <td><s:property value="support_num"/></td>
                    <td align="left">&nbsp;<s:a href="%{viewURL}"><s:property value="type"/></s:a></td>
                    <td align="center"><s:property value="email"/></td>
                    <td align="center"><s:property value="reg_date"/></td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="4"></td>
                </tr>
            </s:iterator>
            <s:if test="list.size() <= 0">
                <tr bgcolor="#FFFFFF" align="center">
                    <td colspan="5">등록된 문의글이 없습니다.</td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="4"></td>
                </tr>
            </s:if>
            <tr align="center">
                <td colspan="4"><s:property value="pagingHtml" escape="false"/></td>
            </tr>
        </table>
    </body>
</html>
