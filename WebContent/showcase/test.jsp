<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%-- <%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<head>
<sj:head />
</head>
<body>
	<s:url var="remoteurl1" action="ajax1" />
	<s:url var="remoteurl2" action="ajax2" />
	<s:url var="remoteurl3" action="ajax3" />
	<s:url var="remoteurl4" action="ajax4" />
	<s:url var="remoteurl5" action="echo" />
	<sj:tabbedpanel id="remotetabs" selectedTab="2" show="true"
		hide="'fade'" collapsible="true" sortable="true">
		<sj:tab id="tab1" href="%{remoteurl1}" label="Remote Tab One" />
		<sj:tab id="tab2" href="%{remoteurl2}" label="Remote Tab Two" />
		<sj:tab id="tab3" href="%{remoteurl3}" label="Remote Tab Three"
			closable="true" />
		<sj:tab id="tab4" href="%{remoteurl4}" label="Remote Tab Four"
			closable="true" />
		<sj:tab id="tab5" formIds="echoForm" href="%{remoteurl5}"
			label="Echo Tab" />
	</sj:tabbedpanel>
</body>
</html>



 --%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<head>
<sj:head />
</head>
<body> 
	<sj:tabbedpanel id="localtabs" cssClass="list">
		<sj:tab id="tab1" target="tone" label="Local Tab One" />
		<sj:tab id="tab2" target="ttwo" label="Local Tab Two" />
		<sj:tab id="tab3" target="tthree" label="Local Tab Three" />
		<sj:tab id="tab4" target="tfour" label="Local Tab Four" />
		<div id="tone">Mauris mauris ante, blandit et, ultrices a,
			suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie
			vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
			suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
			malesuada. Vestibulum a velit eu ante scelerisque vulputate.</div>
		<div id="ttwo">Sed non urna. Donec et ante. Phasellus eu ligula.
			Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet
			laoreet, mauris turpis porttitor velit, faucibus interdum tellus
			libero ac justo. Vivamus non quam. In suscipit faucibus urna.</div>
		<div id="tthree">Nam enim risus, molestie et, porta ac, aliquam
			ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa.
			Aenean in pede. Phasellus ac libero ac tellus pellentesque semper.
			Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante
			aliquam nisi, eu iaculis leo purus venenatis dui.</div>
		<div id="tfour">Cras dictum. Pellentesque habitant morbi
			tristique senectus et netus et malesuada fames ac turpis egestas.
			Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
			posuere cubilia Curae; Aenean lacinia mauris vel est. Suspendisse eu
			nisl. Nullam ut libero. Integer dignissim consequat lectus. Class
			aptent taciti sociosqu ad litora torquent per conubia nostra, per
			inceptos himenaeos.</div>
	</sj:tabbedpanel>
</body>
</html>






<%--
	struts2 tab example 	    
	<sd:tabbedpanel id="test" useSelectedTabCookie="true">

  <sd:div id="one" label="Tab 1" theme="ajax" >
      <s:form action="/comment/commentListAction">
      	<s:hidden name="showboard_num" value="%{resultClass.showboard_num}" />
      	<s:submit />
      </s:form>
  </sd:div>

  <sd:div id="two" label="Tab 2" theme="ajax" >
   <s:form   action="tab2action">
       <s:submit />
   </s:form>
  </sd:div>
 </sd:tabbedpanel> --%>