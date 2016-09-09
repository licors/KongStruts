<%-- 
    Document   : memberadminlist
    Created on : 2016. 9. 1, 오후 5:42:43
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function memberView(url) {
                window.open(url, "post", "toolbar=no, width=500, height=500 ,directories=no, status=no, scrollbars=yes, menubar=no, location=no, resizable=no");
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading"><p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">맴버 리스트</p></div>
                <table align="center" class="table table-hover">
                    <thead>
                        <tr align="center" bgcolor="#FFFFFF">
                            <td class="col-md-1" style="font-size: 16px"><strong>No.</strong></td>
                            <td class="col-md-3" style="font-size: 16px"><strong>이메일</strong></td>
                            <td class="col-md-2" style="font-size: 16px"><strong>이름</strong></td>
                            <td class="col-md-5" style="font-size: 16px"><strong>주소</strong></td>
                            <td class="col-md-1" style="font-size: 16px"><strong>회사</strong></td>
                        </tr>
                    </thead>
                    <s:iterator value="list" status="stat">
                        <s:url id="viewURL" action="member/memberadminModifyForm">
                            <s:param name="member_num">
                                <s:property value="member_num"/>
                            </s:param>
                            <s:param name="currentPage">
                                <s:property value="currentPage"/>
                            </s:param>
                        </s:url>
                        <tr>
                            <td align="center"><s:property value="member_num"/></td>
                            <td align="left">&nbsp;<s:a href="javascript:memberView('%{viewURL}')"><s:property value="email"/></s:a></td>
                            <td align="center"><s:property value="name"/></td>
                            <td align="center"><s:property value="address"/></td>
                            <td align="center"><s:property value="company"/></td>
                        </tr>
                    </s:iterator>
                    <s:if test="list.size() <= 0">
                        <tr bgcolor="#FFFFFF" align="center">
                            <td colspan="5">가입한 회원이 없습니다.</td>
                        </tr>
                    </s:if>
                    <thead>
                        <tr align="center">
                            <td colspan="5"><s:property value="pagingHtml" escape="false"/></td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </body>
</html>
