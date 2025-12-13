<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";

    // TODO: DB DELETE 처리 (id=goalId)
%>

<script>
    alert("목표 삭제가 완료되었습니다!");
    location.href = "<%=request.getContextPath()%>/index.jsp?page=my-page&tab=my-goals";
</script>
