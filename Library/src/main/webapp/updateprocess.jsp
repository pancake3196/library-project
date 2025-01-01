<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%
    // 파라미터로부터 book_id와 action을 가져옵니다.
    String bookId = request.getParameter("book_id");
    String action = request.getParameter("action");

    // book_id와 action이 유효한 경우에만 처리합니다.
    if (bookId != null && !bookId.trim().isEmpty() && action != null) {
        try {
            // JDBC 연결 설정
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

            String sql = "";
            if ("loan".equals(action)) {
                // 대출 처리 SQL 쿼리
                sql = "UPDATE books SET loan_status = 0 WHERE book_id = ?";
            } else if ("return".equals(action)) {
                // 반납 처리 SQL 쿼리
                sql = "UPDATE books SET loan_status = 1 WHERE book_id = ?";
            }

            if (!sql.isEmpty()) {
                // SQL 쿼리 실행
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(bookId));
                pstmt.executeUpdate();
                pstmt.close();
            }

            // 연결 닫기
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 요청 완료 후 bookdetails.jsp로 리디렉션합니다.
    response.sendRedirect("bookDetails.jsp?book_id=" + bookId);
%>
