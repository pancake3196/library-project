<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 - 도서 관리 시스템</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

.container {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
}

input[type="text"], input[type="password"], input[type="email"] {
	width: calc(100% - 22px);
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button {
	width: calc(100% - 22px);
	padding: 10px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #555;
}
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="container">
		<h2>회원가입</h2>
		<form action="registerpro.jsp" method="post" name="frm">
			<label for="id1">사용자 ID:</label>
			<input type="text" id="id1" name="id1" required>
			
			<label for="username">사용자명:</label>
			<input type="text" id="username" name="username" required>
			
			<label for="password">비밀번호:</label>
			<input type="password" id="password" name="password" required>
			
			<label for="email">이메일:</label>
			<input type="email" id="email" name="email" required>
			
			<input type="hidden" name="role" value="user">
			<button type="submit">가입하기</button>
		</form>
	</div>
</body>
</html>
