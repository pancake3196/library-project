<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession userSession = request.getSession();

String id = (String) userSession.getAttribute("id");
String username = (String) userSession.getAttribute("username");
String password = (String) userSession.getAttribute("password");
String email = (String) userSession.getAttribute("email");
String role = (String) userSession.getAttribute("role");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

// SQL 쿼리 준비
String sql = "delete from users where id = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);

pstmt.executeUpdate();    
pstmt.close();
conn.close();

// 세션 무효화
userSession.invalidate();
%>
</body>
<script type="text/javascript">
alert("탈퇴가 완료되었습니다");

    window.location.href = 'index.jsp';

</script>
</html>
