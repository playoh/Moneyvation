<%@ page contentType="text/html; charset=UTF-8" %>
<div class="container" style="padding:48px 24px; max-width:500px;">
  <div class="center mb-24">
    <h1 style="margin-bottom:8px;">회원가입</h1>
    <p class="muted">머니베이션의 회원이 되어 목표를 달성해보세요.</p>
  </div>

  <!-- action 경로 주의: UserController의 @PostMapping("/signup") 주소 -->
  <form action="${pageContext.request.contextPath}/user/signup" method="post">

    <!-- 아이디 -->
    <div class="mb-16">
      <label class="small" style="font-weight:700;">아이디</label>
      <input type="text" name="userId" class="input" placeholder="영문, 숫자 포함" required />
    </div>

    <!-- 비밀번호 -->
    <div class="mb-16">
      <label class="small" style="font-weight:700;">비밀번호</label>
      <input type="password" name="password" class="input" placeholder="비밀번호 입력" required />
    </div>

    <!-- 이름 (VO의 userName 매핑) -->
    <div class="mb-16">
      <label class="small" style="font-weight:700;">이름</label>
      <input type="text" name="userName" class="input" placeholder="실명 입력" required />
    </div>

    <!-- 닉네임 -->
    <div class="mb-24">
      <label class="small" style="font-weight:700;">닉네임</label>
      <input type="text" name="nickname" class="input" placeholder="화면에 표시될 별명" required />
    </div>

    <button class="btn btn-primary" type="submit" style="width:100%; padding:14px;">
      가입하기
    </button>
  </form>
</div>
