<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String msg = request.getParameter("msg");
    if ("loginRequired".equals(msg)) {
%>
<script>alert('Please login to create a goal');</script>
<% } %>

<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        // React의 "Please login to create a goal" 대응
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    // 목업: 실제로는 addGoal.jsp로 보내면 됨
    response.getWriter().println("<script>alert('Create goal functionality would be implemented here'); location.href='"
            + request.getContextPath() + "/index.jsp?page=my-page';</script>");
%>
