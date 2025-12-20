<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty sessionScope.loginUser}">
    <div class="alert alert-danger">
        <p class="alert-title">로그인이 필요합니다</p>
        <p class="alert-desc">마이페이지는 로그인 이후 가능합니다.</p>
    </div>
</c:if>

<c:if test="${not empty sessionScope.loginUser}">
    <div class="stack">
        <div class="card card-pad">
            <div class="row-between">
                <div class="row">
                    <div class="avatar">${sessionScope.loginUser.userName.substring(0,1)}</div>
                    <div>
                        <h2 class="h2">${sessionScope.loginUser.userName}님의 마이페이지</h2>
                        <p class="p">내 목표 / 내 베팅 / 내 통계</p>
                    </div>
                </div>
                <a class="btn" href="<c:url value='/'/>">홈</a>
            </div>
        </div>

        <div class="card card-pad">
            <h2 class="h2">요약</h2>
            <div class="row" style="flex-wrap:wrap; margin-top:12px;">
                <span class="badge">참여 목표: ${myStats.totalGoals}</span>
                <span class="badge">총 베팅: ${myStats.totalBet}</span>
                <span class="badge">성공: ${myStats.successCount}</span>
                <span class="badge">실패: ${myStats.failCount}</span>
            </div>
        </div>
    </div>
</c:if>
