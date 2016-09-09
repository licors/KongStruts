<%-- 
    Document   : noticelist
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
        <title>공지사항</title>
    </head>
    <body>
        <div class="container" style="width: 600px; max-width: none !important;">
            <div class="panel panel-default">
                <div class="panel-heading">공지사항</div>
                <div class="panel-body">
                    <div class="form-inline">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <p>캔고루의 새로운 정보와 소식을 알려드립니다.</p>
                                </div>
                            </div>
                            <div class="col-md-3 col-md-offset-1">
                                <s:if test="memresultClass.admin > 0">
                                    <div class="form-group">
                                        <input name="support" type="button" value="공지글 작성"
                                               onClick="javascript:location.href = '/notice/noticewrite_form.action'" class="btn btn-default btn-xs text-right">
                                    </div>
                                </s:if>
                            </div>
                        </div>
                    </div>
                </div>
                <table align="center" class="table">
                    <tr align="center" bgcolor="#FFFFFF">
                        <td width="50"><strong>번호</strong></td>
                        <td width="400"><strong>제목</strong></td>
                        <td width="80"><strong>작성일</strong></td>
                        <td width="70"><strong>조회수</strong></td>
                    </tr>
                </table>
                <table align="center" class="table-hover">
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
                            <td width="50" align="center"><s:property value="notice_num"/></td>
                            <td width="400" align="left">&nbsp;<s:a href="%{viewURL}"><s:property value="subject"/></s:a></td>
                            <td width="80" align="center"><s:property value="reg_date"/></td>
                            <td width="70" align="center"><s:property value="readcount"/></td>
                        </tr>
                    </s:iterator>
                </table>
                <table align="center" class="table">
                    <s:if test="list.size() <= 0">
                        <tr bgcolor="#FFFFFF" align="center">
                            <td colspan="5">등록된 게시물이 없습니다.</td>
                        </tr>
                    </s:if>
                    <tr align="center">
                        <td colspan="4"><s:property value="pagingHtml" escape="false"/></td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
