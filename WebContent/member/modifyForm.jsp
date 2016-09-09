<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
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
    function openmodifyPassword() {
        var url = "memberPMF.action";
        window.open(url, "post", "toolbar=no,width=400,height=250,directoris=no,status=yes,scrollbars=no,menubar=no");
    }
    
    function zipCheck() {
		var url = "zipcodeF.action";
		window.open(url,"post","toolbar=no,width=500,height=300,directoris=no,status=yes,scrollbars=yes,menubar=no");
	}
</script> 

<center> 
<h2 align="center">마이페이지</h2>
    <form name="joinform" method="post" action="memberM.action?member_num=<s:property value="memresultClass.member_num"/>">
        <table class="table table-hover"  border="1" cellspacing="0" cellpadding="1" align="center">
           
            <tr height="35">
                <td class="email" align="center">이메일</td>
                <td align="left"><s:property value="memresultClass.email" /></td>
            </tr>	
            <tr height="35">
                <td align="center">비밀번호</td>
                <td align="left"><input type="button" class="btn btn-success" value="비밀번호변경" onclick="return openmodifyPassword()"></td>
            </tr>
            <tr height="35">
                <td class="name" align="center">이름</td>
                <td align="left"><s:property value="memresultClass.name" /></td>
            </tr>	
           
            <tr height="35">
                <td class="company" align="center">회사</td>
                <td align="left">
                <input type="text" name="company" size="7" maxlength="7" 
                value="<s:property value="memresultClass.company"/>"/>
                </td>
            </tr>
            
            <tr height="35">
						<td width="150" align="center">주소</td>
						<td align="left"><input class="zipcode"
								type="text" name="zipcode" size="7" maxlength="7"
								value="<s:property value="memresultClass.zipcode"/>" readonly>
									<input class="btn btn-success" type="button" value="우편번호검색"
									onclick="zipCheck()"></td>
						
					</tr>

			<tr height="35">
						<td align="center" width="150"></td>
						<td><input class="address" type="text" name="address"
								size="44" maxlength="100" value="<s:property value="memresultClass.address" />"></td>
					</tr>
						<tr height="35">
						<td align="center" width="150"></td>
						<td><input class="address2" type="text" name="address2"
								size="44" maxlength="100" value="<s:property value="memresultClass.address2" />"></td>
					</tr>
					
            <tr height="35">
                <td colspan="2" align="center">
                    <input class="btn btn-success" type="submit" name="confirm" value="정보수정"> 
                    <input class="btn btn-success" type="button" value="회원탈퇴" onclick="javascript:window.location.href = 'deleteForm.action'">
                    <input class="btn btn-default" type="button" value="취소" onclick="javascript:window.location.href = '/showcase/sclist.action'">
                </td>
            </tr>
        </table>
    </form>
</center>