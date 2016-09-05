<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function Success(){
	alert("이용해주셔서 감사합니다");
	window.close;
	window.location.href="/showcase/sclist.action";
}
</script>

	<script>
		Success()
	</script>
