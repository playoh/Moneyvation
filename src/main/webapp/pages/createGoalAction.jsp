<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    // 폼 데이터 받기
    String title = request.getParameter("title");
    String description = request.getParameter("description");

    // TODO: 나중에 DB INSERT 처리

%>

<script>
    alert("Your goal has been successfully published!");
    location.href = "<%=request.getContextPath()%>/index.jsp?page=home";
</script>
