<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="hero">
    <div class="hero-kicker">BETTING-STYLE GOAL MANAGEMENT</div>
    <h1 class="hero-title">Achieve Your Goals with Moneyvation</h1>
    <p class="hero-desc">
        Turn your goals into exciting challenges. Let your friends bet on your success or failure, and prove them wrong while staying motivated!
    </p>

    <div class="hero-actions">
        <a class="btn btn--primary btn--md" href="<c:url value='/goal/create-form'/>">+ Create Goal</a>
        <a class="btn btn--outline btn--md" href="<c:url value='/user/my-page'/>">My Page</a>
    </div>
</section>

<!-- filters (UI only / 서버 정렬은 추후 확장 가능) -->
<div class="card card-pad section">
    <div class="filter-bar">
        <div class="field">
            <div class="label">Status</div>
            <select class="select" name="status" disabled>
                <option>All Goals</option>
                <option>Ongoing</option>
                <option>Completed</option>
            </select>
            <div class="subtle">※ 현재는 UI만 적용(서버 필터링은 추후)</div>
        </div>

        <div class="field">
            <div class="label">Sort By</div>
            <select class="select" name="sort" disabled>
                <option>Most Recent</option>
                <option>Ending Soon</option>
                <option>Highest Bet</option>
            </select>
            <div class="subtle">※ 현재는 UI만 적용(서버 정렬은 추후)</div>
        </div>
    </div>
</div>

<!-- goal cards -->
<div class="grid">
    <c:choose>
        <c:when test="${not empty goalList}">
            <c:forEach var="g" items="${goalList}">
                <div class="card goal-card">
                    <h3 class="goal-title">
                        <a href="<c:url value='/goal/detail?goalId=${g.goalId}'/>">${g.title}</a>
                    </h3>
                    <div class="goal-meta">by ${g.author}</div>

                    <div class="goal-desc">
                        <c:choose>
                            <c:when test="${not empty g.description}">
                                ${g.description}
                            </c:when>
                            <c:otherwise>
                                목표 설명이 아직 없습니다.
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="goal-row">
                        <span class="pill">D-${g.daysRemaining}</span>
                        <span class="pill">${g.totalParticipants} people</span>
                    </div>

                    <div class="progress">
                        <!-- successRate가 0~100이라고 가정 -->
                        <span style="width:${g.successRate}%;"></span>
                    </div>

                    <div class="progress-legend">
                        <span class="ok">Success ${g.successRate}%</span>
                        <span class="no">Failure ${g.failureRate}%</span>
                    </div>
                </div>
            </c:forEach>
        </c:when>

        <c:otherwise>
            <!-- fallback 샘플 -->
            <div class="card goal-card">
                <h3 class="goal-title"><a href="#">Complete Marathon Training for 3 Months</a></h3>
                <div class="goal-meta">by Sarah Kim</div>
                <div class="goal-desc">I will complete a full marathon training program over the next 3 months, running at least 5 times per week...</div>
                <div class="goal-row"><span class="pill">D-45</span><span class="pill">24 people</span></div>
                <div class="progress"><span style="width:65%;"></span></div>
                <div class="progress-legend"><span class="ok">Success 65%</span><span class="no">Failure 35%</span></div>
            </div>

            <div class="card goal-card">
                <h3 class="goal-title"><a href="#">Read 50 Books This Year</a></h3>
                <div class="goal-meta">by John Park</div>
                <div class="goal-desc">Challenge myself to read 50 books across various genres throughout the year. Will document my progre...</div>
                <div class="goal-row"><span class="pill">D-180</span><span class="pill">18 people</span></div>
                <div class="progress"><span style="width:55%;"></span></div>
                <div class="progress-legend"><span class="ok">Success 55%</span><span class="no">Failure 45%</span></div>
            </div>

            <div class="card goal-card">
                <h3 class="goal-title"><a href="#">Learn JavaScript and Build 5 Projects</a></h3>
                <div class="goal-meta">by Mike Lee</div>
                <div class="goal-desc">Master JavaScript fundamentals and build 5 complete web projects from scratch within 6 months.</div>
                <div class="goal-row"><span class="pill">D-120</span><span class="pill">32 people</span></div>
                <div class="progress"><span style="width:72%;"></span></div>
                <div class="progress-legend"><span class="ok">Success 72%</span><span class="no">Failure 28%</span></div>
            </div>

            <div class="card goal-card">
                <h3 class="goal-title"><a href="#">Lose 10kg Through Diet and Exercise</a></h3>
                <div class="goal-meta">by Emily Chen</div>
                <div class="goal-desc">Reach my target weight through consistent healthy eating and regular exercise routine over 4 months.</div>
                <div class="goal-row"><span class="pill">D-90</span><span class="pill">41 people</span></div>
                <div class="progress"><span style="width:48%;"></span></div>
                <div class="progress-legend"><span class="ok">Success 48%</span><span class="no">Failure 52%</span></div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
