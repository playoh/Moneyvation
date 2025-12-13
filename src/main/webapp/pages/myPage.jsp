<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null) loggedIn = false;

    if (!loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home");
        return;
    }

    String activeTab = request.getParameter("tab");
    if (activeTab == null) activeTab = "my-goals";

    // Mock user data
    String nickname = "Sarah Kim";
    int goalsCreated = 3, betsPlaced = 12, winRate = 67, wins = 8, losses = 4;
    int totalProfit = 15000, totalLoss = 6500, netProfit = 8500;
%>

<div class="container" style="padding:48px 24px;">
    <div class="card mb-24" style="background:linear-gradient(135deg,rgba(99,102,241,.06),rgba(79,70,229,.06));">
        <h2 style="margin-bottom:6px;">Hello, <%=nickname%>!</h2>
        <p class="muted">
            You have created <b style="color:var(--color-primary)"><%=goalsCreated%></b> goals
            and placed <b style="color:var(--color-primary)"><%=betsPlaced%></b> bets so far.
        </p>
    </div>

    <div class="grid-3 mb-24">
        <div class="card">
            <div class="small">Betting Win Rate</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;"><%=winRate%>%</div>
            <div class="small"><%=wins%> Wins <%=losses%> Losses</div>
        </div>
        <div class="card" style="background:linear-gradient(135deg,rgba(34,197,94,.06),rgba(34,197,94,.1));">
            <div class="small">Cumulative Profit</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;color:var(--color-success);">+<%=String.format("%,d", totalProfit)%>P</div>
        </div>
        <div class="card" style="background:linear-gradient(135deg,rgba(239,68,68,.06),rgba(239,68,68,.1));">
            <div class="small">Cumulative Loss</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;color:var(--color-danger);">-<%=String.format("%,d", totalLoss)%>P</div>
        </div>
    </div>

    <div class="card mb-24" style="text-align:center;background:linear-gradient(135deg,rgba(34,197,94,.06),rgba(34,197,94,.12));">
        <div class="small" style="margin-bottom:6px;">Net Profit/Loss</div>
        <div style="font-size:42px;font-weight:1000;color:var(--color-success);">+<%=String.format("%,d", netProfit)%>P</div>
    </div>

    <div class="mb-24">
        <div style="display:inline-flex;gap:6px;background:#f1f5f9;border-radius:14px;padding:6px;">
            <a class="btn <%= "my-goals".equals(activeTab) ? "btn-outline" : "btn-ghost" %>"
               href="<%=request.getContextPath()%>/index.jsp?page=my-page&tab=my-goals">My Goals</a>
            <a class="btn <%= "my-bets".equals(activeTab) ? "btn-outline" : "btn-ghost" %>"
               href="<%=request.getContextPath()%>/index.jsp?page=my-page&tab=my-bets">My Bets</a>
            <a class="btn <%= "statistics".equals(activeTab) ? "btn-outline" : "btn-ghost" %>"
               href="<%=request.getContextPath()%>/index.jsp?page=my-page&tab=statistics">Statistics</a>
        </div>
    </div>

    <% if ("my-goals".equals(activeTab)) { %>
    <div class="flex-between mb-16">
        <h2>My Goals</h2>
        <form action="<%=request.getContextPath()%>/pages/createGoalAction.jsp" method="post">
            <button class="btn btn-primary" type="submit">Create Goal</button>
        </form>
    </div>
    <div class="card">목업: 내 목표 리스트 영역</div>

    <% } else if ("my-bets".equals(activeTab)) { %>
    <h2 class="mb-16">My Bets</h2>
    <div class="card">목업: 내 베팅 리스트 영역</div>

    <% } else { %>
    <h2 class="mb-16">Detailed Statistics</h2>
    <div class="grid-2">
        <div class="card">목업: Bet Wins & Losses</div>
        <div class="card">목업: Profit & Loss</div>
    </div>
    <% } %>
</div>
