<%-- 
    Document   : membermodifyForm
    Created on : 2016. 9. 3, 오후 6:25:09
    Author     : Li
--%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function modify() {
                if (confirm("정보를 수정하시겠습니까?")) {
                } else {
                    alert("취소되었습니다");
                    return false;
                }
            }
            function openmodifyPassword() {
                var url = "memberPMF.action";
                window.open(url, "post", "toolbar=no, width=400, height=250, directoris=no, status=yes, scrollbars=no, menubar=no");
            }
        </script> 
    </head>
    <body>
    <center>
        <form name="modify" method="post" action="/member/memberadminModify.action">
            <s:hidden name="member_num" value="%{memresultClass.member_num}"/>
            <table width="500" border="1" cellspacing="0" cellpadding="1" align="center">
                <tr height="40">
                    <td colspan="2" height="39" width="100%" align="center" valign="middle">회원수정</td>
                </tr>
                <tr height="35">
                    <td width="150" align="center">이메일</td>
                    <td align="left"><input type="text" name="email" size="44" maxlength="50" value="<s:property value="memresultClass.email" />"></td>
                </tr>
                <tr height="35">
                    <td width="150" align="center">이름</td>
                    <td align="left"><input type="text" name="name" size="44" maxlength="50" value="<s:property value="memresultClass.name" />"></td>
                </tr>
                <tr height="35">
                    <td width="150" align="center">주소</td>
                    <td align="left"><input  type="text" name="zipcode" size="7" maxlength="7" value="<s:property value="memresultClass.zipcode"/>" readonly>
                        <input type="button" value="우편번호검색" onclick="zipCheck()">
                    </td>
                </tr>
                <tr height="35">
                    <td align="center" width="150"></td>
                    <td><input type="text" name="addr1" size="44" maxlength="100" value="<s:property value="memresultClass.addr1" />"></td>
                </tr>
                <tr height="35">
                    <td align="center" width="150"></td>
                    <td><input type="text" name="addr2" size="44" maxlength="100" value="<s:property value="memresultClass.addr2" />"></td>
                </tr>
                <tr height="35">
                    <td width="150" align="center">회사</td>
                    <td align="left"><input type="text" name="company" size="20" maxlength="15"></td>
                </tr>
                <tr height="35">
                    <td colspan="2" align="center">
                        <input type="submit" name="confirm" value="정보수정"> 
                        <input type="button" value="회원탈퇴" onclick="javascript:window.location.href = '/member/deleteForm.action'">
                        <input type="button" value="취소" onclick="self.close()">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
