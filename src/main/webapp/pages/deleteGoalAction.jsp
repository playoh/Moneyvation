<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String goalId = request.getParameter("goalId");
    // TODO: DB DELETE where id=goalId

    response.getWriter().println("<script>alert('삭제 완료!'); location.href='"
            + request.getContextPath() + "/index.jsp?page=my-page&tab=my-goals';</script>");
%>
