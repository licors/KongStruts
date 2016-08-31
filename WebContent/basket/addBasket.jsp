<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 상품 추가</title>
<script type="text/javascript">

function Add(){
	alert("장바구니에 상품을 담았습니다.");
	window.location.href='/kong/basket/basketList.action?currentPage=<s:property value="%{currentPage}"/>';
}
</script>
</head>
<body>
<script>
Add()
</script>
</body>
</html>