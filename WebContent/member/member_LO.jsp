
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	function SuccessMessage() {
		alert("'<s:property value="memresultClass.email"/>'님 환영합니다");
		window.location.href = '/showcase/sclist.action';
	}
	
</script>

		<script>
			SuccessMessage()
		</script>
	