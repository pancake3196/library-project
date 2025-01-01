<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>책 장바구니 추가</title>
</head>
<body>
    <%
        String userId = (String) session.getAttribute("loggedInUser");
        String bookId = request.getParameter("book_id");

        if (userId == null || bookId == null) {
            out.println("로그인 후 이용해 주세요.");
        } else {
            try {
                // JDBC 연결
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

                // Get or Create Cart for the User
                String getCartSql = "SELECT cart_id FROM carts WHERE user_id = ?";
                PreparedStatement getCartStmt = conn.prepareStatement(getCartSql);
                getCartStmt.setString(1, userId);
                ResultSet cartRs = getCartStmt.executeQuery();

                int cartId;
                if (cartRs.next()) {
                    cartId = cartRs.getInt("cart_id");
                } else {
                    // Create a new Cart
                    String createCartSql = "INSERT INTO carts (user_id) VALUES (?) RETURNING cart_id INTO ?";
                    PreparedStatement createCartStmt = conn.prepareStatement(createCartSql);
                    createCartStmt.setString(1, userId);
                    createCartStmt.registerOutParameter(2, Types.INTEGER);
                    createCartStmt.executeUpdate();
                    cartId = createCartStmt.getInt(2);
                    createCartStmt.close();
                }
                getCartStmt.close();
                cartRs.close();

                // Add Book to Cart
                String addBookSql = "INSERT INTO cart_items (cart_id, book_id) VALUES (?, ?)";
                PreparedStatement addBookStmt = conn.prepareStatement(addBookSql);
                addBookStmt.setInt(1, cartId);
                addBookStmt.setInt(2, Integer.parseInt(bookId));
                addBookStmt.executeUpdate();
                addBookStmt.close();

                conn.close();
                out.println("책이 장바구니에 추가되었습니다.");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("오류가 발생했습니다.");
            }
        }
    %>
</body>
</html>