<%@ page contentType="text/html; charset=UTF-8" %>
<%
  // 파라미터로 페이지 이름을 받음 (기본값: home)
  String pageName = request.getParameter("page");
  if (pageName == null || pageName.isEmpty()) {
    pageName = "home";
  }

  // 페이지 이름에 따라 실제 JSP 경로 매핑 (보안상 경로 조작 방지)
  String contentPage = "WEB-INF/views/pages/home.jsp"; // 기본값

  if (pageName.equals("home")) contentPage = "WEB-INF/views/pages/home.jsp";
  else if (pageName.equals("create-goal")) contentPage = "WEB-INF/views/pages/createGoal.jsp";
  else if (pageName.equals("goal-detail")) contentPage = "WEB-INF/views/pages/goalDetail.jsp";
  else if (pageName.equals("edit-goal")) contentPage = "WEB-INF/views/pages/editGoal.jsp";
  else if (pageName.equals("my-page")) contentPage = "WEB-INF/views/pages/myPage.jsp";
  else if (pageName.equals("certify-goal")) contentPage = "WEB-INF/views/pages/certifyGoal.jsp";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Moneyvation</title>
  <!-- CSS 연결  -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<!-- 1. 헤더 (공통) -->
<jsp:include page="WEB-INF/views/layouts/header.jsp" />

<!-- 2. 본문 (갈아끼우기) -->
<main>
  <jsp:include page="<%= contentPage %>" />
</main>

<!-- 3. 푸터 (공통) -->
<jsp:include page="WEB-INF/views/layouts/footer.jsp" />
</body>
</html>
