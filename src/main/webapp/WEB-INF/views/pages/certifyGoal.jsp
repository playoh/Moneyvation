<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card card-pad" style="max-width: 760px; margin: 0 auto;">
    <div class="kicker">CERTIFY</div>
    <h2 class="h2" style="margin-top:8px;">Goal Certification</h2>
    <p class="p" style="margin-top:8px;">
        목표 인증을 제출하세요. (현재는 기본 폼 UI 구성)
    </p>

    <div class="panel panel-pad section" style="box-shadow:none;">
        <div class="h3">${goal.title}</div>
        <p class="p-sm" style="margin-top:6px;">by ${goal.author} · D-${goal.daysRemaining}</p>
    </div>

    <!-- 인증 폼: 실제 업로드는 multipart 설정 후 연결 -->
    <form class="form section" action="<c:url value='/goal/certify'/>" method="post" enctype="multipart/form-data">

        <input type="hidden" name="goalId" value="${goal.goalId}"/>

        <div class="field">
            <div class="label">Certification Type</div>
            <select class="select" name="verificationType">
                <option value="photo">Photo</option>
                <option value="text">Text</option>
                <option value="checkin">Check-in</option>
            </select>
        </div>

        <div class="field">
            <div class="label">Upload Photo</div>
            <input class="input" type="file" name="photo" required/>
            <div class="help">인증샷을 선택해주세요.</div>
        </div>

        <div class="field">
            <div class="label">Message</div>
            <textarea class="textarea" name="note" placeholder="인증 설명/메모"></textarea>
        </div>

        <div style="display:flex; gap:10px; flex-wrap:wrap;">
            <button class="btn btn--primary btn--lg" type="submit">Submit</button>
            <a class="btn btn--outline btn--lg" href="<c:url value='/goal/detail?goalId=${goal.goalId}'/>">Back</a>
        </div>
    </form>
</div>
