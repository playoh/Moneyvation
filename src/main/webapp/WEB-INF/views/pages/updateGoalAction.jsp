<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";

    // 입력값 받기
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String duration = request.getParameter("duration");
    String verification = request.getParameter("verification");
    String minBet = request.getParameter("minBet");
    String allowFailure = request.getParameter("allowFailure");

    // TODO: 실제 DB UPDATE 처리 (goalId 기준)
%>

<script>
    alert("목표가 성공적으로 수정되었습니다!");
    location.href = "../index.jsp";
</script>
