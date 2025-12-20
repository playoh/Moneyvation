<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:if test="${empty sessionScope.loginUser}">
    <div class="alert alert-danger">
        <p class="alert-title">로그인이 필요합니다</p>
        <p class="alert-desc">마이페이지는 로그인 이후 이용할 수 있어요.</p>
    </div>
    <div style="margin-top:12px;">
        <a class="btn btn--primary btn--md" href="<c:url value='/user/login-form'/>">로그인</a>
        <a class="btn btn--outline btn--md" href="<c:url value='/'/>">메인</a>
    </div>
</c:if>

<c:if test="${not empty sessionScope.loginUser}">
    <div class="stack">
        <!-- 상단 프로필 카드 -->
        <div class="card card-pad">
            <div class="row-between">
                <div>
                    <h2 class="h2">${sessionScope.loginUser.userName}님의 마이페이지</h2>
                    <p class="p">내가 만든 목표를 관리하고 인증할 수 있어요.</p>
                </div>
                <a class="btn btn--primary btn--md" href="<c:url value='/goal/create-form'/>">+ 목표 작성</a>
            </div>
        </div>

        <!-- 내가 작성한 목표 전체 보기 -->
        <div class="card card-pad">
            <div class="row-between">
                <div>
                    <h2 class="h2">내가 작성한 목표</h2>
                    <p class="p">수정 · 삭제 · 인증은 여기에서만 진행합니다.</p>
                </div>
                <span class="badge badge--outline">총 <c:out value="${fn:length(myGoalList)}"/>개</span>
            </div>

            <div class="hr"></div>

            <!-- 리스트 -->
            <c:if test="${empty myGoalList}">
                <div class="alert">
                    <p class="alert-title">아직 작성한 목표가 없어요</p>
                    <p class="alert-desc">상단의 “+ 목표 작성” 버튼으로 첫 목표를 만들어보세요.</p>
                </div>
            </c:if>

            <c:if test="${not empty myGoalList}">
                <div class="my-goal-list">
                    <c:forEach var="g" items="${myGoalList}" varStatus="st">
                        <!-- ✅ 목표 한 줄 카드 -->
                        <div class="my-goal-row">
                            <!-- 좌측: 제목/메타 -->
                            <div class="my-goal-left">
                                <a class="my-goal-title"
                                   href="<c:url value='/goal/detail?goalId=${g.goalId}'/>">
                                    <c:out value="${g.title}"/>
                                </a>
                                <div class="my-goal-meta">
                                    <span class="badge badge--outline">기간 ${g.duration}일</span>
                                    <span class="badge badge--outline">검증 ${g.verificationType}</span>
                                    <span class="badge badge--primary">최소 ${g.minBet}P</span>
                                </div>
                            </div>

                            <!-- 우측: 수정/삭제/인증 3버튼 -->
                            <div class="my-goal-actions">
                                <a class="btn btn--outline btn--sm"
                                   href="<c:url value='/goal/edit-form?goalId=${g.goalId}'/>">
                                    수정
                                </a>

                                <!-- ✅ 삭제: JS 없이 모달(checkbox) -->
                                <input class="modal-toggle" type="checkbox" id="deleteModal_${st.index}"/>

                                <label class="btn btn--danger btn--sm" for="deleteModal_${st.index}">
                                    삭제
                                </label>

                                <label class="modal-overlay" for="deleteModal_${st.index}"></label>
                                <div class="modal" role="dialog" aria-modal="true">
                                    <div class="modal-header">
                                        <p class="modal-title">목표 삭제</p>
                                        <p class="modal-desc">
                                            "<c:out value="${g.title}"/>" 목표를 삭제할까요? 되돌릴 수 없습니다.
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <label class="btn btn--outline btn--md" for="deleteModal_${st.index}">취소</label>

                                        <!-- ✅ 삭제 실행: 컨트롤러 방식 추천 -->
                                        <a class="btn btn--danger btn--md"
                                           href="<c:url value='/goal/delete?goalId=${g.goalId}'/>">
                                            삭제
                                        </a>

                                        <!-- 만약 deleteGoalAction.jsp로 처리 중이면 컨트롤러로 forwarding 권장 -->
                                    </div>
                                </div>

                                <a class="btn btn--primary btn--sm"
                                   href="<c:url value='/goal/certify-form?goalId=${g.goalId}'/>">
                                    인증
                                </a>
                            </div>
                        </div>
                        <!-- ✅ 끝 -->
                    </c:forEach>
                </div>
            </c:if>

        </div>
    </div>
</c:if>
