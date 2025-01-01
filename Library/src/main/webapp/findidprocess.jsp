<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="header2.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
    <style>
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
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        h1 {
            margin-top: 0;
            color: #333;
        }
        p {
            color: #666;
        }
        .error {
            color: red;
        }
        .success {
            color: green;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        button:hover {
            opacity: 0.8;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>아이디 찾기 결과</h1>
        <%
            String email = request.getParameter("email");
            String userId = null;

            if (email != null && !email.trim().isEmpty()) {
                try {
                    // JDBC 연결
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

                    // SQL 쿼리 준비
                    String sql = "SELECT id FROM users WHERE email = ?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, email);

                    // 쿼리 실행 및 결과 처리
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
                        userId = rs.getString("id"); // 'id' 열 이름을 사용
            %>
                        <p class="success">찾으신 아이디는 <strong><%= userId %></strong> 입니다.</p>
                        <form action="login.jsp" method="get">
                            <button type="submit">로그인으로 이동</button>
                        </form>
                        <a href="findid.jsp" class="hidden">돌아가기</a>
            <%
                    } else {
            %>
                        <p class="error">해당 이메일에 일치하는 아이디를 찾을 수 없습니다.</p>
                        <a href="findid.jsp" class="back-link">돌아가기</a>
            <%
                    }
                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
            %>
                    <p class="error">오류가 발생했습니다. 다시 시도해 주세요.</p>
                    <a href="findid.jsp" class="back-link">돌아가기</a>
            <%
                }
            } else {
            %>
                <p class="error">입력 정보가 올바르지 않습니다.</p>
                <a href="findid.jsp" class="back-link">돌아가기</a>
            <%
            }
            %>
        </div>
</body>
</html>
