<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/resources/assets/my.css'/>">

<div class="page">
    <div class="container">

        <section style="text-align: center; margin-bottom: 40px;">
            <div class="small" style="color: #6366f1; font-weight: 900; letter-spacing: 1px; margin-bottom: 8px;">
                BETTING-STYLE GOAL MANAGEMENT
            </div>

            <h1 class="h1" style="font-size: 36px; margin-bottom: 12px;">
                Achieve Your Goals with Moneyvation
            </h1>

            <p class="p" style="max-width: 700px; margin: 0 auto 24px;">
                Turn your goals into exciting challenges. Let your friends bet on your success or failure,
                and prove them wrong while staying motivated.
            </p>

            <div class="row" style="justify-content: center;">
                <a class="btn btn--primary btn--lg" href="<c:url value='/goal/create-form'/>">
                    + Create Goal
                </a>
                <a class="btn btn--outline btn--lg" href="<c:url value='/user/myPage'/>">
                    My Page
                </a>
            </div>
        </section>

        <form class="card card-pad-sm" method="get" action="<c:url value='/'/>" style="margin-bottom: 24px;">
            <div class="row-between">
                <div class="row">
                    <span class="label" style="margin:0;">Sort By</span>
                </div>

                <div style="width: 200px;">
                    <select class="select" name="sort" onchange="this.form.submit()" style="padding: 8px 12px;">
                        <option value="recent"
                                <c:if test="${param.sort == null || param.sort == 'recent'}">selected</c:if>>
                            Most Recent
                        </option>
                        <option value="ending" <c:if test="${param.sort == 'ending'}">selected</c:if>>
                            Ending Soon
                        </option>
                        <option value="highest" <c:if test="${param.sort == 'highest'}">selected</c:if>>
                            Highest Bet
                        </option>
                    </select>
                </div>
            </div>
        </form>

        <div class="home-grid">
            <c:choose>
                <c:when test="${not empty goalList}">
                    <c:forEach var="g" items="${goalList}">

                        <c:set var="sr" value="${empty g.successRate ? 0 : g.successRate}"/>
                        <c:set var="fr" value="${empty g.failureRate ? 0 : g.failureRate}"/>
                        <c:set var="barSr" value="${(sr == 0 && fr == 0) ? 50 : sr}"/>
                        <c:set var="barFr" value="${(sr == 0 && fr == 0) ? 50 : fr}"/>

                        <div class="card card-hover"
                             onclick="location.href='<c:url value='/goal/detail?goalId=${g.goalId}'/>';">

                            <div class="goal-title">${g.title}</div>
                            <div class="goal-author">by ${g.author}</div>

                            <div class="goal-desc">
                                <c:choose>
                                    <c:when test="${not empty g.description}">${g.description}</c:when>
                                    <c:otherwise>목표 설명이 없습니다.</c:otherwise>
                                </c:choose>
                            </div>

                            <div class="meta">
                                <span class="meta-item">D-${g.daysRemaining}</span>
                                <span class="meta-item">${g.totalParticipants} Participants</span>
                            </div>

                            <div style="margin-top: auto;">
                                <div class="progress-legend">
                                    <span class="ok">Success ${sr}%</span>
                                    <span class="no">Failure ${fr}%</span>
                                </div>

                                <div class="progress">
                                    <span class="ok" style="width:${barSr}%;"></span>
                                    <span class="no" style="width:${barFr}%;"></span>
                                </div>

                                <c:if test="${sr == 0 && fr == 0}">
                                    <div class="small" style="text-align: center; margin-top: 6px;">
                                        No bets yet
                                    </div>
                                </c:if>
                            </div>
                        </div>

                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <div class="card card-pad-lg" style="grid-column: 1 / -1; text-align: center; padding: 60px 20px;">
                        <h3 class="h3" style="font-size: 20px; margin-bottom: 8px;">목표가 아직 없어요 😢</h3>
                        <p class="p" style="margin-bottom: 24px;">첫 목표를 만들어 친구들의 예상을 뒤집어보세요.</p>
                        <a class="btn btn--primary btn--md" href="<c:url value='/goal/create-form'/>">
                            + Create First Goal
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
```
