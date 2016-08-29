<%-- 
    Document   : mainT
    Created on : 2016. 8. 29, 오후 6:45:44
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>메인_테스트</title>
    </head>
    <body>
        <table align="center" width="600">
            <tr>
                <td align="right" colspan="5">
                    <input name="support" type="button" value="1:1 문의" class="list" 
                           onClick="javascript:location.href = '/qna/qnawrite_form.action'">
                    <s:if test="mc.admin > 0"><!-- 어드민 qna 작성 -->
                        <input type="button" name="qna" value="QnA 추가">
                    </s:if>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="5">
                    전시
                </td>
            </tr>
            <tr align="center" bgcolor="#F3F3F3">
                <td width="50"><strong>번호</strong></td>
                <td width="350"<strong>제목</strong></td>
                <td width="70"><strong>상태</strong></td>
                <td width="80"><strong>조회수</strong></td>
                <td width="50"><strong>예매</strong></td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="5"></td>
            </tr>
            <s:iterator value="list1" status="stat">
                <s:url id="viewURL" action="scread">
                    <s:param name="showboard_num">
                        <s:property value="showboard_num"/>
                    </s:param>
                    <%--<s:param name="currentPage">--%>
                    <%--<s:property value="currentPage"/>--%>
                    <%--</s:param>--%>
                </s:url>
                <tr bgcolor="#FFFFFF" aglin="certer">
                    <td><s:property value="showboard_num"/></td>
                    <td align="left">&nbsp;<s:a href="%{viewURL}"><s:property value="subject"/></s:a></td>
                    <td align="center"><s:property value="status"/></td>
                    <td align="center"><s:property value="readcount"/></td>
                    <td align="center"><s:property value="ordercount"/></td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="5"></td>
                </tr>
            </s:iterator>

            <tr>
                <td align="center" colspan="5">
                    미술
                </td>
            </tr>
            <tr align="center" bgcolor="#F3F3F3">
                <td width="50"><strong>번호</strong></td>
                <td width="350"<strong>제목</strong></td>
                <td width="70"><strong>상태</strong></td>
                <td width="80"><strong>조회수</strong></td>
                <td width="50"><strong>예매</strong></td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="5"></td>
            </tr>
            <s:iterator value="list2" status="stat">
                <s:url id="viewURL" action="showcaseDetail/readAction">
                    <s:param name="showboard_num">
                        <s:property value="showboard_num"/>
                    </s:param>
                    <%--<s:param name="currentPage">--%>
                    <%--<s:property value="currentPage"/>--%>
                    <%--</s:param>--%>
                </s:url>
                <tr bgcolor="#FFFFFF" aglin="certer">
                    <td><s:property value="showboard_num"/></td>
                    <td align="left">&nbsp;<s:a href="%{viewURL}"><s:property value="subject"/></s:a></td>
                    <td align="center"><s:property value="status"/></td>
                    <td align="center"><s:property value="readcount"/></td>
                    <td align="center"><s:property value="ordercount"/></td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="5"></td>
                </tr>
            </s:iterator>

            <tr>
                <td align="center" colspan="5">
                    이벤트
                </td>
            </tr>
            <tr align="center" bgcolor="#F3F3F3">
                <td width="50"><strong>번호</strong></td>
                <td width="350"<strong>제목</strong></td>
                <td width="70"><strong>상태</strong></td>
                <td width="80"><strong>조회수</strong></td>
                <td width="50"><strong>예매</strong></td>
            </tr>
            <tr bgcolor="#777777">
                <td height="1" colspan="5"></td>
            </tr>
            <s:iterator value="list3" status="stat">
                <s:url id="viewURL" action="viewAction">
                    <s:param name="showboard_num">
                        <s:property value="showboard_num"/>
                    </s:param>
                    <%--<s:param name="currentPage">--%>
                    <%--<s:property value="currentPage"/>--%>
                    <%--</s:param>--%>
                </s:url>
                <tr bgcolor="#FFFFFF" aglin="certer">
                    <td><s:property value="showboard_num"/></td>
                    <td align="left">&nbsp;<s:a href="%{viewURL}"><s:property value="subject"/></s:a></td>
                    <td align="center"><s:property value="status"/></td>
                    <td align="center"><s:property value="readcount"/></td>
                    <td align="center"><s:property value="ordercount"/></td>
                </tr>
                <tr bgcolor="#777777">
                    <td height="1" colspan="5"></td>
                </tr>
            </s:iterator>
        </table>
    </body>
</html>