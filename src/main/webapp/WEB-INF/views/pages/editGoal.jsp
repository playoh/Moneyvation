<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";

    // 목업 데이터: 실제로는 DB에서 goalId로 조회
    String title = "3개월 동안 마라톤 훈련 완주하기";
    String description =
            "앞으로 3개월 동안 주 5회 이상 달리며 거리를 늘려 풀코스(42.195km)를 완주할 체력을 만드는 것이 목표입니다.";
    String duration = "90";
    String verification = "photo";
    String minBet = "1000";
    String allowFailure = "yes";
%>

<div class="container" style="padding:48px 24px; max-width:800px;">
    <div class="mb-24">
        <h1 style="margin-bottom:8px;">목표 수정</h1>
        <p class="muted">목표 정보를 수정하면 즉시 적용됩니다.</p>
    </div>

    <form action="<%=request.getContextPath()%>/WEB-INF/views/pages/updateGoalAction.jsp" method="post">
        <input type="hidden" name="goalId" value="<%=goalId%>"/>

        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                목표 제목
            </label>
            <input
                    type="text"
                    name="title"
                    class="input"
                    value="<%=title%>"
                    required
            />
        </div>

        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                목표 설명
            </label>
            <textarea
                    name="description"
                    class="input"
                    rows="5"
                    required
            ><%=description%></textarea>
        </div>

        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                목표 기간 (일)
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

        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                검증 방식
            </label>
            <select name="verification" class="input">
                <option value="photo" <%= "photo".equals(verification) ? "selected" : "" %>>사진 업로드</option>
                <option value="daily-log" <%= "daily-log".equals(verification) ? "selected" : "" %>>일일 텍스트 로그</option>
                <option value="external-proof" <%= "external-proof".equals(verification) ? "selected" : "" %>>외부 증빙(링크/스크린샷)</option>
            </select>
        </div>

        <div class="card mb-24" style="background:#f8fafc;">
            <h3 style="margin-bottom:12px;">베팅 설정</h3>

            <div class="mb-16">
                <label class="small">최소 베팅 금액 (P)</label>
                <input
                        type="number"
                        name="minBet"
                        class="input"
                        value="<%=minBet%>"
                        min="0"
                />
            </div>

            <div class="mb-16">
                <label class="small">실패 베팅 허용</label>
                <select name="allowFailure" class="input">
                    <option value="yes" <%= "yes".equals(allowFailure) ? "selected" : "" %>>
                        네, 실패 베팅도 허용
                    </option>
                    <option value="no" <%= "no".equals(allowFailure) ? "selected" : "" %>>
                        아니오, 성공 베팅만 허용
                    </option>
                </select>
            </div>
        </div>

        <div class="flex gap-12">
            <a
                    href="<%=request.getContextPath()%>/index.jsp?page=goal-detail&goalId=<%=goalId%>"
                    class="btn btn-ghost"
            >
                취소
            </a>

            <button type="submit" class="btn btn-primary" style="flex:1;">
                저장하기
            </button>
        </div>
    </form>
</div>
