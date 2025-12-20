<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="card card-pad" style="max-width: 520px; margin: 0 auto;">
  <div class="kicker">WELCOME BACK</div>
  <h2 class="h2" style="margin-top: 8px;">Login</h2>
  <p class="p" style="margin-top: 8px;">아이디와 비밀번호로 로그인하세요.</p>

  <form class="form section" action="/user/login" method="post">
    <div class="field">
      <div class="label">User ID</div>
      <input class="input" name="userId" placeholder="userId" required/>
      <div class="help">예: moneyvation01</div>
    </div>

    <div class="field">
      <div class="label">Password</div>
      <input class="input" type="password" name="password" placeholder="password" required/>
    </div>

    <button class="btn btn--primary btn--lg btn--full" type="submit">Login</button>
    <a class="btn btn--ghost btn--md btn--full" href="/">Back to Home</a>
  </form>
</div>
