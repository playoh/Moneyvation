<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
  String pageParam = request.getParameter("page");
  if (pageParam == null || pageParam.trim().isEmpty()) pageParam = "home";
  request.setAttribute("pageParam", pageParam);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Moneyvation</title>
  <link rel="stylesheet" href="<c:url value='/assets/my.css'/>"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<main class="page">
  <div class="container">
    <c:choose>
      <c:when test="${pageParam == 'home'}">
        <jsp:include page="/WEB-INF/views/pages/home.jsp"/>
      </c:when>
      <c:when test="${pageParam == 'login'}">
        <jsp:include page="/WEB-INF/views/pages/login.jsp"/>
      </c:when>
      <c:when test="${pageParam == 'create-goal'}">
        <jsp:include page="/WEB-INF/views/pages/createGoal.jsp"/>
      </c:when>
      <c:when test="${pageParam == 'goal-detail'}">
        <jsp:include page="/WEB-INF/views/pages/goalDetail.jsp"/>
      </c:when>
      <c:when test="${pageParam == 'edit-goal'}">
        <jsp:include page="/WEB-INF/views/pages/editGoal.jsp"/>
      </c:when>
      <c:when test="${pageParam == 'my-page'}">
        <jsp:include page="/WEB-INF/views/pages/myPage.jsp"/>
      </c:when>
      <c:otherwise>
        <jsp:include page="/WEB-INF/views/pages/home.jsp"/>
      </c:otherwise>
    </c:choose>
  </div>
</main>

<!-- Dialog Overlay (AlertDialog 대체) -->
<div class="dialog-overlay"></div>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>

<script src="<c:url value='/assets/ui.js'/>"></script>
</body>
</html>
