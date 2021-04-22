<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String Shipping_cartId = "";
	String Shipping_name = "";
	String Shipping_shippingDate = "";
	String Shipping_country = "";
	String Shipping_zipCode = "";
	String Shipping_addressName = "";

	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				Shipping_cartId = URLDecoder.decode(
						thisCookie.getValue(), "utf-8");
			if (n.equals("Shipping_name"))
				Shipping_name = URLDecoder.decode(
						thisCookie.getValue(), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				Shipping_shippingDate = URLDecoder.decode(
						thisCookie.getValue(), "utf-8");
			if (n.equals("Shipping_country"))
				Shipping_country = URLDecoder.decode(
						thisCookie.getValue(), "utf-8");
			if (n.equals("Shipping_zipCode"))
				Shipping_zipCode = URLDecoder.decode(
						thisCookie.getValue(), "utf-8");
			if (n.equals("Shipping_addressName"))
				Shipping_addressName = URLDecoder.decode(
						thisCookie.getValue(), "utf-8");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 정보</title>
<style>
.main .banner .container h1 {
	font-size: 8vw;
}

.content form, input {
	font-size: 1.3rem;
}

.content form div {
	margin: 20px 0;
}

.content form label {
	display: inline-block;
	width: 100px;
}

.receipt {
	width: 500px;
	margin: 50px auto;
	background-color: #00e0d9;
	color: #009c97;
	text-align: center;
}

.receipt h2 {
	padding: 15px 0;
}
.receipt table {
	width: 100%;
}
.receipt .btn-group {
	text-align: left;
	height: 100px;
	line-height: 100px;
}
.receipt .btn-group .btn:first-child {
	margin-left: 10px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="main">
		<div class="banner">
			<div class="container">
				<h1>주문 정보</h1>
			</div>
		</div>

		<div class="content">
			<div class="container">
				<div class="receipt">
					<div>
						<h2>영수증</h2>
					</div>
					<div>
						<div align="left">
							<strong>배송 주소</strong> <br> 성명 :
							<%
 	out.println(Shipping_name);
 %>
							<br> 우편번호 :
							<%
								out.println(Shipping_zipCode);
							%><br> 주소 :
							<%
								out.println(Shipping_name);
							%>(<%
								out.println(Shipping_country);
							%>)<br>
						</div>
						<div align="right">
							<p>
								<em>배송일 : <%
									out.println(Shipping_shippingDate);
								%></em>
							</p>
						</div>
					</div>
					<div>
						<table>
							<tr>
								<th>도서</th>
								<th>#</th>
								<th>가격</th>
								<th>소계</th>
							</tr>
							<%
								int sum = 0;
								ArrayList<Product> cartList = (ArrayList<Product>) session
										.getAttribute("cartlist");
								if (cartList == null)
									cartList = new ArrayList<Product>();
								for (int i = 0; i < cartList.size(); i++) { // 상품 리스트 하나씩 출력하기
									Product product = cartList.get(i);
									int total = product.getUnitPrice() * product.getQuantity();
									sum += total;
							%>
							<tr>
								<td><em><%=product.getPname()%></em></td>
								<td><%=product.getQuantity()%></td>
								<td><%=product.getUnitPrice()%>원</td>
								<td><%=total%>원</td>
							</tr>
							<%
								}
							%>
							<tr>
								<td></td>
								<td></td>
								<td><strong>총액 : </strong></td>
								<td><strong><%=sum%></strong></td>
							</tr>
						</table>

						<div class="btn-group">
							<a href="./shippingInfo.jsp?cartId=<%=Shipping_cartId%>"
								class="btn" role="button">이전</a> <a href="./thankCustomer.jsp"
								class="btn btn-success" role="button">주문완료</a> <a
								href="./checkOutCancelled.jsp" class="btn" role="button">취소</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>