<%@ page contentType="text/html; charset=UTF-8" %>
<%
  // 1. Controller 값 확인
  String pageName = (String) request.getAttribute("page");
  if (pageName == null) pageName = request.getParameter("page");
  if (pageName == null || pageName.isEmpty()) pageName = "home";

  String contentPage = "/WEB-INF/views/pages/home.jsp"; // 기본값

  if (pageName.equals("home"))
    contentPage = "/WEB-INF/views/pages/home.jsp";

  else if (pageName.equals("create-goal"))  // createGoal -> create-goal
    contentPage = "/WEB-INF/views/pages/createGoal.jsp";

  else if (pageName.equals("goal-detail"))  // goalDetail -> goal-detail
    contentPage = "/WEB-INF/views/pages/goalDetail.jsp";

  else if (pageName.equals("edit-goal"))    // editGoal -> edit-goal
    contentPage = "/WEB-INF/views/pages/editGoal.jsp";

  else if (pageName.equals("my-page"))      // myPage -> my-page
    contentPage = "/WEB-INF/views/pages/myPage.jsp";

  else if (pageName.equals("certify-goal")) // certifyGoal -> certify-goal
    contentPage = "/WEB-INF/views/pages/certifyGoal.jsp";

  else if (pageName.equals("login"))
    contentPage = "/WEB-INF/views/pages/login.jsp";
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Moneyvation</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

<main>
  <jsp:include page="<%= contentPage %>" />
</main>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>