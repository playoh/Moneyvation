<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card card-pad">
    <div class="row-between">
        <div>
            <h2 class="h2">${goal.title}</h2>
            <p class="p">작성자: ${goal.author} · 남은기간: ${goal.daysRemaining}일</p>
        </div>

        <div class="row">
            <a class="btn" href="<c:url value='/'/>">목록</a>

            <c:if test="${not empty sessionScope.loginUser}">
                <a class="btn" href="<c:url value='/goal/edit-form?goalId=${goal.goalId}'/>">수정</a>
                <button class="btn btn-danger" type="button" onclick="openDialog('deleteDialog')">삭제</button>
            </c:if>
        </div>
    </div>

    <div class="hr"></div>

    <div class="stack">
        <div class="alert">
            <p class="alert-title">목표 설명</p>
            <p class="alert-desc"><c:out value="${goal.description}"/></p>
        </div>

        <div class="row" style="flex-wrap:wrap;">
            <span class="badge">기간: ${goal.duration}일</span>
            <span class="badge">검증: ${goal.verificationType}</span>
            <span class="badge">최소베팅: ${goal.minBet}</span>
            <span class="badge">성공률: ${goal.successRate}%</span>
            <span class="badge">실패률: ${goal.failureRate}%</span>
        </div>

        <!-- “인증하기” 같은 버튼을 연결할 자리 -->
        <div class="row">
            <a class="btn btn-primary" href="<c:url value='/goal/certify-form?goalId=${goal.goalId}'/>">인증하기</a>
            <a class="btn" href="<c:url value='/goal/participants?goalId=${goal.goalId}'/>">참여자 보기</a>
        </div>
    </div>
</div>

<!-- Delete dialog (AlertDialog 대체) -->
<div class="dialog" id="deleteDialog" role="dialog" aria-modal="true">
    <div class="dialog-header">
        <p class="dialog-title">목표 삭제</p>
        <p class="dialog-desc">삭제하면 되돌릴 수 없어요. 정말 삭제할까요?</p>
    </div>
    <div class="dialog-footer">
        <button class="btn" type="button" onclick="closeDialog('deleteDialog')">취소</button>
        <a class="btn btn-danger"
           href="<c:url value='/goal/delete?goalId=${goal.goalId}'/>"
           onclick="return confirmDelete('정말 삭제할까요?');">
            삭제
        </a>
    </div>
</div>
