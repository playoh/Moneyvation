<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="goal-detail">

    <!-- Back -->
    <div style="margin: 6px 0 18px;">
        <a class="backlink" href="<c:url value='/'/>">
            ← <span>목표 목록으로</span>
        </a>
    </div>

    <!-- Title Card -->
    <div class="card card-pad-lg" style="margin-bottom:16px;">
        <div class="goal-detail hero">
            <div class="stack" style="gap:6px; flex:1;">
                <h1 class="h1">
                    <c:out value="${goal.title}" default="Complete Marathon Training for 3 Months"/>
                </h1>
                <p class="small">
                    by <c:out value="${goal.author}" default="Sarah Kim"/>
                </p>
            </div>

            <span class="badge badge--primary">Active</span>
        </div>
    </div>

    <!-- Detail + Chart -->
    <div class="grid" style="grid-template-columns: 2fr 1fr; margin-bottom:16px;">
        <!-- Description -->
        <div class="card card-pad-lg">
            <h3 class="h3" style="margin-bottom:10px;">Goal Description</h3>
            <p class="p">
                <c:out value="${goal.description}"
                       default="I will complete a full marathon training program over the next 3 months..."/>
            </p>

            <div class="hr"></div>

            <div class="stack" style="gap:10px;">
                <h3 class="h3">Verification Photo</h3>

                <c:choose>
                    <c:when test="${not empty goal.verificationImageUrl}">
                        <img src="<c:url value='${goal.verificationImageUrl}'/>"
                             alt="verification"
                             style="border-radius:16px; border:1px solid var(--line);"/>
                    </c:when>
                    <c:otherwise>
                        <div class="photoBox">
                            <div class="stack" style="gap:6px; align-items:center;">
                                <div style="font-size:36px;">🖼️</div>
                                <div class="small">아직 인증샷이 없어요</div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Donut (JSP/SVG) -->
        <div class="card card-pad-lg">
            <h3 class="h3" style="margin-bottom:14px;">Betting Status</h3>

            <c:set var="successRate" value="${empty goal.successRate ? 65 : goal.successRate}" />
            <c:set var="failureRate" value="${empty goal.failureRate ? 35 : goal.failureRate}" />
            <c:set var="totalRate" value="${successRate + failureRate}" />

            <div style="display:flex; flex-direction:column; align-items:center; gap:14px;">
                <div style="width:180px; height:180px; position:relative;">
                    <svg width="180" height="180" viewBox="0 0 180 180" style="transform: rotate(-90deg);">
                        <!-- bg -->
                        <circle cx="90" cy="90" r="70" fill="none" stroke="#f1f5f9" stroke-width="20"/>

                        <!-- success -->
                        <c:set var="circ" value="439.8229715" /> <%-- 2*pi*70 --%>
                        <c:set var="successLen" value="${(successRate/100.0) * circ}" />
                        <c:set var="failureLen" value="${(failureRate/100.0) * circ}" />

                        <circle cx="90" cy="90" r="70" fill="none"
                                stroke="#22c55e" stroke-width="20"
                                stroke-linecap="round"
                                stroke-dasharray="${successLen} ${circ}"/>

                        <!-- failure -->
                        <circle cx="90" cy="90" r="70" fill="none"
                                stroke="#ef4444" stroke-width="20"
                                stroke-linecap="round"
                                stroke-dasharray="${failureLen} ${circ}"
                                stroke-dashoffset="${-successLen}"/>
                    </svg>

                    <div style="position:absolute; inset:0; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                        <div style="font-size:28px; font-weight:900; color:var(--text);">
                            <c:out value="${totalRate}"/>%
                        </div>
                        <div class="small">Total Bets</div>
                    </div>
                </div>

                <div class="row" style="gap:14px; flex-wrap:wrap; justify-content:center;">
                    <div class="row" style="gap:8px;">
                        <div style="width:10px; height:10px; border-radius:999px; background:var(--success);"></div>
                        <div class="small" style="color:#475569;">Success <b style="color:var(--success);"><c:out value="${successRate}"/>%</b></div>
                    </div>
                    <div class="row" style="gap:8px;">
                        <div style="width:10px; height:10px; border-radius:999px; background:var(--danger);"></div>
                        <div class="small" style="color:#475569;">Failure <b style="color:var(--danger);"><c:out value="${failureRate}"/>%</b></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Statistics -->
    <div class="grid grid-3" style="margin-bottom:22px;">
        <div class="card card-pad-lg">
            <div class="kpi">
                <div>
                    <p class="label">Total Participants</p>
                    <div class="value">
                        <c:out value="${empty goal.totalParticipants ? 24 : goal.totalParticipants}"/>
                    </div>
                </div>
                <div class="badge">👥</div>
            </div>
        </div>

        <div class="card card-pad-lg">
            <div class="kpi">
                <div>
                    <p class="label">Total Bet Amount</p>
                    <div class="value">
                        <c:out value="${empty goal.totalBetAmount ? '48,500P' : goal.totalBetAmount}"/>
                    </div>
                </div>
                <div class="badge">📈</div>
            </div>
        </div>

        <div class="card card-pad-lg">
            <div class="kpi">
                <div>
                    <p class="label">Average Bet</p>
                    <div class="value">
                        <c:choose>
                            <c:when test="${goal.totalParticipants > 0}">
                                <c:out value="${goal.totalBetAmount / goal.totalParticipants}"/>P
                            </c:when>
                            <c:otherwise>2,020P</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="small">per person</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Participant Details -->
    <div class="card card-pad-lg" style="margin-bottom:22px;">
        <div class="toolbar" style="margin-bottom:14px;">
            <h2 class="h2">Participant Details</h2>
            <!-- 모달은 JS 없이 "전체 보기 페이지"로 보내는 방식 추천 -->
            <a class="btn btn--outline btn--md" href="<c:url value='/goal/participants?goalId=${goal.goalId}'/>">View All</a>
        </div>

        <div class="grid grid-2" style="gap:18px;">
            <!-- success -->
            <div>
                <div class="row" style="gap:10px; margin-bottom:10px;">
                    <div style="width:10px; height:10px; border-radius:999px; background:var(--success);"></div>
                    <h3 class="h3" style="color:var(--success);">
                        Success Predictions
                        <span class="small" style="margin-left:6px;">
              (<c:out value="${empty successBets ? 0 : fn:length(successBets)}"/>)
            </span>
                    </h3>
                </div>

                <div class="listBox">
                    <c:choose>
                        <c:when test="${not empty successBets}">
                            <c:forEach var="b" items="${successBets}">
                                <div class="listItem ok">
                                    <span class="name"><c:out value="${b.name}"/></span>
                                    <span class="amt ok"><c:out value="${b.amount}"/>P</span>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="small">아직 성공 베팅 참여자가 없어요.</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- failure -->
            <div>
                <div class="row" style="gap:10px; margin-bottom:10px;">
                    <div style="width:10px; height:10px; border-radius:999px; background:var(--danger);"></div>
                    <h3 class="h3" style="color:var(--danger);">
                        Failure Predictions
                        <span class="small" style="margin-left:6px;">
              (<c:out value="${empty failureBets ? 0 : fn:length(failureBets)}"/>)
            </span>
                    </h3>
                </div>

                <div class="listBox">
                    <c:choose>
                        <c:when test="${not empty failureBets}">
                            <c:forEach var="b" items="${failureBets}">
                                <div class="listItem bad">
                                    <span class="name"><c:out value="${b.name}"/></span>
                                    <span class="amt bad"><c:out value="${b.amount}"/>P</span>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="small">아직 실패 베팅 참여자가 없어요.</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- Place Your Bet -->
    <div class="card card-pad-lg betCard">
        <h2 class="h2" style="margin-bottom:14px;">Place Your Bet</h2>

        <form method="post" action="<c:url value='/bet/create'/>" class="betRow">
            <input type="hidden" name="goalId" value="<c:out value='${goal.goalId}' default='0'/>"/>

            <div>
                <div class="label">Your Prediction</div>
                <div class="pills">
                    <label class="pill success active">
                        <input type="radio" name="betType" value="success" checked style="display:none;">
                        Will Succeed
                    </label>
                    <label class="pill failure">
                        <input type="radio" name="betType" value="failure" style="display:none;">
                        Will Fail
                    </label>
                </div>
                <div class="help">※ JSP만으로 토글 UI를 완벽히 하려면 약간의 JS가 필요해요. 일단은 기본값 success로 제출되게 해두었고, 원하면 “JSP + 아주 짧은 inline JS”로 토글 활성화도 해줄게.</div>
            </div>

            <div>
                <div class="label">Bet Amount</div>
                <input class="input" type="number" name="amount" placeholder="Enter amount (P)" min="1" required/>
            </div>

            <button class="btn btn--primary btn--lg btn--full" type="submit">Place Bet Now</button>

            <c:if test="${empty sessionScope.loginUser}">
                <div class="small" style="margin-top:6px;">
                    로그인하지 않으면 베팅이 제한될 수 있어요. <a style="color:var(--primary); font-weight:900;" href="<c:url value='/user/login-form'/>">로그인 하러가기</a>
                </div>
            </c:if>
        </form>
    </div>

</div>
