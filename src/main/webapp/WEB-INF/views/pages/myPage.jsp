<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    /* 모달 배경 (어둡게 처리) */
    .modal-overlay {
        display: none; /* 기본적으로 숨김 */
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 1000;
        justify-content: center;
        align-items: center;
    }
    /* 모달창 본체 */
    .modal-content {
        background: white;
        padding: 24px;
        border-radius: 16px;
        width: 90%;
        max-width: 500px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        position: relative;
    }
    /* 모달 활성화 시 보이기 */
    .modal-overlay.active {
        display: flex;
    }
</style>

<div class="stack" style="gap:16px;">
    <div class="card card-pad-lg">
        <div class="row-between">
            <div class="stack" style="gap:4px;">
                <h1 class="h1">My Page</h1>
                <p class="small">내가 만든 목표를 관리하고 인증을 업로드할 수 있어요.</p>
            </div>
            <a class="btn btn--primary btn--md" href="<c:url value='/goal/create-form'/>">+ 목표 생성</a>
        </div>
    </div>

    <div class="stack" style="gap:10px;">
        <c:choose>
            <c:when test="${not empty myGoals}">
                <c:forEach var="g" items="${myGoals}">
                    <div class="table-row">
                        <div class="left">
                            <div class="title">
                                <a href="<c:url value='/goal/detail?goalId=${g.goalId}'/>">
                                    <c:out value="${g.title}"/>
                                </a>
                            </div>
                            <div class="meta">
                                D-<c:out value="${g.daysRemaining}"/> · 참여자 <c:out value="${g.totalParticipants}"/>명
                            </div>
                        </div>

                        <div class="actions">
                            <a class="btn btn--outline btn--md"
                               href="<c:url value='/goal/edit-form?goalId=${g.goalId}'/>">수정</a>

                            <form method="post" action="<c:url value='/goal/delete'/>" style="display:inline;">
                                <input type="hidden" name="goalId" value="${g.goalId}"/>
                                <button class="btn btn--danger btn--md"
                                        type="submit"
                                        onclick="return confirm('정말 삭제할까요?');">삭제</button>
                            </form>

                            <button class="btn btn--ghost btn--md"
                                    type="button"
                                    onclick="openCertifyModal('${g.goalId}', '${g.title}')">
                                인증
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="card card-pad-lg">
                    <h3 class="h3">아직 만든 목표가 없어요</h3>
                    <p class="p" style="margin-top:6px;">첫 목표를 만들어 친구들의 예상을 뒤집어보세요.</p>
                    <div style="margin-top:14px;">
                        <a class="btn btn--primary btn--md" href="<c:url value='/goal/create-form'/>">+ 목표 생성</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div id="certifyModal" class="modal-overlay">
    <div class="modal-content">
        <div class="row-between" style="margin-bottom:16px;">
            <h2 class="h2">목표 인증하기</h2>
            <button type="button" class="btn btn--ghost" onclick="closeCertifyModal()" style="padding:4px 8px;">✕</button>
        </div>

        <p class="p-sm" id="modalGoalTitle" style="margin-bottom:16px; color:var(--primary);">
        </p>

        <form action="<c:url value='/goal/certify'/>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="goalId" id="modalGoalId" value=""/>

            <div class="stack" style="gap:12px;">
                <div class="field">
                    <div class="label">인증 사진</div>
                    <input class="input" type="file" name="file" accept="image/*" required/>
                </div>

                <div class="field">
                    <div class="label">코멘트</div>
                    <textarea class="textarea" name="message" placeholder="오늘 실천한 내용을 적어주세요" rows="3"></textarea>
                </div>

                <div class="row" style="gap:8px; justify-content:flex-end; margin-top:8px;">
                    <button type="button" class="btn btn--outline btn--lg" onclick="closeCertifyModal()">취소</button>
                    <button type="submit" class="btn btn--primary btn--lg">인증 업로드</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    // 모달 열기 함수
    function openCertifyModal(goalId, title) {
        // 1. 모달창 요소 가져오기
        const modal = document.getElementById('certifyModal');
        // 2. hidden input에 goalId 값 넣기 (서버로 전송하기 위해)
        document.getElementById('modalGoalId').value = goalId;
        // 3. 사용자에게 보여줄 제목 설정
        document.getElementById('modalGoalTitle').innerText = '"' + title + '" 목표를 인증합니다.';
        // 4. 모달 보이게 하기 (active 클래스 추가)
        modal.classList.add('active');
    }

    // 모달 닫기 함수
    function closeCertifyModal() {
        const modal = document.getElementById('certifyModal');
        modal.classList.remove('active');
    }

    // (선택사항) 배경 클릭 시 닫기
    document.getElementById('certifyModal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeCertifyModal();
        }
    });
</script>