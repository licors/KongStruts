<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 테스트용</title>
</head>
<body>

유저 정보 출력


memberNum = ${memresultClass.member_num} <br>
email = ${memresultClass.email}<br>
password = ${memresultClass.password}<br>
name = ${memresultClass.name}<br>
address = ${memresultClass.address}<br>
company = ${memresultClass.company}<br>
admin = ${memresultClass.admin}<br>


</body>
</html>