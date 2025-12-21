<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="auth-wrap">

  <div class="auth-card">

    <div class="auth-head">
      <div class="small" style="color:#6366f1; font-weight:900; letter-spacing:1px; margin-bottom:6px;">
        WELCOME BACK
      </div>
      <h1 class="auth-title">Login</h1>
      <p class="auth-sub">아이디와 비밀번호로 로그인하세요.</p>
    </div>

    <form class="auth-form" action="<c:url value='/user/login'/>" method="post">

      <div class="field">
        <label class="label">User ID</label>
        <input class="input" type="text" name="userId" placeholder="아이디를 입력하세요" required/>
      </div>

      <div class="field">
        <label class="label">Password</label>
        <input class="input" type="password" name="password" placeholder="비밀번호를 입력하세요" required/>
      </div>

      <div class="stack" style="gap:10px; margin-top:10px;">
        <button class="btn btn--primary btn--lg btn--full" type="submit">
          Login
        </button>
        <a class="btn btn--ghost btn--md btn--full" href="<c:url value='/'/>">
          Back to Home
        </a>
      </div>

    </form>
  </div>
</div>