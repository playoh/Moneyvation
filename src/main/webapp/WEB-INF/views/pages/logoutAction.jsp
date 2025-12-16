<%@ page contentType="text/html; charset=UTF-8" %>
<%
    session.setAttribute("isLoggedIn", false);
    response.sendRedirect(request.getContextPath() + "/");
%>
