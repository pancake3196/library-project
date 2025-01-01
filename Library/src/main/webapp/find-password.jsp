<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="header2.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <style>
    
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0; /* Light grey background for the entire page */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .container {
            background-color: #ffffff; /* White background for the container */
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h1 {
            margin-top: 0;
            font-size: 2em;
            color: #333;
        }
        p {
            color: #666;
        }
        input[type="text"] {
            width: calc(100% - 20px); /* Adjusting width to fit padding */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }
        input[type="text"]:focus {
            border-color: #007bff; /* Blue border on focus */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2); /* Subtle shadow on focus */
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }
        .back-link:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>비밀번호 찾기</h1>
        <form action="find-password-process.jsp" method="post">
            <p>아이디를 입력해 주세요.</p>
            <input type="text" name="id" required placeholder="아이디">
            <button type="submit">비밀번호 찾기</button>
        </form>
        <a href="login.jsp" class="back-link">로그인 페이지로 돌아가기</a>
    </div>
</body>
</html>
