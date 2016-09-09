<%-- 
    Document   : scdeleteform
    Created on : 2016. 8. 31, 오후 6:58:28
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
                if (confirm("정말로 삭제 하시겠습니까? num:" + <s:property value="rc.showboard_num"/>)) {
                    window.location.href = "/showcase/scdelete.action?showboard_num=<s:property value="rc.showboard_num"/>";
//                    self.close();
                } else {
                    alert("취소되었습니다");
                    window.location.href = '/showcase/scread.action?showboard_num=<s:property value="rc.showboard_num"/>';
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