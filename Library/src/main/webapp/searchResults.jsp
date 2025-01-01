<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="header2.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서 검색 결과</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

.container {
	max-width: 800px;
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

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
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
	<div class="container">
		<h2>도서 검색 결과</h2>
		<%-- 입력된 검색어(query)를 가져옵니다 --%>
		<%
		
            String query = request.getParameter("query");
            if (query != null && !query.trim().isEmpty()) {
                try {
                    // JDBC 연결
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

                    // SQL 쿼리 준비
                    String sql = "SELECT * FROM books WHERE book_title LIKE ? OR author LIKE ?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, "%" + query + "%");
                    pstmt.setString(2, "%" + query + "%");

                    // 쿼리 실행 및 결과 처리
                    ResultSet rs = pstmt.executeQuery();
        %>
		<table>
			<tr>
				<th>도서 번호</th>
				<th>도서 제목</th>
				<th>저자</th>
			</tr>
			<%            
			HttpSession userSession = request.getSession();

			String id = (String) userSession.getAttribute("id");
			String username = (String) userSession.getAttribute("username");
			String password = (String) userSession.getAttribute("password");
			String email = (String) userSession.getAttribute("email");
			String role = (String) userSession.getAttribute("role");
                    while (rs.next()) {
        %>
			<tr>
				<td><a
					href="bookDetails.jsp?book_id=<%= rs.getInt("book_id")%>&id=<%=id%>"><%= rs.getInt("book_id") %></a></td>
				<td><%= rs.getString("book_title") %></td>
				<td><%= rs.getString("author") %></td>
			</tr>
			<%          
                    }
                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
        %>
			<p>검색어를 입력하세요.</p>
			<% } %>
		</table>
	</div>
</body>
</html>
