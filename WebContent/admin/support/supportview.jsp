<%-- 
    Document   : supportview
    Created on : 2016. 9. 1, 오후 5:23:05
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
        <div class="container" style="width: 900px; max-width: none !important;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-inline">
                        <div class="form-group">
                            <p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">1:1문의</p>
                        </div>
                        <div class="form-group" style="float: right">
                            <form  name="email" method="post" action="/support/supportewrite_form.action">
                                <s:hidden name="email" value="%{rc.email}"/><!-- 답변받을 이메일 전송 -->
                                <s:hidden name="support_num" value="%{rc.support_num}"/><!-- 답변달릴 문의글번호 전송 -->
                                <input name="submit" type="submit" value="답변하기" class="btn btn-default"/>
                            </form>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table align="center" width="100%" class="table-condensed">
                            <tr>
                                <td align="center" width="20%" style="font-size: 16px"><strong>문의분류</strong></td>
                                <td align="left" width="70%"><s:property value="rc.type"/></td>
                            </tr>
                            <tr>
                                <td align="center" width="20%" style="font-size: 16px"><strong>E-Mail</strong></td>
                                <td align="left" width="70%"><s:property value="rc.email"/></td>
                            </tr>
                            <tr>
                                <td align="center" width="20%" style="font-size: 16px"><strong>작성일</strong></td>
                                <td align="left" width="70%"><s:property value="rc.reg_date"/></td>
                            </tr>
                            <tr>
                                <td align="center" width="20%" style="font-size: 16px"><strong>문의내용</strong></td>
                                <td align="left" width="70%"><s:property value="rc.content"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
