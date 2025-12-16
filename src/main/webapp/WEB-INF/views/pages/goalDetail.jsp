<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null) loggedIn = false;

    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";

    // 목업 목표 데이터
    String title = "3개월 동안 마라톤 훈련 완주하기";
    String author = "Sarah Kim";
    String description =
            "앞으로 3개월 동안 주 5회 이상 달리며 거리를 늘려 풀코스(42.195km)를 완주할 체력을 만드는 것이 목표입니다.";
    int totalParticipants = 24;
    int totalBetAmount = 48500;
    int avgBetAmount = 2020;
    int successRate = 65;
    int failureRate = 35;
%>

<div class="container" style="padding:48px 24px;">
    <a class="btn btn-ghost" href="<%=request.getContextPath()%>/WEB-INF/views/index.jsp?page=home" style="padding:0;">
        ← 목표 목록으로 돌아가기
    </a>

    <div class="card mt-16 mb-16">
        <div class="flex-between" style="align-items:flex-start;gap:12px;">
            <h1 style="flex:1;"><%=title%></h1>
            <span class="badge badge-primary">진행중</span>
        </div>
        <div class="small" style="margin-top:6px;">작성자 <%=author%></div>
    </div>

    <div class="grid-3 mb-24" style="grid-template-columns:2fr 1fr 1fr;">
        <div class="card" style="grid-column:1 / span 2;">
            <h3 style="margin-bottom:12px;">목표 설명</h3>
            <p class="muted"><%=description%></p>

            <div style="margin-top:22px;padding-top:22px;border-top:1px solid var(--color-border);">
                <h4 style="margin-bottom:10px;">검증 사진</h4>
                <div style="height:180px;background:var(--color-background);border-radius:16px;border:2px dashed var(--color-border);
                    display:flex;align-items:center;justify-content:center;text-align:center;">
                    <div class="small">등록된 검증 사진이 없습니다.</div>
                </div>
            </div>
        </div>

        <div class="card">
            <h3 style="margin-bottom:12px;">베팅 현황</h3>
            <div class="center">
                <div style="font-size:40px;font-weight:900;"><%= (successRate + failureRate) %>%</div>
                <div class="small">총 베팅 비율</div>
                <div style="margin-top:14px;">
                    <div class="small" style="color:var(--color-success);font-weight:800;">성공 <%=successRate%>%</div>
                    <div class="small" style="color:var(--color-danger);font-weight:800;">실패 <%=failureRate%>%</div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid-3 mb-48">
        <div class="card">
            <div class="small">총 참여 인원</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;"><%=totalParticipants%></div>
        </div>
        <div class="card">
            <div class="small">총 베팅 금액</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;"><%=String.format("%,d", totalBetAmount)%>P</div>
        </div>
        <div class="card">
            <div class="small">평균 베팅 금액</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;"><%=String.format("%,d", avgBetAmount)%>P</div>
            <div class="small">1인 기준</div>
        </div>
    </div>

    <div class="card mb-24" style="background:linear-gradient(135deg,rgba(99,102,241,.06),rgba(79,70,229,.06));">
        <h2 style="margin-bottom:14px;">베팅하기</h2>

        <form action="#" method="post" onsubmit="return false;">
            <div class="mb-16">
                <div class="small" style="margin-bottom:8px;font-weight:700;color:var(--color-text-primary);">당신의 예측</div>
                <div style="display:inline-flex;gap:6px;background:#fff;border:1px solid var(--color-border);border-radius:14px;padding:6px;">
                    <label class="btn btn-ghost" style="padding:8px 14px;">
                        <input type="radio" name="betType" value="success" checked /> 성공할 것
                    </label>
                    <label class="btn btn-ghost" style="padding:8px 14px;">
                        <input type="radio" name="betType" value="failure" /> 실패할 것
                    </label>
                </div>
            </div>

            <div class="mb-16">
                <div class="small" style="margin-bottom:8px;font-weight:700;color:var(--color-text-primary);">베팅 금액</div>
                <input class="input" type="number" name="betAmount" placeholder="금액을 입력하세요" />
            </div>

            <% if (!loggedIn) { %>
            <button class="btn btn-primary" type="button" style="width:100%;padding:14px 16px;"
                    onclick="alert('베팅하려면 로그인이 필요합니다.');">
                베팅하기
            </button>
            <% } else { %>
            <button class="btn btn-primary" type="button" style="width:100%;padding:14px 16px;"
                    onclick="alert('베팅이 완료되었습니다!');">
                베팅하기
            </button>
            <% } %>
        </form>
    </div>
</div>
