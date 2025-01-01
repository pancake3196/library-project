<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="header.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 상세 정보</title>
    <style>
        /* CSS 스타일링 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            flex-direction: row;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 80%;
            max-width: 1000px;
        }

        .book-details {
            flex: 2;
            padding: 20px;
        }

        .book-cover {
            flex: 1;
            padding: 20px;
            text-align: center;
            background-color: #f9f9f9;
        }

        .book-cover img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        h1 {
            margin-top: 0;
            color: #333;
            font-size: 24px;
        }

        h2 {
            margin-top: 0;
            color: #333;
        }

        p {
            color: #666;
        }

        .loan-status {
            font-size: 18px;
            font-weight: bold;
        }

        .loan-status.available {
            color: green;
        }

        .loan-status.unavailable {
            color: red;
        }

        button {
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button.available {
            background-color: #007bff;
        }

        button.unavailable {
            background-color: #dc3545;
        }

        button:hover {
            opacity: 0.8;
        }
    </style>
    <script type="text/javascript">
        function confirmLoan(bookId) {
            if (confirm("대출하시겠습니까?")) {
                window.location.href = "updateprocess.jsp?action=loan&book_id=" + bookId;
            }
        }

        function confirmReturn(bookId) {
            if (confirm("반납하시겠습니까?")) {
                window.location.href = "updateprocess.jsp?action=return&book_id=" + bookId;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="book-details">
            <h1 align="center">도서 상세 정보</h1>
            <%
                String bookId = request.getParameter("book_id");
                String bookTitle = null;
                String author = null;
                String genre = null;
                int loanStatus = -1; // -1: 상태 불명, 0: 대출 중, 1: 대출 가능
                String url = "https://via.placeholder.com/300"; // 기본 이미지 URL

                if (bookId != null && !bookId.trim().isEmpty()) {
                    try {
                        // JDBC 연결
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

                        // SQL 쿼리 준비
                        String sql = "SELECT * FROM books WHERE book_id = ?";
                        PreparedStatement pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, Integer.parseInt(bookId));

                        // 쿼리 실행 및 결과 처리
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {
                            bookTitle = rs.getString("book_title");
                            author = rs.getString("author");
                            genre = rs.getString("genre");
                            loanStatus = rs.getInt("loan_status");

                            // URL 설정
                            switch (bookId) {
                                // 도서 ID에 따라 이미지 URL 설정
                                case "1001":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791168473690.jpg";
                                    break;
                                case "1002":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9788998441012.jpg";
                                    break;
                                case "1003":
                                    url = "https://i.namu.wiki/i/M1N9I-xsn4FpsPDKbordIFuoFiTuapCjLwMezhB2WqtUV-80IAh2pZVVfntJb1iLkt1C7iTQQGUWvg3JHIbTHA.webp";
                                    break;
                                case "1004":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791161571188.jpg";
                                    break;
                                case "1005":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791190538510.jpg";
                                    break;
                                case "1006":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791197647666.jpg";
                                    break;
                                case "1007":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791198013026.jpg";
                                    break;
                                case "1008":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791169791977.jpg";
                                    break;
                                case "1009":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9788936438838.jpg";
                                    break;
                                case "1010":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791188331796.jpg";
                                    break;
                                case "1":
                                    url = "https://qi-b.qoo10cdn.com/partner/goods_image/1/4/1/9/218281419g.jpg";
                                    break;
                                case "2":
                                    url = "https://img.ridicdn.net/cover/509001682/xxlarge";
                                    break;
                                case "3":
                                    url = "https://image.yes24.com/momo/TopCate302/MidCate004/4389012.jpg";
                                    break;
                                case "4":
                                    url = "https://image.yes24.com/momo/TopCate159/MidCate08/15877155.jpg";
                                    break;
                                case "5":
                                    url = "https://i.namu.wiki/i/ooTfcqQ4pbWaQ71nfAp-hNXE6kj8_D9aHwWb7nt2qlWI3byVjecZ7sMy0q0nQ9ofKWc7xLZ9UgXRMCoHQ6LuDm1GM5uvPN9ilnAg0OJcXjowYBeWlTGT34oHAEsOiTWtirFljZzN3Ea2jI2i3nLFCQ.webp";
                                    break;
                                case "6":
                                    url = "https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9788997770267.jpg";
                                    break;
                                case "7":
                                    url = "https://i.namu.wiki/i/W9JIHne2cOVoEweNAmCRtpp2wZ0h6iBQ17TuTjpOxNTDAGleOyc4BzciWfQCTIxfXBRlBSxle7itZbKl19Y-WtOLNGmPtp8BxRHRcti-MFF2VwPA2I_fPy0sICXzGfFlJr9m8htqJ16c5h3jEvxI3joL6qgMjK5w5lRDzWNFMokx4T3_GJ5D01Kxf7M6B9kg.webp";
                                    break;
                                case "8":
                                    url = "https://i.namu.wiki/i/dqGwD8ZZF8QKfwmAfGO1MfMgJTRFKGI8R6RM_fvYXTpKMxjuEFZ0tMTKUdxiUd8IIawawjtK6l9zBahVeUHA3piWoEl4bjv_kLHMPvzHTFGmaTmhl-NFnyJDyE9Ue8Rxjm5ydulm5D8rhcKJAEdCBg.webp";
                                    break;
                                case "9":
                                    url = "https://i.namu.wiki/i/yV5F9uD8KTA_2gD-_6loNtlsNCpHrJst6MqZryTzrbS6ka-BVjSokDzY1FaZuWl-YtKCwWpBOLZB7bK6IcriBl2PiOcXNI7w8FR1lZuxbfzADzgfLXfS6W2TI1TraZrKz7RzQfYwmrMpsp3k9XSIpg.webp";
                                    break;
                                case "10":
                                    url = "https://i.namu.wiki/i/LZhr8VY_0tEamk8wkurBUbSbfX1gntI8cP3JsWIIwzrTV2fV-Og-ja2jYK8gkBx-KL-hoKsJFZXvdyj1ckKVjpYB_Em3h01NObExCZqhMMosRO7gnpozb76Hnqgj2Q8gbL9GGVIEqzpJ2J9ZDNhWfA.webp";
                                    break;
                                case "11":
                                    url = "https://newsimg.sedaily.com/2020/01/03/1YXI66T4XF_3.jpg";
                                    break;
                                case "12":
                                    url = "https://i.namu.wiki/i/BL0qkEWzbiutCuoYSEhEe5LJmEvdLhKf94qyM5RBmsumSLIhkVsrJiGrIrtYoHx_O3qPaPYlxkgLT7lqP0rmLFjVU1UIRnhJRIkH0oRCF9JfGrjSrVMDCRZQhAHTOPkCv8dM4XnPjRTWwAhfm3OrcA.webp";
                                    break;
                                default:
                                    url = "https://via.placeholder.com/300";
                                    break;
                            }
                        } else {
                            bookTitle = "정보 없음";
                            author = "정보 없음";
                            genre = "정보 없음";
                        }
                        rs.close();
                        pstmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        bookTitle = "정보 없음";
                        author = "정보 없음";
                        genre = "정보 없음";
                    }
                } else {
                    bookTitle = "정보 없음";
                    author = "정보 없음";
                    genre = "정보 없음";
                }
            %>
            <h2><%= bookTitle %></h2>
            <p><strong>저자:</strong> <%= author %></p>
            <p><strong>장르:</strong> <%= genre %></p>
            <div class="loan-status <%= loanStatus == 1 ? "available" : "unavailable" %>">
                <%= loanStatus == 1 ? "대출 가능" : "대출 중" %>
            </div>
            <% if (loanStatus == 1) { %>
                <button class="available" onclick="confirmLoan('<%= bookId %>')">대출 신청</button>
            <% } else { %>
                <button class="unavailable" onclick="confirmReturn('<%= bookId %>')">반납하기</button>
            <% } %>
        </div>
        <div class="book-cover">
            <img src="<%= url %>" alt="책 이미지">
        </div>
    </div>
</body>
</html>
