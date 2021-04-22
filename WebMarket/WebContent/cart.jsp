<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String cartId = session.getId();
%>
<title>장바구니</title>
<style>
	.main .banner .container h1 {
		font-size : 8vw;
	}
	.btn-group {
		height: 100px;
		line-height: 100px;
	}
	.product-table {
		border-collapse: collapse;
		width: 100%;
	}
	.product-table td, th {
		border-top : 1px solid black;
		text-align: center;
		height: 50px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="main">
		<div class="banner">
			<div class="container">
				<h1>장바구니</h1>
			</div>
		</div>

		<div class="content">
			<div class="container">
				<div class="row">
					<table width="100%">
						<tr class="btn-group">
							<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger" >삭제하기</a></td>
							<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success" >주문하기</a></td>
						</tr>
					</table>
				</div>
				
				<div style="padding-top: 50px">
					<table class="product-table">
						<tr>
							<th>상품</th>
							<th>가격</th>
							<th>수량</th>
							<th>소계</th>
							<th>비고</th>
						</tr>
						<%
							int sum = 0;
							ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
							if(cartList == null)
								cartList = new ArrayList<Product>();
							for(int i = 0; i < cartList.size(); i++) { // 상품 리스트 하나씩 출력하기
								Product product = cartList.get(i);
								int total = product.getUnitPrice() * product.getQuantity();
								sum = sum+total;
						%>
						<tr>
							<td><%=product.getProductId() %> - <%=product.getPname() %></td>
							<td><%=product.getUnitPrice() %></td>
							<td><%=product.getQuantity() %></td>
							<td><%=total %></td>
							<td><a href="./removeCart.jsp?id=<%=product.getProductId() %>" class="btn">삭제</a></td>
						</tr>
						<%
							}
						%>
						<tr>
							<th></th>
							<th></th>
							<th>총액</th>
							<th><%=sum %></th>
							<th></th>
						</tr>
					</table>
				</div>
				<div class="btn-group">
						<a href="./products.jsp" class="btn">&laquo; 쇼핑 계속하기</a>
					</div>
				<hr>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>