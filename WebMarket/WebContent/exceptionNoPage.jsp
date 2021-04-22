<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>페이지 오류</title>
<style>
	.banner .container {
		height : 100%;
		display: flex;
		align-items : center;
	}
	.banner .container .banner_error {
		background-color: #fc8686;
		color : #d12c2c;
		height: 7vw;
		width : 100%;
		font-size : 5vw;
		overflow: hidden;
		line-height: 1.5;
	}
	p {
		margin : 30px 0;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="main">
		<div class="banner">
			<div class="container">
				<h2 class="banner_error">요청하신 페이지를 찾을 수 없습니다.</h2>
			</div>
		</div>

		<div class="content">
			<div class="container">
				<p><%=request.getRequestURI() %></p>
				<p><a href="products.jsp" class="btn">상품 목록&raquo;</a>
			</div>
		</div>
	</div>
</body>
</html>