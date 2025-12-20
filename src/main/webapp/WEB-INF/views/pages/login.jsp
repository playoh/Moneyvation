<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card card-pad" style="max-width:520px; margin:0 auto;">
  <h2 class="h2">로그인</h2>
  <p class="p">세션 기반 로그인으로 목표/베팅 기능을 사용할 수 있어요.</p>

  <c:if test="${not empty error}">
    <div class="alert alert-danger" style="margin-top:12px;">
      <p class="alert-title">로그인 실패</p>
      <p class="alert-desc">${error}</p>
    </div>
  </c:if>

  <form action="<c:url value='/user/login'/>" method="post" style="margin-top:14px;">
    <div class="stack">
      <div>
        <label class="p" style="display:block; margin-bottom:6px;">아이디</label>
        <input class="input" name="userId" placeholder="userId" required />
      </div>
      <div>
        <label class="p" style="display:block; margin-bottom:6px;">비밀번호</label>
        <input class="input" type="password" name="password" placeholder="password" required />
      </div>
      <button class="btn btn-primary" type="submit">로그인</button>
      <a class="btn btn-ghost" href="<c:url value='/'/>">메인으로</a>
    </div>
  </form>
</div>
