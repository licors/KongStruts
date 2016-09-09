<%-- 
    Document   : noticedeleteform
    Created on : 2016. 8. 31, 오후 5:10:52
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function del() {
                if (confirm("정말로 삭제 하시겠습니까?")) {
                    window.location.href = "/notice/noticedelete.action?notice_num=<s:property value="rc.notice_num"/>";
                    self.close();
                } else {
                    alert("취소되었습니다");
                    window.location.href = '/notice/noticeread.action?notice_num=<s:property value="rc.notice_num"/>&currentPage=<s:property value="currentPage"/>';
                }
            }
        </script>
    </head>
    <body>
        <script>
            del()
        </script>
    </body>
</html>
