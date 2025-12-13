<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";

    // 수정 폼 데이터 받기
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String duration = request.getParameter("duration");
    String verification = request.getParameter("verification");
    String minBet = request.getParameter("minBet");
    String allowFailure = request.getParameter("allowFailure");

    // TODO: 나중에 DB UPDATE 처리 (goalId 기준)
%>

<script>
    alert("Goal has been updated successfully!");
    location.href = "<%=request.getContextPath()%>/index.jsp?page=goal-detail&goalId=<%=goalId%>";
</script>
