<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty sessionScope.loginUser}">
    <div class="alert alert-danger">
        <p class="alert-title">로그인이 필요합니다</p>
        <p class="alert-desc">수정은 로그인 이후 가능합니다.</p>
    </div>
</c:if>

<c:if test="${not empty sessionScope.loginUser}">
    <div class="card card-pad">
        <div class="row-between">
            <div>
                <h2 class="h2">목표 수정</h2>
                <p class="p">원하는 목표를 더 ‘이기기 쉽게’ 조정해봐요.</p>
            </div>
            <a class="btn" href="<c:url value='/goal/detail?goalId=${goal.goalId}'/>">취소</a>
        </div>

        <div class="hr"></div>

        <form action="<c:url value='/goal/update'/>" method="post" id="editForm">
            <input type="hidden" name="goalId" value="${goal.goalId}"/>

            <div class="stack">
                <div>
                    <label class="p" style="display:block; margin-bottom:6px;">제목</label>
                    <input class="input" name="title" required value="${goal.title}"/>
                </div>

                <div>
                    <label class="p" style="display:block; margin-bottom:6px;">설명</label>
                    <textarea class="textarea" name="description" required>${goal.description}</textarea>
                </div>

                <div class="grid-2">
                    <div>
                        <label class="p" style="display:block; margin-bottom:6px;">기간(일)</label>
                        <input class="input" type="number" name="duration" min="1" max="365" required value="${goal.duration}"/>
                    </div>

                    <div>
                        <label class="p" style="display:block; margin-bottom:6px;">검증 방식</label>
                        <select class="select" name="verificationType" required>
                            <option value="photo" ${goal.verificationType=='photo'?'selected':''}>사진 인증</option>
                            <option value="text" ${goal.verificationType=='text'?'selected':''}>텍스트 인증</option>
                            <option value="upload" ${goal.verificationType=='upload'?'selected':''}>파일 업로드</option>
                        </select>
                    </div>
                </div>

                <div class="grid-2">
                    <div>
                        <label class="p" style="display:block; margin-bottom:6px;">최소 베팅 포인트</label>
                        <input class="input" type="number" name="minBet" min="0" required value="${goal.minBet}"/>
                    </div>
                    <div>
                        <label class="p" style="display:block; margin-bottom:6px;">실패 허용</label>
                        <select class="select" name="allowFailure" required>
                            <option value="true" ${goal.allowFailure==true?'selected':''}>허용</option>
                            <option value="false" ${goal.allowFailure==false?'selected':''}>불가</option>
                        </select>
                    </div>
                </div>

                <button class="btn btn-primary" type="submit" onclick="return confirm('수정할까요?');">수정 저장</button>
            </div>
        </form>
    </div>
</c:if>
