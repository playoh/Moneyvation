<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";

    // ✅ 지금은 DB가 없으니까 "목업 데이터"로 기존 값을 미리 채움
    // 나중에 DB 붙이면: goalId로 SELECT 해서 아래 변수에 넣으면 됨
    String title = "Complete Marathon Training for 3 Months";
    String description =
            "I will complete a full marathon training program over the next 3 months, running at least 5 times per week and gradually increasing distance.";
    String duration = "90";
    String verification = "photo";
    String minBet = "1000";
    String allowFailure = "yes";
%>

<div class="container" style="padding:48px 24px; max-width:800px;">
    <div class="mb-24">
        <h1 style="margin-bottom:8px;">Edit Goal</h1>
        <p class="muted">Update your goal details. Changes will apply immediately.</p>
    </div>

    <form action="<%=request.getContextPath()%>/pages/updateGoalAction.jsp" method="post">
        <!-- goalId 유지 -->
        <input type="hidden" name="goalId" value="<%=goalId%>"/>

        <!-- Title -->
        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                Goal Title
            </label>
            <input
                    type="text"
                    name="title"
                    class="input"
                    value="<%=title%>"
                    required
            />
        </div>

        <!-- Description -->
        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                Goal Description
            </label>
            <textarea
                    name="description"
                    class="input"
                    rows="5"
                    required
            ><%=description%></textarea>
        </div>

        <!-- Duration -->
        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                Goal Duration (Days)
            </label>
            <input
                    type="number"
                    name="duration"
                    class="input"
                    value="<%=duration%>"
                    min="1"
                    required
            />
        </div>

        <!-- Verification -->
        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                Verification Method
            </label>
            <select name="verification" class="input">
                <option value="photo" <%= "photo".equals(verification) ? "selected" : "" %>>Photo Upload</option>
                <option value="daily-log" <%= "daily-log".equals(verification) ? "selected" : "" %>>Daily Text Log</option>
                <option value="external-proof" <%= "external-proof".equals(verification) ? "selected" : "" %>>External Proof (Link / Screenshot)</option>
            </select>
        </div>

        <!-- Betting Settings -->
        <div class="card mb-24" style="background:#f8fafc;">
            <h3 style="margin-bottom:12px;">Betting Settings</h3>

            <div class="mb-16">
                <label class="small">Minimum Bet Amount (P)</label>
                <input
                        type="number"
                        name="minBet"
                        class="input"
                        value="<%=minBet%>"
                        min="0"
                />
            </div>

            <div class="mb-16">
                <label class="small">Allow Failure Bets?</label>
                <select name="allowFailure" class="input">
                    <option value="yes" <%= "yes".equals(allowFailure) ? "selected" : "" %>>
                        Yes, allow betting on failure
                    </option>
                    <option value="no" <%= "no".equals(allowFailure) ? "selected" : "" %>>
                        No, success bets only
                    </option>
                </select>
            </div>
        </div>

        <!-- Buttons -->
        <div class="flex gap-12">
            <a
                    href="<%=request.getContextPath()%>/index.jsp?page=goal-detail&goalId=<%=goalId%>"
                    class="btn btn-ghost"
            >
                Cancel
            </a>

            <button type="submit" class="btn btn-primary" style="flex:1;">
                Save Changes
            </button>
        </div>
    </form>
</div>
