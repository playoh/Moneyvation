<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // 세션에서 로그인 여부 확인
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null) loggedIn = false;
%>

<header class="header">
    <div class="container header-inner">
        <!-- 1. 로고 클릭 시 홈으로 이동 -->
        <!-- 컨트롤러가 있으니 이제 ?page=home 파라미터 없이 그냥 루트(/)로 가도 됩니다 -->
        <a href="<%=request.getContextPath()%>/ " class="logo">
            <div class="logo-badge">M</div>
            <div>Moneyvation</div>
        </a>

        <div class="flex gap-12">
            <% if (!loggedIn) { %>
            <!-- 2. 로그인 버튼 -->
            <!-- 컨트롤러의 @GetMapping("/login") 으로 이동 -->
            <a href="${pageContext.request.contextPath}/user/login-form" class="btn btn-ghost">로그인</a>

            <!-- 3. 회원가입 버튼 -->
            <button class="btn btn-primary" type="button"
                    onclick="alert('회원가입 기능 준비중');">
                회원가입
            </button>
            <% } else { %>
            <!-- 4. 마이페이지 버튼 -->
            <!-- 컨트롤러의 /mypage 경로로 이동 (만드셔야 함) -->
            <a class="btn btn-outline" href="<%=request.getContextPath()%>/myPage">마이페이지</a>

            <!-- 5. 로그아웃 버튼 -->
            <!-- 컨트롤러의 @RequestMapping("/logout") 으로 요청 -->
            <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-ghost">
                로그아웃
            </a>
            <% } %>
        </div>
    </div>
</header>
