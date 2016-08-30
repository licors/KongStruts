<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<title><tiles:getAsString name="title" /></title>
<%--  <style type="text/css">
    #wrapper {width:1250px; margin:auto; height:100%; overflow:hidden;}
    #header {width:1250px; margin-bottom:5px;}
    #left {width:250px; float:left;height:950px;}
    #body {width:1000px;float:left;margin-bottom:30px;}
    #footer {width:1250px; clear:both;}
  </style> --%>
</head>

<body>
<div id="wrapper">

<div id="header" style="width:1250px;"><tiles:insertAttribute name="top"/></div>

<div id="body" style="width:1250px;"><tiles:insertAttribute name="body"/></div>

<div id="footer" style="width:1250px;"><tiles:insertAttribute name="bottom"/></div>
</div>

</body>
</html>