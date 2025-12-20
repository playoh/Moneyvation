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
        <a class="btn btn--outline btn--lg" href="<c:url value='/user/my-page'/>">My Page</a>
    </div>
</section>

<div class="panel panel-pad section">
    <div class="form-grid">
        <div class="field">
            <div class="label">Status</div>
            <select class="select" disabled>
                <option>All Goals</option>
                <option>Ongoing</option>
                <option>Completed</option>
                <option>Failed</option>
            </select>
            <div class="help">UI only (server filtering can be added later)</div>
        </div>

        <div class="field">
            <div class="label">Sort By</div>
            <select class="select" disabled>
                <option>Most Recent</option>
                <option>Popular</option>
                <option>Ending Soon</option>
                <option>Highest Bet</option>
            </select>
            <div class="help">UI only (server sorting can be added later)</div>
        </div>
    </div>
</div>

<!-- ✅ 여기만 grid → home-grid 로 변경 -->
<div class="home-grid">
    <c:choose>
        <c:when test="${not empty goalList}">
            <c:forEach var="g" items="${goalList}">
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

                        <div class="meta">
                            <span class="meta-item"><span class="icon icon--cal"></span>D-${g.daysRemaining}</span>
                            <span class="meta-item"><span class="icon icon--user"></span>${g.totalParticipants} people</span>
                        </div>

                        <div style="display:flex; flex-direction:column; gap:8px;">
                            <div class="progress-legend">
                                <span class="ok">Success ${g.successRate}%</span>
                                <span class="no">Failure ${g.failureRate}%</span>
                            </div>
                            <div class="progress">
                                <span class="ok" style="width:${g.successRate}%;"></span>
                                <span class="no" style="width:${g.failureRate}%;"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:when>

        <c:otherwise>
            <!-- fallback sample cards -->
            <div class="card card-pad card--hover">
                <div style="display:flex; flex-direction:column; gap:12px;">
                    <div>
                        <div class="goal-title">Complete Marathon Training for 3 Months</div>
                        <div class="goal-author">by Sarah Kim</div>
                    </div>
                    <div class="goal-desc">I will complete a full marathon training program over the next 3 months, running at least 5 times per week...</div>
                    <div class="meta">
                        <span class="meta-item"><span class="icon icon--cal"></span>D-45</span>
                        <span class="meta-item"><span class="icon icon--user"></span>24 people</span>
                    </div>
                    <div style="display:flex; flex-direction:column; gap:8px;">
                        <div class="progress-legend"><span class="ok">Success 65%</span><span class="no">Failure 35%</span></div>
                        <div class="progress"><span class="ok" style="width:65%;"></span><span class="no" style="width:35%;"></span></div>
                    </div>
                </div>
            </div>

            <div class="card card-pad card--hover">
                <div style="display:flex; flex-direction:column; gap:12px;">
                    <div>
                        <div class="goal-title">Read 50 Books This Year</div>
                        <div class="goal-author">by John Park</div>
                    </div>
                    <div class="goal-desc">Challenge myself to read 50 books across various genres throughout the year. Will document my progress...</div>
                    <div class="meta">
                        <span class="meta-item"><span class="icon icon--cal"></span>D-180</span>
                        <span class="meta-item"><span class="icon icon--user"></span>18 people</span>
                    </div>
                    <div style="display:flex; flex-direction:column; gap:8px;">
                        <div class="progress-legend"><span class="ok">Success 55%</span><span class="no">Failure 45%</span></div>
                        <div class="progress"><span class="ok" style="width:55%;"></span><span class="no" style="width:45%;"></span></div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
