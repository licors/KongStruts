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
        <!-- 부트스트랩 -->
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <script>
            function modify() {
                if (confirm("정보를 수정하시겠습니까?")) {
                } else {
                    alert("취소되었습니다");
                    return false;
                }
            }
            function openConfirmId(joinform) {
                if (joinform.id.value == "") {
                    alert("아이디를 입력해주세요");
                    return;
                }
                url = "checkForm.action?id=" + joinform.id.value;
                open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
            }

            function zipCheck() {
                var url = "zipcodeF.action";
                window.open(url, "post", "toolbar=no,width=500,height=300,directoris=no,status=yes,scrollbars=yes,menubar=no");
            }
        </script> 
    </head>
    <body>
        <div class="container" style="width: 350px; max-width: none !important;">
            <div class="panel panel-default">
                <div class="panel-heading"><p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">정보수정</p></div>
                <div class="panel-body">
                    <form name="modify" method="post" action="/member/memberadminModify.action">
                        <s:hidden name="member_num" value="%{mc.member_num}"/>
                        <table align="center" class="table-condensed">
                            <tr height="40">
                                <td colspan="2" height="39" align="center" valign="middle">회원수정</td>
                            </tr>
                            <tr height="35">
                                <td width="80" align="center">이메일</td>
                                <td align="left"><input type="text" name="email" maxlength="50" value="<s:property value="mc.email" />" class="form-control"></td>
                            </tr>
                            <tr height="35">
                                <td width="80" align="center">이름</td>
                                <td align="left"><input type="text" name="name" maxlength="50" value="<s:property value="mc.name" />" class="form-control"></td>
                            </tr>
                            <tr height="35">
                                <td width="80" align="center">주소</td>
                                <td align="left"><input  type="text" name="zipcode" maxlength="7" value="<s:property value="mc.zipcode"/>" readonly class="form-control">
                                    <input type="button" value="우편번호검색" onclick="zipCheck()" class="btn btn-default btn-xs">
                                </td>
                            </tr>
                            <tr height="35">
                                <td align="center" width="80"></td>
                                <td><input type="text" name="addr1" maxlength="100" value="<s:property value="mc.addr1" />" class="form-control"></td>
                            </tr>
                            <tr height="35">
                                <td align="center" width="80"></td>
                                <td><input type="text" name="addr2" maxlength="100" value="<s:property value="mc.addr2" />" class="form-control"></td>
                            </tr>
                            <tr height="35">
                                <td width="80" align="center">회사</td>
                                <td align="left"><input type="text" name="company" maxlength="15" class="form-control"></td>
                            </tr>
                            <tr height="35">
                                <td colspan="2" align="center">
                                    <input type="submit" name="confirm" value="정보수정" class="btn btn-default btn-xs"> 
<!--                                    <input type="button" value="회원탈퇴" onclick="javascript:window.location.href = '/member/deleteForm.action'" class="btn btn-default btn-xs">-->
                                    <input type="button" value="취소" onclick="self.close()" class="btn btn-default btn-xs">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
