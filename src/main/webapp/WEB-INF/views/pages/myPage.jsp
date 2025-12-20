<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card card-pad">
    <h2 class="page-title">My Page</h2>
    <p class="subtle">내가 작성한 목표를 관리하고, 인증/수정/삭제를 여기서 바로 할 수 있어요.</p>

    <div class="section">
        <div class="row" style="justify-content: space-between; align-items: flex-end;">
            <div>
                <div class="label">내가 작성한 목표</div>
                <div class="subtle">※ 버튼은 오른쪽에 3개(수정/삭제/인증)로 고정</div>
            </div>
            <a class="btn btn--primary btn--sm" href="<c:url value='/goal/create-form'/>">+ 목표 작성하기</a>
        </div>
    </div>

    <div class="section list">
        <c:choose>
            <c:when test="${not empty goalList}">
                <c:forEach var="g" items="${goalList}">
                    <div class="card list-item">
                        <div class="list-left">
                            <div class="list-title">
                                <a href="<c:url value='/goal/detail?goalId=${g.goalId}'/>">${g.title}</a>
                            </div>
                            <div class="list-sub">Goal ID: ${g.goalId} · Author: ${g.author}</div>
                        </div>

                        <div class="list-actions">
                            <a class="btn btn--outline btn--sm" href="<c:url value='/goal/edit-form?goalId=${g.goalId}'/>">수정</a>
                            <a class="btn btn--danger btn--sm" href="<c:url value='/goal/delete?goalId=${g.goalId}'/>">삭제</a>
                            <a class="btn btn--success btn--sm" href="<c:url value='/goal/certify-form?goalId=${g.goalId}'/>">인증</a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="alert">아직 작성한 목표가 없어요. “+ 목표 작성하기”로 첫 목표를 만들어보세요.</div>

                <!-- UI 확인용 더미 2개 -->
                <div class="card list-item">
                    <div class="list-left">
                        <div class="list-title"><a href="#">(샘플) 아침 6시 기상 챌린지</a></div>
                        <div class="list-sub">Goal ID: - · Author: me</div>
                    </div>
                    <div class="list-actions">
                        <a class="btn btn--outline btn--sm" href="#">수정</a>
                        <a class="btn btn--danger btn--sm" href="#">삭제</a>
                        <a class="btn btn--success btn--sm" href="#">인증</a>
                    </div>
                </div>

                <div class="card list-item">
                    <div class="list-left">
                        <div class="list-title"><a href="#">(샘플) 30일 코딩 1일 1커밋</a></div>
                        <div class="list-sub">Goal ID: - · Author: me</div>
                    </div>
                    <div class="list-actions">
                        <a class="btn btn--outline btn--sm" href="#">수정</a>
                        <a class="btn btn--danger btn--sm" href="#">삭제</a>
                        <a class="btn btn--success btn--sm" href="#">인증</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
