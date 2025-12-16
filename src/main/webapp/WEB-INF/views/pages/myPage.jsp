<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <%@ page isELIgnored="false" %>

<div class="container" style="padding:48px 24px;">
    <div class="card mb-24" style="background:linear-gradient(135deg,rgba(99,102,241,.06),rgba(79,70,229,.06));">
        <h2 style="margin-bottom:6px;">안녕하세요, ${nickname}님!</h2>
        <p class="muted">
            지금까지 <b style="color:var(--color-primary)">${goalsCreated}</b>개의 목표를 만들었고,
            <b style="color:var(--color-primary)">${betsPlaced}</b>번 베팅에 참여했어요.
        </p>
    </div>

    <div class="grid-3 mb-24">
        <div class="card">
            <div class="small">베팅 승률</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;">${winRate}%</div>
            <div class="small">${wins}승 ${losses}패</div>
        </div>
        <div class="card" style="background:linear-gradient(135deg,rgba(34,197,94,.06),rgba(34,197,94,.1));">
            <div class="small">누적 수익</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;color:var(--color-success);">
                +<fmt:formatNumber value="${totalProfit}" type="number"/>P
            </div>
        </div>
        <div class="card" style="background:linear-gradient(135deg,rgba(239,68,68,.06),rgba(239,68,68,.1));">
            <div class="small">누적 손실</div>
            <div style="font-size:28px;font-weight:900;margin-top:6px;color:var(--color-danger);">
                -<fmt:formatNumber value="${totalLoss}" type="number"/>P
            </div>
        </div>
    </div>

    <div class="card mb-24" style="text-align:center;background:linear-gradient(135deg,rgba(34,197,94,.06),rgba(34,197,94,.12));">
        <div class="small" style="margin-bottom:6px;">순이익/손실</div>
        <div style="font-size:42px;font-weight:1000;color:var(--color-success);">
            +<fmt:formatNumber value="${netProfit}" type="number"/>P
        </div>
    </div>

    <div class="mb-24">
        <div style="display:inline-flex;gap:6px;background:#f1f5f9;border-radius:14px;padding:6px;">
            <a class="btn ${activeTab == 'my-goals' ? 'btn-outline' : 'btn-ghost'}"
               href="${pageContext.request.contextPath}/user/my-page?tab=my-goals">내 목표</a>

            <a class="btn ${activeTab == 'my-bets' ? 'btn-outline' : 'btn-ghost'}"
               href="${pageContext.request.contextPath}/user/my-page?tab=my-bets">내 베팅</a>

            <a class="btn ${activeTab == 'statistics' ? 'btn-outline' : 'btn-ghost'}"
               href="${pageContext.request.contextPath}/user/my-page?tab=statistics">통계</a>
        </div>
    </div>

    <c:choose>
        <c:when test="${activeTab == 'my-goals'}">
            <div class="flex-between mb-16">
                <h2>내 목표</h2>
                <a href="${pageContext.request.contextPath}/goal/create-form" class="btn btn-primary">
                    목표 만들기
                </a>
            </div>
            <div class="card">목업: 내 목표 리스트가 이 영역에 표시됩니다.</div>
        </c:when>

        <c:when test="${activeTab == 'my-bets'}">
            <h2 class="mb-16">내 베팅</h2>
            <div class="card">목업: 내가 베팅한 내역 리스트가 이 영역에 표시됩니다.</div>
        </c:when>

        <c:otherwise>
            <h2 class="mb-16">상세 통계</h2>
            <div class="grid-2">
                <div class="card">목업: 베팅 승/패 현황 차트 영역</div>
                <div class="card">목업: 수익/손실 추이 차트 영역</div>
            </div>
        </c:otherwise>
    </c:choose>
</div>