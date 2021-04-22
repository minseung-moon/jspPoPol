<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<style>
.formWarp {
	display: flex;
	flex-direction: column;
	justify-content : center;
	align-items : center;
	padding-top : 20px;
}
.loginError {
	width : 300px;
	text-align : center;
	padding : 5px 0;
	color : #ff0000;
	font-weight : bold;
	background-color : #f79797;
	border-radius : 5px;
}
.formWarp form {
	text-align : center;
}
.formWarp label {
	display : none;
}
.formWarp input {
	width : 300px;
	font-size : 24px;
	margin : 10px;
}
.formWarp button {
	width : 300px;
	background-color : #42bd62;
	border-color: #6eff94;
	font-size : 20px;
	font-weight : bold;
	padding : 5px 0;
}
.formWarp button:hover {
	background-color : #2b753f;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="main">
		<div class="banner">
			<div class="container">
				<h1>로그인</h1>
			</div>
		</div>
		
		<div class="container">
			<div class="formWarp">
				<h3>Please sign in</h3>
				<%
					String error = request.getParameter("error");
					if (error != null) {
						out.println("<div class='loginError'>");
						out.println("아이디와 비밀번호를 확인해주세요");
						out.println("</div>");
					}
				%>
				<form action="j_security_check" method="post">
					<div>
						<label for="inputUserNmae">User Name</label>
						<input type="text" placeholder="ID" name="j_username" required autofocus>
					</div>
					<div>
						<label for="inputPassword">Password</label>
						<input type="password" placeholder="Password" name="j_password"  required>
					</div>
					<button class="btn" type="submit">로그인</button>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>