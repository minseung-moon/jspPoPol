<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 취수</title>
<style>
	.content .container {
		margin-top : 30px;
	}
	.content .container .danger {
		background-color: #ff786e;
		color : #ed291a;
		padding : 10px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="main">
		<div class="banner">
			<div class="container">
				<h1>주문 취소</h1>
			</div>
		</div>

		<div class="content">
			<div class="container">
				<h2 class="danger">주문이 취소되었습니다</h2>
			</div>

			<div class="container">
				<p>
					<a href="./products.jsp" class="btn">&laquo; 상품목록</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>