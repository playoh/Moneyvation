<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="hero">
    <div class="kicker">BETTING-STYLE GOAL MANAGEMENT</div>
    <h1 class="h1">Achieve Your Goals with Moneyvation</h1>
    <p class="p" style="max-width: 760px; margin: 10px auto 0;">
        Turn your goals into exciting challenges. Let your friends bet on your success or failure,
        and prove them wrong while staying motivated.
    </p>

    <div class="hero-actions">
        <a class="btn btn--primary btn--lg" href="<c:url value='/goal/create-form'/>">+ Create Goal</a>
        <a class="btn btn--outline btn--lg" href="<c:url value='/user/myPage'/>">My Page</a>
    </div>
</section>

<!-- ✅ 정렬/필터 폼 -->
<form class="panel panel-pad section" method="get" action="<c:url value='/'/>">
    <div class="form-grid">
        <div class="field">
            <div class="label">Sort By</div>

            <!-- ✅ disabled 제거 + name=sort + submit -->
            <select class="select" name="sort" onchange="this.form.submit()">
                <option value="recent" <c:if test="${param.sort == null || param.sort == 'recent'}">selected</c:if>>
                    Most Recent
                </option>
                <option value="ending" <c:if test="${param.sort == 'ending'}">selected</c:if>>
                    Ending Soon
                </option>
                <option value="highest" <c:if test="${param.sort == 'highest'}">selected</c:if>>
                    Highest Bet
                </option>
            </select>

            <div class="help">Sorting is applied server-side</div>
        </div>
    </div>
</form>

<div class="home-grid">
    <c:choose>
        <c:when test="${not empty goalList}">
            <c:forEach var="g" items="${goalList}">

                <c:set var="sr" value="${empty g.successRate ? 0 : g.successRate}" />
                <c:set var="fr" value="${empty g.failureRate ? 0 : g.failureRate}" />
                <c:set var="barSr" value="${(sr == 0 && fr == 0) ? 50 : sr}" />
                <c:set var="barFr" value="${(sr == 0 && fr == 0) ? 50 : fr}" />

                <div class="card card-pad card--hover"
                     onclick="location.href='<c:url value='/goal/detail?goalId=${g.goalId}'/>';">

                    <div style="display:flex; flex-direction:column; gap:12px;">
                        <div style="display:flex; flex-direction:column; gap:6px;">
                            <div class="goal-title">${g.title}</div>
                            <div class="goal-author">by ${g.author}</div>
                        </div>

                        <div class="goal-desc">
                            <c:choose>
                                <c:when test="${not empty g.description}">${g.description}</c:when>
                                <c:otherwise>목표 설명이 아직 없습니다.</c:otherwise>
                            </c:choose>
                        </div>

                        <div class="meta" style="display:flex; flex-wrap:wrap; gap:8px;">
                            <span class="meta-item"><span class="icon icon--cal"></span>D-${g.daysRemaining}</span>
                            <span class="meta-item"><span class="icon icon--user"></span>${g.totalParticipants} people</span>

                            <span class="meta-item">Start: <b><c:out value="${empty g.startDate ? '-' : g.startDate}"/></b></span>
                            <span class="meta-item">End: <b><c:out value="${empty g.endDate ? '-' : g.endDate}"/></b></span>

                            <span class="meta-item">Category: <b><c:out value="${empty g.category ? '-' : g.category}"/></b></span>
                            <span class="meta-item">Difficulty: <b><c:out value="${empty g.difficulty ? '-' : g.difficulty}"/></b></span>

                            <span class="meta-item">Duration: <b>${g.duration}d</b></span>
                            <span class="meta-item">MinBet: <b>₩${g.minBet}</b></span>
                            <span class="meta-item">Verify: <b><c:out value="${g.verificationType}"/></b></span>
                            <span class="meta-item">AllowFail: <b><c:out value="${g.allowFailure}"/></b></span>
                        </div>

                        <div style="display:flex; flex-direction:column; gap:8px;">
                            <div class="progress-legend">
                                <span class="ok">Success ${sr}%</span>
                                <span class="no">Failure ${fr}%</span>
                            </div>

                            <div class="progress">
                                <span class="ok" style="width:${barSr}%;"></span>
                                <span class="no" style="width:${barFr}%;"></span>
                            </div>

                            <c:if test="${sr == 0 && fr == 0}">
                                <div class="help" style="margin-top:2px;">아직 베팅이 없어요.</div>
                            </c:if>
                        </div>
                    </div>

                </div>
            </c:forEach>
        </c:when>

        <c:otherwise>
            <div class="card card-pad-lg">
                <h3 class="h3">목표가 아직 없어요</h3>
                <p class="p" style="margin-top:6px;">첫 목표를 만들어 친구들의 예상을 뒤집어보세요.</p>
                <div style="margin-top:14px;">
                    <a class="btn btn--primary btn--md" href="<c:url value='/goal/create-form'/>">+ 목표 생성</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
