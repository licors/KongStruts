<%-- 
    Document   : scmodifySuccess
    Created on : 2016. 8. 31, 오후 6:58:09
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
                window.location.href = 'scread.action?showboard_num=<s:property value="rc.showboard_num"/>';
            }
        </script>
    </head>
    <body>
        <script>
            Success()
        </script>
    </body>
</html>