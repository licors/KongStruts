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
            function Success() {
                window.location.href = '/notice/noticelist.action?currentPage=<s:property value="currentPage"/>';
            }
        </script>
    </head>
    <body>
        <script>
            Success()
        </script>
    </body>
</html>
