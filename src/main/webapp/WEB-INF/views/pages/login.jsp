<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="login-container" style="text-align: center; margin-top: 50px;">
  <h2>로그인</h2>

  <form action="${pageContext.request.contextPath}/user/login" method="post">
    <div style="margin-bottom: 10px;">
      <input type="text" name="userId" placeholder="아이디" required style="padding: 10px; width: 200px;">
    </div>
    <div style="margin-bottom: 20px;">
      <input type="password" name="password" placeholder="비밀번호" required style="padding: 10px; width: 200px;">
    </div>
    <button type="submit" style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; cursor: pointer;">
      로그인 하기
    </button>
  </form>
</div>