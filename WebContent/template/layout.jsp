<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <!--        <link rel="stylesheet" type="text/css" href="/css/index.css" />-->
        <title><tiles:getAsString name="title" /></title>
        <!-- 부트스트랩 -->
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/js/index.js"></script><!-- 로그인용 -->
        <link rel="shortcut icon" href="/cangoto_ico_16x16.ico" type="image/x-icon" /><!-- 파비콘 추가 -->
    </head>
    <body>

        <div>
            <div>
                <tiles:insertAttribute name="top" />
            </div>
        </div>

        <div>
            <div>
                <tiles:insertAttribute name="left" />
            </div>
        </div>

        <br /><br />
        <div>
            <div>
                <div>
                    <tiles:insertAttribute name="body" />
                </div>
            </div>
        </div>

        <br /><br />

        <div>
            <div>
                <tiles:insertAttribute name="bottom" />
            </div>
        </div>

    </body>
</html>