<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty sessionScope.loginUser}">
    <div class="alert alert-danger">
        <p class="alert-title">로그인이 필요합니다</p>
        <p class="alert-desc">목표 작성은 로그인 이후 가능합니다.</p>
    </div>
    <div style="margin-top:10px;">
        <a class="btn btn-primary" href="<c:url value='/user/login-form'/>">로그인</a>
        <a class="btn" href="<c:url value='/'/>">메인</a>
    </div>
</c:if>

<c:if test="${not empty sessionScope.loginUser}">
    <div class="card card-pad">
        <div class="row-between">
            <div>
                <h2 class="h2">목표 작성</h2>
                <p class="p">오기로 목표 달성하기. 친구들의 실패 예상을 뒤집어봐!</p>
            </div>
            <a class="btn" href="<c:url value='/'/>">취소</a>
        </div>

        <div class="hr"></div>

        <form action="<c:url value='/goal/create'/>" method="post" id="createForm">
            <div class="stack">
                <div>
                    <label class="p" style="display:block; margin-bottom:6px;">제목</label>
                    <input class="input" name="title" required placeholder="예: 매일 30분 운동하기"/>
                </div>

                <div>
                    <label class="p" style="display:block; margin-bottom:6px;">설명</label>
                    <textarea class="textarea" name="description" required
                              placeholder="목표의 규칙/인증 방식/실패 조건 등을 적어주세요."></textarea>
                </div>

                <div class="grid-2">
                    <div>
                        <label class="p" style="display:block; margin-bottom:6px;">기간(일)</label>
                        <input class="input" type="number" name="duration" min="1" max="365" required placeholder="예: 30"/>
                    </div>

                    <div>
                        <label class="p" style="display:block; margin-bottom:6px;">검증 방식</label>
                        <select class="select" name="verificationType" required>
                            <option value="">선택</option>
                            <option value="photo">사진 인증</option>
                            <option value="text">텍스트 인증</option>
                            <option value="upload">파일 업로드</option>
                        </select>
                    </div>
                </div>

                <div class="grid-2">
                    <div>
                        <label class="p" style="display:block; margin-bottom:6px;">최소 베팅 포인트</label>
                        <input class="input" type="number" name="minBet" min="0" required placeholder="예: 1000"/>
                    </div>
                    <div>
                        <label class="p" style="display:block; margin-bottom:6px;">실패 허용</label>
                        <select class="select" name="allowFailure" required>
                            <option value="true">허용</option>
                            <option value="false">불가</option>
                        </select>
                    </div>
                </div>

                <button class="btn btn-primary" type="submit">목표 생성</button>
            </div>
        </form>
    </div>

    <script>
        // 간단 validation (원하면 더 빡세게 추가 가능)
        document.getElementById("createForm").addEventListener("submit", function(e){
            const title = this.title.value.trim();
            const desc = this.description.value.trim();
            const duration = Number(this.duration.value);
            const minBet = Number(this.minBet.value);

            if(title.length < 3){
                alert("제목은 3자 이상 입력해주세요.");
                e.preventDefault(); return;
            }
            if(desc.length < 10){
                alert("설명은 10자 이상 입력해주세요.");
                e.preventDefault(); return;
            }
            if(!(duration >= 1 && duration <= 365)){
                alert("기간은 1~365일 범위로 입력해주세요.");
                e.preventDefault(); return;
            }
            if(minBet < 0){
                alert("최소 베팅 포인트는 0 이상이어야 해요.");
                e.preventDefault(); return;
            }
            alert("목표가 생성됩니다!");
        });
    </script>
</c:if>
