<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?page=home&msg=loginRequired");
        return;
    }

    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";
%>

<div class="container" style="padding:48px 24px; max-width:800px;">
    <div class="mb-24">
        <h1 style="margin-bottom:8px;">인증 사진 업로드</h1>
        <p class="muted">진행 상황을 인증할 사진과 메모를 업로드하세요.</p>
    </div>

    <div class="card mb-24">
        <form action="<%=request.getContextPath()%>/WEB-INF/views/pages/certifyGoalAction.jsp"
              method="post"
              enctype="multipart/form-data">

            <input type="hidden" name="goalId" value="<%=goalId%>"/>

            <div class="mb-16">
                <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                    사진 업로드
                </label>
                <input class="input" type="file" name="photo" accept="image/*" required />
                <div class="small" style="margin-top:8px;">JPG/PNG 권장</div>
            </div>

            <div class="mb-16">
                <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                    메모 (선택)
                </label>
                <textarea class="input" name="note" rows="3" placeholder="간단한 메모를 남겨보세요."></textarea>
            </div>

            <div class="flex gap-12">
                <a class="btn btn-ghost"
                   href="<%=request.getContextPath()%>/WEB-INF/views/index.jsp?page=my-page&tab=my-goals">
                    돌아가기
                </a>
                <button class="btn btn-primary" type="submit" style="flex:1;">
                    업로드
                </button>
            </div>

        </form>
    </div>
</div>
