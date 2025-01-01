<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 결과 - 도서 관리 시스템</title>
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
p {
    text-align: center;
    color: red;
}
</style>
</head>
<body>
    <div class="container">
        <%
        request.setCharacterEncoding("UTF-8");
        String userId = request.getParameter("id1");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        boolean isUsernameTaken = false;
        boolean isEmailTaken = false;

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL

            try (Connection con = DriverManager.getConnection(url, "system", "1234");
                 PreparedStatement pstmtUsername = con.prepareStatement("SELECT COUNT(*) FROM users WHERE id = ?");
                 PreparedStatement pstmtEmail = con.prepareStatement("SELECT COUNT(*) FROM users WHERE email = ?");
                 PreparedStatement pstmtInsert = con.prepareStatement("INSERT INTO users (id, username, password, email, role) VALUES (?, ?, ?, ?, ?)")) {

                // 아이디 중복 확인
                pstmtUsername.setString(1, userId);
                try (ResultSet rs = pstmtUsername.executeQuery()) {
                    if (rs.next()) {
                        isUsernameTaken = rs.getInt(1) > 0;
                    }
                }

                // 이메일 중복 확인
                pstmtEmail.setString(1, email);
                try (ResultSet rs = pstmtEmail.executeQuery()) {
                    if (rs.next()) {
                        isEmailTaken = rs.getInt(1) > 0;
                    }
                }

                // 아이디 또는 이메일이 중복된 경우 처리
                if (isUsernameTaken) {
                    out.println("<h2>회원가입 실패</h2>");
                    out.println("<p>아이디가 이미 존재합니다. 다른 아이디를 선택해 주세요.</p>");
                    out.println("<meta http-equiv='refresh' content='2;url=register.jsp'>");
                } else if (isEmailTaken) {
                    out.println("<h2>회원가입 실패</h2>");
                    out.println("<p>이메일이 이미 존재합니다. 다른 이메일을 사용해 주세요.</p>");
                    out.println("<meta http-equiv='refresh' content='2;url=register.jsp'>");
                } else {
                    // 회원가입 처리
                    pstmtInsert.setString(1, userId);
                    pstmtInsert.setString(2, userName);
                    pstmtInsert.setString(3, password); // 해시화 없이 비밀번호를 그대로 저장
                    pstmtInsert.setString(4, email);
                    pstmtInsert.setString(5, role);
                    int rowsAffected = pstmtInsert.executeUpdate();

                    if (rowsAffected > 0) {
                        out.println("<h2>회원가입 성공</h2>");
                        out.println("<p>환영합니다! 회원가입이 완료되었습니다.</p>");
                        out.println("<meta http-equiv='refresh' content='2;url=login.jsp'>");
                    } else {
                        out.println("<h2>회원가입 실패</h2>");
                        out.println("<p>회원가입 과정에서 문제가 발생했습니다. 다시 시도해 주세요.</p>");
                        out.println("<meta http-equiv='refresh' content='2;url=register.jsp'>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>회원가입 실패</h2>");
            out.println("<p>서버 오류가 발생했습니다. 다시 시도해 주세요.</p>");
            out.println("<meta http-equiv='refresh' content='2;url=register.jsp'>");
        }
        %>
    </div>
</body>
</html>
