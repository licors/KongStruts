<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/index.css" />
        <title><tiles:getAsString name="title" /></title>
        <script type="text/javascript" src="/js/index.js"></script>
        <link rel="shortcut icon" href="/cangoto_ico_16x16.ico" type="image/x-icon" /><!-- 파비콘 추가 -->
    </head>
<body>
	
	<div id="wrap">
		<div id="header">
    	    <tiles:insertAttribute name="top" />
 		</div>
	</div>

	<div id="wrap">
		<div id="navi">
			<tiles:insertAttribute name="left" />
		</div>
	</div>

	<br /><br />
	<div id="wrap">
		<div id="content_wrap">
		<div id="main_content">
			<tiles:insertAttribute name="body" />
		</div>
		</div>
	</div>

	<br /><br />
	
	<div id="wrap">
		<div id="footer">
			<tiles:insertAttribute name="bottom" />
		</div>
	</div>
	
</body>
</html>