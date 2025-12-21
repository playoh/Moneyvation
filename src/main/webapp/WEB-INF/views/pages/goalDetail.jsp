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
                    <c:out value="${goal.title}" default="Goal Title"/>
                </h1>
                <p class="small">
                    by <c:out value="${goal.author}" default="author"/>
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
                <c:out value="${goal.description}" default="description"/>
            </p>

            <div class="hr"></div>

            <div class="stack" style="gap:10px;">
                <h3 class="h3">Verification Photo</h3>
                <c:choose>
                    <c:when test="${not empty goal.verificationImageUrl}">
                        <figure class="verifyWrap">
                            <img class="verifyImg"
                                 src="<c:url value='${goal.verificationImageUrl}'/>"
                                 alt="verification photo"/>

                            <figcaption class="verifyCaption">
                                <div class="verifyTitle">인증 완료!</div>
                                <div class="verifyNote">
                                    인증샷이 등록되었습니다. 좋은 흐름 유지해봐요!
                                </div>
                            </figcaption>
                        </figure>
                    </c:when>

                    <c:otherwise>
                        <div class="photoBox">
                            ...
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Donut -->
        <div class="card card-pad-lg">
            <h3 class="h3" style="margin-bottom:14px;">Betting Status</h3>

            <c:set var="successRate" value="${empty successRateByCount ? 0 : successRateByCount}" />
            <c:set var="failureRate" value="${empty failureRateByCount ? 0 : failureRateByCount}" />
            <c:set var="totalBetters" value="${empty totalBetters ? 0 : totalBetters}" />

            <div style="display:flex; flex-direction:column; align-items:center; gap:14px;">
                <div style="width:180px; height:180px; position:relative;">
                    <svg width="180" height="180" viewBox="0 0 180 180" style="transform: rotate(-90deg);">
                        <circle cx="90" cy="90" r="70" fill="none" stroke="#f1f5f9" stroke-width="20"/>

                        <c:set var="circ" value="439.8229715" />
                        <c:set var="successLen" value="${(successRate/100.0) * circ}" />
                        <c:set var="failureLen" value="${(failureRate/100.0) * circ}" />

                        <circle cx="90" cy="90" r="70" fill="none"
                                stroke="#22c55e" stroke-width="20"
                                stroke-linecap="round"
                                stroke-dasharray="${successLen} ${circ}"/>

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
                        <div class="small">Betters: <c:out value="${totalBetters}"/></div>
                    </div>
                </div>

                <div class="row" style="gap:14px; flex-wrap:wrap; justify-content:center;">
                    <div class="row" style="gap:8px;">
                        <div style="width:10px; height:10px; border-radius:999px; background:var(--success);"></div>
                        <div class="small" style="color:#475569;">
                            Success <b style="color:var(--success);"><c:out value="${successRate}"/>%</b>
                        </div>
                    </div>
                    <div class="row" style="gap:8px;">
                        <div style="width:10px; height:10px; border-radius:999px; background:var(--danger);"></div>
                        <div class="small" style="color:#475569;">
                            Failure <b style="color:var(--danger);"><c:out value="${failureRate}"/>%</b>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Participant Details (✅ 분리 출력 확실) -->
    <div class="card card-pad-lg" style="margin-bottom:22px;">
        <div class="toolbar" style="margin-bottom:14px;">
            <h2 class="h2">Participant Details</h2>
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
                                    <span class="name"><c:out value="${b.userName}"/></span>
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
                                    <span class="name"><c:out value="${b.userName}"/></span>
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

    <!-- ✅ Place Your Bet (성공/실패 선택이 실제로 전달되게 수정) -->
    <div class="card card-pad-lg betCard">
        <h2 class="h2" style="margin-bottom:14px;">Place Your Bet</h2>

        <form method="post" action="<c:url value='/goal/bet'/>" class="betRow" id="betForm">
            <input type="hidden" name="goalId" value="<c:out value='${goal.goalId}' default='0'/>"/>

            <div>
                <div class="label">Your Prediction</div>

                <!-- ✅ 라디오를 숨기지 말고(또는 화면 밖으로만) 클릭 시 체크되게 -->
                <div class="pills" id="betPills">
                    <label class="pill success active">
                        <input type="radio" name="betType" value="SUCCESS" checked class="srOnly">
                        Will Succeed
                    </label>

                    <label class="pill failure">
                        <input type="radio" name="betType" value="FAIL" class="srOnly">
                        Will Fail
                    </label>
                </div>

                <div class="help">선택한 예측(SUCCESS/FAIL)이 그대로 저장됩니다.</div>
            </div>

            <div>
                <div class="label">Bet Amount</div>
                <input class="input" type="number" name="amount" placeholder="Enter amount (P)" min="1" required/>
            </div>

            <button class="btn btn--primary btn--lg btn--full" type="submit">Place Bet Now</button>

            <c:if test="${sessionScope.isLoggedIn ne true}">
                <div class="small" style="margin-top:6px;">
                    로그인하지 않으면 베팅이 제한될 수 있어요.
                    <a style="color:var(--primary); font-weight:900;" href="<c:url value='/user/login-form'/>">로그인 하러가기</a>
                </div>
            </c:if>
        </form>
    </div>

</div>

<!-- ✅ 필수: pill 클릭 시 active 토글 + 라디오 체크 반영 -->
<script>
    (function () {
        const pills = document.getElementById('betPills');
        if (!pills) return;

        const labels = pills.querySelectorAll('label.pill');
        labels.forEach(label => {
            label.addEventListener('click', () => {
                labels.forEach(l => l.classList.remove('active'));
                label.classList.add('active');

                const radio = label.querySelector('input[type="radio"]');
                if (radio) radio.checked = true;
            });
        });
    })();
</script>

<!-- ✅ srOnly: input은 접근성 유지하며 화면에서만 숨김 -->
<style>
    .srOnly{
        position:absolute !important;
        width:1px !important;
        height:1px !important;
        padding:0 !important;
        margin:-1px !important;
        overflow:hidden !important;
        clip:rect(0,0,0,0) !important;
        white-space:nowrap !important;
        border:0 !important;
    }
</style>
