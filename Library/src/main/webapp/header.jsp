<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%
    // 세션에서 사용자 정보 가져오기
        HttpSession userSession = request.getSession();
      
        String id = (String) userSession.getAttribute("id");
        String username = (String) session.getAttribute("username");
        String password = (String) userSession.getAttribute("password");
        String email = (String) userSession.getAttribute("email");
        String role = (String) userSession.getAttribute("role");
%>

<header>
    <div class="header-container">
        <div class="logo">
            <a href="index.jsp">
                <img src="https://i.namu.wiki/i/sBmPxzkd_SlLW_oKHDTe0jKFVsWZJVsm697rRc8LLjw53B6iYS3Lcal5wCJdcgFQD8ZI9AtiuBcolZ2RLZW0m9yymPYFrDXyoDMn3Iy8VtxZc6HLTbpvFfFix71Gl5S0kw6mbg7pDNX37izIC4zIKA.svg"  alt="도서 관리 시스템 로고">
            </a>
        </div>
        <div class="title">
            <h1>짭풍문고</h1>
        </div>
        <div class="user-info">
        <% 

        %>
            <p>환영합니다 <%= username != null ? username : "guest" %></p>
            <nav>
                <ul>
                    <% if (username != null) { %>
                        <li class="dropdown">
                            <a href="#">내 정보</a>
                            <div class="dropdown-content">
                                <a href="profile.jsp"style="color: black;">유저정보 수정</a>
<a href="deleteAccount.jsp" style="color: black;">회원탈퇴</a>



                            </div>
                        </li>
                        <li><a href="logout.jsp">로그아웃</a></li>
                    <% } else { %>
                        <li><a href="login.jsp">로그인</a></li>
                    <% } %>
                </ul>
            </nav>
        </div>
    </div>
</header>
<footer>
    <p>&copy; 2024 도서 관리 시스템. 모든 권리 보유.</p>
</footer>

<style>
    footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px 0; /* padding 값 수정 */
        position: fixed;
        bottom: 0;
        width: 100%;
        box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
    	z-index: 3;
    }
</style>

<style>
    header {
        background-color: #333;
        color: #fff;
        padding: 10px 0;
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        z-index: 1000;
    }

    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 80%;
        margin: 0 auto;
    }

    .logo img {
        height: 30px; /* 로고의 높이를 조정 */
        margin-right: 10px;
    }

    .title h1 {
        margin: 0;
        font-size: 24px;
    }

    .user-info {
        position: relative; /* 드롭다운을 위한 상대 위치 설정 */
    }

    .user-info p {
        margin: 0;
    }

    .user-info nav ul {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
    }

    .user-info nav ul li {
        margin-left: 10px;
        position: relative; /* 드롭다운을 위한 상대 위치 설정 */
    }

    .user-info nav ul li a {
        color: #fff;
        text-decoration: none;
        transition: color 0.2s;
    }

    .user-info nav ul li a:hover {
        color: #007bff;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        top: 100%; /* 메뉴 항목 바로 아래에 위치 */
        left: 0;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        transition: background-color 0.3s;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }
</style>
