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
        <title>공지사항</title>
    </head>
    <body>
        <div class="container" style="width: 900px; max-width: none !important;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-inline">
                        <div class="form-group">
                            <p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">공지사항</p>
                        </div>
                        <div class="form-group" style="float: right">
                            <s:if test="memresultClass.admin > 0">
                                <input name="support" type="button" value="수정"
                                       onClick="javascript:location.href = '/notice/noticemodify_form.action?notice_num=<s:property value="rc.notice_num"/>'" class="btn btn-default">
                                <input name="support" type="button" value="삭제"
                                       onClick="javascript:location.href = '/notice/noticedelete_form.action?notice_num=<s:property value="rc.notice_num"/>&currentPage=<s:property value="currentPage"/>'" class="btn btn-default">
                            </s:if>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <p class="lead"><s:property value="rc.subject"/></p>
                    <hr>
                    <p class="text-right">작성일&nbsp;<s:property value="rc.reg_date"/>&nbsp;&nbsp;&nbsp;조회수&nbsp;<s:property value="rc.readcount"/></p>
                    <p class="text-left"><s:property value="rc.content"/></p>
                </div>
            </div>
        </div>
    </body>
</html>
