<%-- 
    Document   : qnadeleteform
    Created on : 2016. 9. 2, 오후 8:27:58
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
                    window.location.href = "/qna/qnadelete.action?qna_num=<s:property value="rc.qna_num"/>";
//                    self.close();
                } else {
                    alert("취소되었습니다");
                    window.location.href = '/qna/qnalist.action';
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
