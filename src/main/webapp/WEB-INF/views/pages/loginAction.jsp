<%@ page contentType="text/html; charset=UTF-8" %>
<%
    session.setAttribute("isLoggedIn", true);
    response.sendRedirect(request.getContextPath() + "/");
%>
