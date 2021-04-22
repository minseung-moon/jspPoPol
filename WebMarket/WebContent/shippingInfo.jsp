<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배송 정보</title>
<style>
	.main .banner .container h1 {
		font-size : 8vw;
	}
	.content form, input {
		font-size : 1.3rem;
	}
	.content form div {
		margin : 20px 0;
	}
	.content form label {
		display : inline-block;
		width: 100px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
		<div class="main">
		<div class="banner">
			<div class="container">
				<h1>배송 정보</h1>
			</div>
		</div>

		<div class="content">
			<div class="container">
				
				<form action="./processShippingInfo.jsp" method="post">
					<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" required="required" />
					<div>
						<label for="name">성명</label>
						<input name="name" type="text" id="name" required="required">
					</div>
					<div>
						<label for="shippingDate">배송일</label>
						<input name="shippingDate" type="text" id="shippingDate" required="required">
					</div>
					<div>
						<label for="country">국가명</label>
						<input name="country" type="text" id="country" required="required">
					</div>
					<div>
						<label for="zipCode">우편번호</label>
						<input name="zipCode" type="text" id="zipCode" required="required">
					</div>
					<div>
						<label for="addressName">주소</label>
						<input name="addressName" type="text" id="addressName" required="required">
					</div>
					<div>
						<div>
							<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn" role="button">이전</a>
							<input type="submit" class="btn btn-secondary" value="등록"/>
							<a href="./checkOutCancelled.jsp" class="btn" role="button">취소</a>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>