<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    // 현재 세션을 무효화합니다.
    HttpSession currentSession = request.getSession(false); // 기존 세션이 있으면 가져옴
    if (currentSession != null) {
        currentSession.invalidate(); // 세션 무효화
    }
    
    // 로그인 페이지로 리다이렉트합니다.
    response.sendRedirect("index.jsp");
%>
