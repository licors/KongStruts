<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 상품 삭제 성공</title>
<script>
	function Delete(){
		alert("해당상품 삭제되었습니다.");
		window.location.href='basketL.action?currentPage=<s:property value="currentPage"/>'
	}
</script>
</head>
<body>
<script>
Delete()
</script>
</body>
</html>