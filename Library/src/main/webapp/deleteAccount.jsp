<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>


<%@include file="header.jsp" %>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<main>
    <div class="delete-account-container">
        <h2>계정 탈퇴</h2>
        <form action="deletepro.jsp">
            <p>정말로 계정을 탈퇴하시겠습니까?</p>
            <button type="submit" class="delete-account-button">계정 탈퇴</button>
        </form>
    </div>
</main>

<footer>

    </div>
</footer>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .header-container, .footer-container {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px 0;
    }
    .header-container a, .footer-container p {
        margin: 0;
        padding: 0;
    }
    .logo img {
        height: 50px;
    }
    .login-box {
        display: inline-block;
        float: right;
        margin-right: 20px;
    }
    .login-button, .logout-button {
        background-color: #555;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border: none;
        cursor: pointer;
    }
    .login-button:hover, .logout-button:hover {
        background-color: #777;
    }
    .delete-account-container {
        background-color: #fff;
        padding: 20px;
        max-width: 400px;
        margin: 50px auto;
        border: 1px solid #ddd;
        text-align: center;
    }
    .delete-account-button {
        background-color: #d9534f;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
    }
    .delete-account-button:hover {
        background-color: #c9302c;
    }
</style>
