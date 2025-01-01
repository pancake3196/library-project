<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>도서 관리 시스템</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: 0 auto;
        }

        main {
            margin: 20px 0;
        }

        main h2 {
            margin-top: 0;
            color: #333;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            position: relative;
        }

        main h2:before {
            content: '';
            display: block;
            width: 50px;
            height: 4px;
            background-color: #007bff;
            position: absolute;
            bottom: -2px;
            left: 0;
        }

        form {
            display: flex;
            justify-content: center;
            margin: 20px 0;
            transition: transform 0.2s;
        }

        form:hover {
            transform: scale(1.05);
        }

        form input[type="text"] {
            width: 60%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px 0 0 5px;
            outline: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        form button {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        form button:hover {
            background-color: #0056b3;
        }

        .book-list {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .book-list li {
            list-style: none;
            margin: 0;
            padding: 20px;
            width: 200px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            border-radius: 10px;
            transition: transform 0.2s;
        }

        .book-list li:hover {
            transform: scale(1.05);
        }

        .book-list li img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .book-list li h3 {
            margin: 10px 0 5px;
            font-size: 18px;
            color: #333;
        }

        .book-list li p {
            margin: 0;
            color: #666;
        }

        .book-list li .btn {
            display: inline-block;
            margin-top: 10px;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.2s;
        }

        .book-list li .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <main>
            <h2>도서 검색</h2>
	            <form action="searchResults.jsp" method="get">
	                <input type="text" name="query" placeholder="도서명 또는 저자명 입력">
	                <button type="submit">검색</button>
	            </form>

            <h2>인기 도서</h2>
            <ul class="book-list">
                <!-- 예시 도서 목록 -->
                <li>
                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791168473690.jpg" alt="도서 1">
                    <h3>세이노의 가르침</h3>
                    <p>저자: 세이노</p>
                    <a href="bookDetails.jsp?book_id=1001&ID=<%=id %>" class="btn">자세히 보기</a>
                </li>
                <li>
                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9788998441012.jpg" alt="도서 2">
                    <h3>모순</h3>
                    
                    <p>저자: 양귀자</p>
                    <a href="bookDetails.jsp?book_id=1002&ID=<%=id %>" class="btn">자세히 보기</a>
                </li>
                <li>
                    <img src="https://i.namu.wiki/i/lMcib4eBx727IuXQg9Qxp1QPhJNPQV-Tw6Lmz8HeODXh6ghJK_ShfYYjCG1ZwelVVYPOINXxvOuitS4j9QBGOw.webp" alt="도서 3">
                    <h3>회색인간</h3>
                    <p>저자: 김동식</p>
                    <a href="bookDetails.jsp?book_id=1003&ID=<%=id %>" class="btn">자세히 보기</a>
                </li>
            </ul>
        </main>
        <br>
        <br>
        <br>
    </div>


</body>
</html>
