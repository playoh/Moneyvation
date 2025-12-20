<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="card card-pad">
  <h2 class="page-title">Login</h2>
  <p class="subtle">아이디/비밀번호로 로그인하세요.</p>

  <form action="/user/login" method="post" class="section">
    <div class="form-grid">
      <div class="field">
        <div class="label">User ID</div>
        <input class="input" name="userId" placeholder="userId" required />
      </div>
      <div class="field">
        <div class="label">Password</div>
        <input class="input" type="password" name="password" placeholder="password" required />
      </div>
    </div>

    <div class="form-actions">
      <button class="btn btn--primary btn--md" type="submit">Login</button>
      <a class="btn btn--outline btn--md" href="/">Cancel</a>
    </div>
  </form>
</div>
