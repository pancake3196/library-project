<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 처리</title>
</head>
<body>
    <%
    
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // JDBC 드라이버 로드
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // 데이터베이스 연결
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

                // 비밀번호 비교 쿼리
                String sql = "SELECT * FROM users WHERE id = ? AND password = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String id = rs.getString("id");
                    String dbUsername = rs.getString("username");
                    String email = rs.getString("email");
                    String role = rs.getString("role");

                    // 로그인 성공
                    HttpSession userSession = request.getSession();
                    userSession.setAttribute("id", id);
                    userSession.setAttribute("username", dbUsername);
                    userSession.setAttribute("email", email);
                    userSession.setAttribute("role", role);
                    response.sendRedirect("index.jsp");
                } else {
                    // 로그인 실패
                    response.sendRedirect("login.jsp?error=" + URLEncoder.encode("아이디 또는 비밀번호가 잘못되었습니다.", "UTF-8"));
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("login.jsp?error=" + URLEncoder.encode("로그인 처리 중 오류가 발생했습니다. 다시 시도해 주세요.", "UTF-8"));
            } finally {
                // 자원 해제
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        } else {
            // 입력값이 없을 경우
            response.sendRedirect("login.jsp?error=" + URLEncoder.encode("아이디와 비밀번호를 입력해 주세요.", "UTF-8"));
        }
    %>
</body>
</html>
