<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null) loggedIn = false;
%>

<header class="header">
    <div class="container header-inner">
        <a href="<%=request.getContextPath()%>/index.jsp?page=home" class="logo">
            <div class="logo-badge">M</div>
            <div style="font-size:18px;font-weight:800;">Moneyvation</div>
        </a>

        <div class="flex gap-12">
            <% if (!loggedIn) { %>
            <form action="<%=request.getContextPath()%>/pages/loginAction.jsp" method="post">
                <button class="btn btn-ghost" type="submit">Login</button>
            </form>
            <button class="btn btn-primary" type="button"
                    onclick="alert('Sign up functionality would be implemented here');">
                Sign Up
            </button>
            <% } else { %>
            <a class="btn btn-outline" href="<%=request.getContextPath()%>/index.jsp?page=my-page">My Page</a>
            <form action="<%=request.getContextPath()%>/pages/logoutAction.jsp" method="post">
                <button class="btn btn-ghost" type="submit">Logout</button>
            </form>
            <% } %>
        </div>
    </div>
</header>
