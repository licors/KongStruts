<%-- 
    Document   : noticeawrite
    Created on : 2016. 8. 30, 오후 7:21:13
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QnA 추가</title>
        <script type="text/javascript">
            function check() {
                var frm = document.notice;

                if (frm.subject.value == "") {
                    alert("제목을 입력해주세요.");
                    return false;
                } else if (frm.content.value == "") {
                    alert("내용을 입력해주세요.");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="table-bordered">
            <s:if test="rc == null">
                <form name="notice" action="/notice/noticewrite.action" method="post" onsubmit="return check()" class="form-control-static">
                </s:if>
                <s:else>
                    <form name="notice" action="/notice/noticemodify.action" method="post" onsubmit="return check()" class="form-control-static">
                        <s:hidden name="notice_num" value="%{rc.notice_num}"/>
                        <s:hidden name="currentPage" value="%{currentPage}"/>
                    </s:else>
                    <table align="center" width="600" class="table-condensed">
                        <tr>
                            <td align="right" colspan="2">
                                <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="subject"><font color="#FF0000">&nbsp;&nbsp;*</font>제목</label>
                            </td>
                            <td>
                                <input type="text" name="subject" value="<s:property value="rc.subject"/>" size="30" maxlength="25" placeholder="제목을 입력하세요." class="form-control" id="subject"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="content"><font color="#FF0000">&nbsp;&nbsp;*</font>내용</label><br>
                            </td>
                            <td>
                                <textarea name="content" cols="57" rows="10" placeholder="내용을 입력하세요." class="form-control" id="content"><s:property value="rc.content"/></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <input name="submit" type="submit" value="보내기"  class="btn btn-default btn-xs">
                            </td>
                        </tr>
                    </table>
                </form>
        </div>
    </body>
</html>

