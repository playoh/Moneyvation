<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null) loggedIn = false;

    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";

    // Mock goal data
    String title = "Complete Marathon Training for 3 Months";
    String author = "Sarah Kim";
    String description =
            "I will complete a full marathon training program over the next 3 months, running at least 5 times per week and gradually increasing distance. " +
                    "My goal is to build endurance and complete a 42.195km run by the end of this period.";
    int totalParticipants = 24;
    int totalBetAmount = 48500;
    int avgBetAmount = 2020;
    int successRate = 65;
    int failureRate = 35;
%>

<div class="container" style="padding:48px 24px;">
    <a class="btn btn-ghost" href="<%=request.getContextPath()%>/index.jsp?page=home" style="padding:0;">
        ← Back to Goals
    </a>

    <div class="card mt-16 mb-16">
        <div class="flex-between" style="align-items:flex-start;gap:12px;">
            <h1 style="flex:1;"><%=title%></h1>
            <span class="badge badge-primary">Active</span>
        </div>
        <div class="small" style="margin-top:6px;">by <%=author%></div>
    </div>

    <div class="grid-3 mb-24" style="grid-template-columns:2fr 1fr 1fr;">
        <div class="card" style="grid-column:1 / span 2;">
            <h3 style="margin-bottom:12px;">Goal Description</h3>
            <p class="muted"><%=description%></p>

            <div style="margin-top:22px;padding-top:22px;border-top:1px solid var(--color-border);">
                <h4 style="margin-bottom:10px;">Verification Photo</h4>
                <div style="height:180px;background:var(--color-background);border-radius:16px;border:2px dashed var(--color-border);
                    display:flex;align-items:center;justify-content:center;text-align:center;">
                    <div class="small">No verification photo yet</div>
                </div>
            </div>
        </div>

        <div class="card">
            <h3 style="margin-bottom:12px;">Betting Status</h3>
            <div class="center">
                <div style="font-size:40px;font-weight:900;"><%= (successRate + failureRate) %>%</div>
                <div class="small">Total Bets</div>
                <div style="margin-top:14px;">
                    <div class="small" style="color:var(--color-success);font-weight:800;">Success <%=successRate%>%</div>
                    <div class="small" style="color:var(--color-danger);font-weight:800;">Failure <%=failureRate%>%</div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid-3 mb-48">
        <div class="card">
            <div class="small">Total Participants</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;"><%=totalParticipants%></div>
        </div>
        <div class="card">
            <div class="small">Total Bet Amount</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;"><%=String.format("%,d", totalBetAmount)%>P</div>
        </div>
        <div class="card">
            <div class="small">Average Bet</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;"><%=String.format("%,d", avgBetAmount)%>P</div>
            <div class="small">per person</div>
        </div>
    </div>

    <div class="card mb-24" style="background:linear-gradient(135deg,rgba(99,102,241,.06),rgba(79,70,229,.06));">
        <h2 style="margin-bottom:14px;">Place Your Bet</h2>

        <form action="#" method="post" onsubmit="return false;">
            <div class="mb-16">
                <div class="small" style="margin-bottom:8px;font-weight:700;color:var(--color-text-primary);">Your Prediction</div>
                <div style="display:inline-flex;gap:6px;background:#fff;border:1px solid var(--color-border);border-radius:14px;padding:6px;">
                    <label class="btn btn-ghost" style="padding:8px 14px;">
                        <input type="radio" name="betType" value="success" checked /> Will Succeed
                    </label>
                    <label class="btn btn-ghost" style="padding:8px 14px;">
                        <input type="radio" name="betType" value="failure" /> Will Fail
                    </label>
                </div>
            </div>

            <div class="mb-16">
                <div class="small" style="margin-bottom:8px;font-weight:700;color:var(--color-text-primary);">Bet Amount</div>
                <input class="input" type="number" name="betAmount" placeholder="Enter amount" />
            </div>

            <% if (!loggedIn) { %>
            <button class="btn btn-primary" type="button" style="width:100%;padding:14px 16px;"
                    onclick="alert('You need to be logged in to place a bet.');">
                Place Bet Now
            </button>
            <% } else { %>
            <button class="btn btn-primary" type="button" style="width:100%;padding:14px 16px;"
                    onclick="alert('Bet placed successfully!');">
                Place Bet Now
            </button>
            <% } %>
        </form>
    </div>
</div>
