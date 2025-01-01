<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="header.jsp" %>

<%
    // 데이터베이스 연결 정보
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "system";
    String dbPassword = "1234";

    // 사용자 이름을 세션에서 가져오기
   

    // 사용자 이름이 세션에 없으면 로그인 페이지로 리다이렉트
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 프로필 업데이트 처리
    String action = request.getParameter("action");
    if ("update".equals(action)) {
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String updateSql = "UPDATE users SET email = ?, password = ? WHERE username = ?";
            pstmt = conn.prepareStatement(updateSql);
            pstmt.setString(1, newEmail);
            pstmt.setString(2, newPassword); // 비밀번호를 해시 없이 저장하는 경우
            pstmt.setString(3, username);
            pstmt.executeUpdate();

            out.println("<script>alert('프로필이 업데이트되었습니다.'); location.href='profile.jsp';</script>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<script>alert('JDBC 드라이버를 찾을 수 없습니다.'); location.href='index.jsp';</script>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('데이터베이스 오류가 발생했습니다.'); location.href='index.jsp';</script>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 사용자 정보 조회
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        String sql = "SELECT * FROM users WHERE username = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String email1 = rs.getString("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        main {
            display: flex;
            justify-content: center;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .container {
            width: 100%;
            max-width: 600px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .title {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .btn-submit {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #0056b3;
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
    <main>
        <div class="container">
            <h1 class="title">프로필</h1>
            <form action="profile.jsp" method="post" class="form">
                <input type="hidden" name="action" value="update">

                <div class="form-group">
                    <label for="username">아이디:</label>
                    <input type="text" id="username" name="username" value="<%= id %>" readonly>
                </div>

                <div class="form-group">
                    <label for="email">이메일:</label>
                    <input type="email" id="email" name="email" value="<%= email1 %>" required>
                </div>

                <div class="form-group">
                    <label for="password">비밀번호:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <button type="submit" class="btn-submit">수정</button>
            </form>
        </div>
    </main>
</body>
</html>
<%
        } else {
            out.println("<script>alert('사용자 정보를 찾을 수 없습니다.'); location.href='index.jsp';</script>");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>alert('JDBC 드라이버를 찾을 수 없습니다.'); location.href='index.jsp';</script>");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>alert('데이터베이스 오류가 발생했습니다.'); location.href='index.jsp';</script>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
