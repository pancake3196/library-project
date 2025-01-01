<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - 도서 관리 시스템</title>
    <jsp:include page="header2.jsp"></jsp:include>
    
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
            padding-right: 40px;
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
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 105%;
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
        .error-message {
            color: red;
            text-align: center;
        }
        .form-bottom-links {
            text-align: center;
            margin-top: 20px;
        }
        .form-bottom-links a {
            color: #333;
            text-decoration: none;
            margin: 0 10px;
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
<br>
    <div class="container">
        <h2>로그인</h2>
        <%-- 로그인 실패 시 에러 메시지 출력 --%>
        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <p class="error-message"><%= error %></p>
        <%
            }
        %>
        <form action="loginprocess.jsp" method="post">
            <label for="username">아이디</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">로그인</button>
        </form>
        
        <div class="form-bottom-links">
            <a href="findid.jsp">아이디 찾기</a>
            <a href="find-password.jsp">비밀번호 찾기</a>
            <a href="register.jsp">회원가입</a>
        </div>
    </div>
</body>
</html>
