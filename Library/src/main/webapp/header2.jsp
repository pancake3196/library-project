<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            text-align: center;
        }
        .logo img {
            max-width: 200px; /* 로고 이미지 최대 너비 */
            display: block;
            margin: 0 auto; /* 이미지를 가운데 정렬 */
        }
    </style>
</head>
<%

%>
<body>
    <header>
        <div class="logo">
        <a href="index.jsp">
            <img src="data:image/png;base64,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" alt="도서 관리 시스템 로고">
        </a></div>
    </header>
    <footer>
    <p>&copy; 2024 도서 관리 시스템. 모든 권리 보유.</p>
</footer>

<style>
    footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: -10px 0;
        position: fixed;
        bottom: 0;
        width: 100%;
        box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
    }
</style>
</body>
</html>
