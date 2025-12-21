<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="auth-wrap">
    <div class="auth-card">
        <div class="auth-head">
            <h1 class="auth-title">Sign Up</h1>
            <p class="auth-sub">아이디와 닉네임을 설정하고 Moneyvation을 시작해요.</p>
        </div>

        <form action="<c:url value='/user/signup'/>" method="post" class="auth-form">
            <div class="field">
                <label class="label">아이디 (user_id)</label>
                <input class="input" name="userId" type="text" placeholder="예: test" required />
            </div>

            <div class="field">
                <label class="label">비밀번호</label>
                <input class="input" name="password" type="password" placeholder="비밀번호 입력" required />
            </div>

            <div class="field">
                <label class="label">닉네임 (user_name)</label>
                <input class="input" name="userName" type="text" placeholder="예: 테스트유저" required />
            </div>

            <button class="btn btn--primary btn--md w-full" type="submit">회원가입</button>

            <c:if test="${param.error == 'duplicate'}">
                <p class="form-msg form-msg--error">이미 사용 중인 아이디입니다.</p>
            </c:if>

            <div class="auth-foot">
                이미 계정이 있나요?
                <a class="link" href="<c:url value='/user/login-form'/>">로그인</a>
            </div>
        </form>
    </div>
</div>
