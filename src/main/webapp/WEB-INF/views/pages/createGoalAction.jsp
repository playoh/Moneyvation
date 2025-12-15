<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String title = request.getParameter("title");
    String description = request.getParameter("description");

    // TODO: DB INSERT 후 생성된 goalId를 받아 상세 페이지로 이동하도록 구현
    String newGoalId = "1"; // 목업
%>

<script>
    alert("목표가 성공적으로 발행되었습니다!");
    location.href = "../../../index.jsp";
</script>
