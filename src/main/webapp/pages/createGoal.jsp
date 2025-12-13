<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String msg = request.getParameter("msg");
    if ("loginRequired".equals(msg)) {
%>
<script>alert('목표를 만들려면 로그인해주세요.');</script>
<% } %>

<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        // 로그인하지 않은 경우 홈으로 돌려보내며 알림 메시지 전달
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    // 실제 목표 생성 기능은 추후 구현 예정
    response.getWriter().println("<script>alert('목표 생성 기능은 추후 구현될 예정입니다.'); location.href='"
            + request.getContextPath() + "/index.jsp?page=my-page';</script>");
%>
