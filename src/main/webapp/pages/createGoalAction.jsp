<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String title = request.getParameter("title");
    String description = request.getParameter("description");

    // TODO: DB INSERT 후 생성된 goalId 받아서 detail로 보내기
    String newGoalId = "1"; // 목업
%>

<script>
    alert("Your goal has been successfully published!");
    location.href = "<%=request.getContextPath()%>/index.jsp?page=goal-detail&goalId=<%=newGoalId%>";
</script>
