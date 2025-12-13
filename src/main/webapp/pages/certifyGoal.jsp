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
        <h1 style="margin-bottom:8px;">Certification Upload</h1>
        <p class="muted">Upload a photo to certify your progress.</p>
    </div>

    <div class="card mb-24">
        <form action="<%=request.getContextPath()%>/pages/certifyGoalAction.jsp"
              method="post"
              enctype="multipart/form-data">

            <input type="hidden" name="goalId" value="<%=goalId%>"/>

            <div class="mb-16">
                <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                    Upload Photo
                </label>
                <input class="input" type="file" name="photo" accept="image/*" required />
                <div class="small" style="margin-top:8px;">JPG/PNG recommended</div>
            </div>

            <div class="mb-16">
                <label class="small" style="font-weight:700;color:var(--color-text-primary);">
                    Note (optional)
                </label>
                <textarea class="input" name="note" rows="3" placeholder="Write a short note..."></textarea>
            </div>

            <div class="flex gap-12">
                <a class="btn btn-ghost"
                   href="<%=request.getContextPath()%>/index.jsp?page=my-page&tab=my-goals">
                    Back
                </a>
                <button class="btn btn-primary" type="submit" style="flex:1;">
                    Upload
                </button>
            </div>

        </form>
    </div>
</div>
