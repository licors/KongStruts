<%-- 
    Document   : showcase_dlist
    Created on : 2016. 9. 3, 오후 8:30:10
    Author     : Li
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:property value="showboard_category"/></title>
    </head>
    <body>
        <strong><s:property value="showboard_category"/></strong>
        <table>
        
            <!-- 카테고리별 처리 -->
            <s:if test="showboard_category.equals(\"전시\")">
                <s:iterator value="list" status="stat">
                    <s:url id="viewURL" action="scread">
                        <s:param name="showboard_num">
                            <s:property value="showboard_num"/>
                        </s:param>
                    </s:url>
                    <%--<c:forEach var="i" items="list" varStatus="stats">--%>
                    <tr bgcolor="#FFFFFF" align="center">
                        <th rowspan="5"><s:a href="javascript:showcaseView('%{viewURL}')">
                                <img src="<s:property value="img"/><s:property value="file_savname.split(',')[0]"/>"
                                     border="1" width="300" height="300" onerror="javascript:this.src='/template/image/main/noimg.png'"></s:a>
                            </th>
                            
                            <th>전시명&nbsp;:&nbsp;<s:property value="subject"/></th>
                    </tr>
                    <tr>
                        <td>일정&nbsp;:&nbsp;<s:property value="date"/></td>
                    </tr>
                    <tr>
                        <td>장소&nbsp;:&nbsp;<s:property value="address2"/></td>
                    </tr>
                    <tr>
                        <td><s:if test="pay == 0">무료</s:if><s:else><s:property value="pay"/>원</s:else></td>
                        </tr>
                        <tr>
                                <td>√<s:property value="readcount"/>&nbsp;&nbsp;&nbsp;↓<s:property value="ordercount"/></td>
                    </tr>
                    <%--</c:forEach>--%>
                </s:iterator>
            </s:if>
            <s:elseif test="showboard_category.equals(\"미술\")">

            </s:elseif>
            <s:elseif test="showboard_category.equals(\"이벤트\")">

            </s:elseif>
        </table>
    </body>
</html>
