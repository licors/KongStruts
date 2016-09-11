<%-- 
    Document   : supportwrite
    Created on : 2016. 8. 25, 오후 8:43:11
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>문의하기</title>
        <script type="text/javascript">
            function check() {
                var frm = document.support;

                if (frm.type.value == "") {
                    alert("문의분류를 선택해주세요.");
                    return false;
                } else if (frm.content.value == "") {
                    alert("내용을 입력해주세요.");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="container" style="width: 600px; max-width: none !important;"> <!-- 여기 선언해서 고정폭사용 -->
            <div class="panel panel-default"> <!-- 위쪽 제목 -->
                <div class="panel-heading"><p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">1:1문의</p></div>
                <div class="panel-body"> <!-- 본문 -->
                    <s:if test="email == null">
                        <form name="support" action="/support/supportwrite.action" method="post" onsubmit="return check()">
                            <s:hidden name="member_num" value="%{memresultClass.member_num}"/>
                        </s:if>
                        <s:else>
                            <form name="support" action="/support/supportewrite.action" method="post" onsubmit="return check()">
                                <s:hidden name="support_num" value="%{support_num}"/>
                                <s:hidden name="ref" value="%{rc.ref}" />
                                <s:hidden name="re_level" value="%{rc.re_level}" />
                                <s:hidden name="re_step" value="%{rc.re_step}" />
                            </s:else>
                            <table align="center" class="table-condensed">
                                <tr>
                                    <td align="right" colspan="2">
                                        <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <td width="180">
                                        <s:if test="email == null">
                                            <font color="#FF0000">&nbsp;&nbsp;*</font>무엇이 궁금하세요
                                        </s:if>
                                        <s:else>
                                            &nbsp;
                                        </s:else>
                                    </td>
                                    <td width="420">
                                        <s:if test="email == null">
                                            <select name="type" size="1" class="form-control">
                                                <option value="">무엇이 궁금하세요</option>
                                                <option value="전시/행사/공연 제보">전시/행사/공연 제보</option>
                                                <option value="제휴문의">제휴문의</option>
                                                <option value="앱 사용/오류 문의">앱 사용/오류 문의</option>
                                                <option value="결제 및 환불 문의">결제 및 환불 문의</option>
                                                <option value="기타문의">기타문의</option>
                                                <option value="전시회(부스)참가문의">전시회(부스)참가문의</option>
                                            </select>    
                                        </s:if>
                                        <s:else>
                                            <input class="form-control" type="text" value="문의하신 답변입니다." size="20" maxlength="50" readonly/>
                                        </s:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="180">
                                        <s:if test="email == null">
                                            <font color="#FF0000">&nbsp;&nbsp;*</font>이메일
                                        </s:if>
                                        <s:else>
                                            <font color="#FF0000">&nbsp;&nbsp;*</font>발신자
                                        </s:else></td>
                                    <td width="420">
                                        <s:if test="email == null">
                                            <input class="form-control" type="text" name="email" value="<s:property value="memresultClass.email"/>" size="20" maxlength="50"/>
                                        </s:if>
                                        <s:else>
                                            <input class="form-control" type="text" name="email" value="<s:property value="email"/>" size="20" maxlength="50"/>
                                        </s:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2" width="180">
                                        <s:if test="email == null">
                                            <font color="#FF0000">&nbsp;&nbsp;*</font>문의내용
                                        </s:if>
                                        <s:else>
                                            <font color="#FF0000">&nbsp;&nbsp;*</font>답변내용
                                        </s:else>
                                    </td>
                                    <td rowspan="2" width="420">
                                        <textarea name="content" cols="57" rows="10" class="form-control"></textarea> 
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <input name="submit" type="submit" value="보내기" class="btn btn-default btn-xs">
                                    </td>
                                </tr>
                            </table>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>
