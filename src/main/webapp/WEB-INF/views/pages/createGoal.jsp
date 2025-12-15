<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 로그인 체크 -->
<c:if test="${empty sessionScope.isLoggedIn or not sessionScope.isLoggedIn}">
    <script>
        alert('로그인이 필요한 서비스입니다.');
        location.href = '../../../index.jsp';
    </script>
</c:if>

<div class="container" style="padding:48px 24px; max-width:800px;">
    <div class="mb-24">
        <h1 style="margin-bottom:8px;">새 목표 만들기</h1>
        <p class="muted">이루고 싶은 목표를 설정하고 베팅을 시작해보세요.</p>
    </div>

    <!-- action을 Controller 주소로 변경 -->
    <form action="${pageContext.request.contextPath}/goal/create" method="post">

        <!-- 1. 목표 제목 -->
        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                목표 제목
            </label>
            <input type="text" name="title" class="input" placeholder="예: 3개월 동안 5kg 감량하기" required />
        </div>

        <!-- 2. 목표 설명 -->
        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                목표 설명
            </label>
            <textarea name="description" class="input" rows="5" placeholder="구체적인 계획이나 다짐을 적어주세요." required></textarea>
        </div>

        <!-- 3. 목표 기간 -->
        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                목표 기간 (일)
            </label>
            <input type="number" name="duration" class="input" placeholder="예: 30" min="1" required />
        </div>

        <!-- 4. 검증 방식 -->
        <div class="mb-16">
            <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                검증 방식
            </label>
            <select name="verificationType" class="input">
                <option value="photo">사진 업로드</option>
                <option value="daily-log">일일 텍스트 로그</option>
                <option value="external-proof">외부 증빙(링크/스크린샷)</option>
            </select>
        </div>

        <!-- 5. 베팅 설정 카드 -->
        <div class="card mb-24" style="background:#f8fafc;">
            <h3 style="margin-bottom:12px;">베팅 설정</h3>

            <div class="mb-16">
                <label class="small">최소 베팅 금액 (P)</label>
                <input type="number" name="minBet" class="input" value="1000" min="0" />
            </div>

            <div class="mb-16">
                <label class="small">실패 베팅 허용</label>
                <select name="allowFailure" class="input">
                    <option value="yes">네, 실패 베팅도 허용</option>
                    <option value="no">아니오, 성공 베팅만 허용</option>
                </select>
            </div>
        </div>

        <!-- 6. 버튼 영역 -->
        <div class="flex gap-12">
            <a class="btn btn-ghost" href="${pageContext.request.contextPath}/index.jsp?page=home">
                취소
            </a>
            <button class="btn btn-primary" type="submit" style="flex:1;">
                목표 생성하기
            </button>
        </div>

    </form>
</div>
