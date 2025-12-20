<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="stack">
    <div class="card card-pad">
        <div class="row-between">
            <div>
                <h1 class="h1">베팅형 목표 관리 - 돈기부여 -</h1>
                <p class="p">친구의 '실패 예상'을 뒤집어 목표를 달성하는 베팅형 목표 관리 서비스</p>
            </div>

            <c:choose>
                <c:when test="${not empty sessionScope.loginUser}">
                    <a class="btn btn-primary" href="<c:url value='/goal/create-form'/>">+ 목표 작성하기</a>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-primary" onclick="openDialog('needLoginDialog')">+ 목표 작성하기</button>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="hr"></div>

        <div class="acc">
            <div class="acc-item" data-open="false">
                <button class="acc-trigger" data-acc-trigger="1" type="button">
                    <span>이 서비스는 어떻게 돌아가나요?</span>
                    <svg class="acc-chevron" viewBox="0 0 24 24" fill="none">
                        <path d="M6 9l6 6 6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                    </svg>
                </button>
                <div class="acc-content">
                    목표를 만들고(오기로), 친구들은 성공/실패에 베팅합니다.
                    목표를 달성하면 “실패 예상”을 뒤집고, 포인트/보상 구조가 동작합니다.
                </div>
            </div>
        </div>
    </div>

    <div class="goal-grid">
        <c:forEach var="g" items="${goalList}">
            <a class="goal-card" href="<c:url value='/goal/detail?goalId=${g.goalId}'/>">
                <p class="goal-title">${g.title}</p>
                <p class="p" style="margin-top:6px;">
                    <c:out value="${g.description}"/>
                </p>

                <div class="goal-meta">
                    <span class="badge">기간: ${g.duration}일</span>
                    <span class="badge">검증: ${g.verificationType}</span>
                    <span class="badge">최소베팅: ${g.minBet}</span>
                    <span class="badge">남은기간: ${g.daysRemaining}일</span>
                </div>
            </a>
        </c:forEach>
    </div>
</div>

<!-- 로그인 필요 Dialog -->
<div class="dialog" id="needLoginDialog" role="dialog" aria-modal="true">
    <div class="dialog-header">
        <p class="dialog-title">로그인이 필요해요</p>
        <p class="dialog-desc">목표를 작성하려면 먼저 로그인해주세요.</p>
    </div>
    <div class="dialog-footer">
        <button class="btn" type="button" onclick="closeDialog('needLoginDialog')">닫기</button>
        <a class="btn btn-primary" href="<c:url value='/user/login-form'/>">로그인 하러가기</a>
    </div>
</div>
