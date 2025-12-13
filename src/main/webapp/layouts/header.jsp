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
                <button class="btn btn-ghost" type="submit">로그인</button>
            </form>
            <button class="btn btn-primary" type="button"
                    onclick="alert('회원가입 기능이 이 자리에서 구현될 예정입니다.');">
                회원가입
            </button>
            <% } else { %>
            <a class="btn btn-outline" href="<%=request.getContextPath()%>/index.jsp?page=my-page">마이페이지</a>
            <form action="<%=request.getContextPath()%>/pages/logoutAction.jsp" method="post">
                <button class="btn btn-ghost" type="submit">로그아웃</button>
            </form>
            <% } %>
        </div>
    </div>
</header>
