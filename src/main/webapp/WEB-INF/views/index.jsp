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
  <link rel="stylesheet" href="<c:url value='/resources/assets/my.css'/>"/>
</head>
<body>

<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>

<main class="page">
  <div class="container">
    <c:choose>
      <c:when test="${pageParam == 'home'}">
        <jsp:include page="/WEB-INF/views/pages/home.jsp"/>
      </c:when>

      <c:when test="${pageParam == 'login'}">
        <jsp:include page="/WEB-INF/views/pages/login.jsp"/>
      </c:when>

      <c:when test="${pageParam == 'createGoal'}">
        <jsp:include page="/WEB-INF/views/pages/createGoal.jsp"/>
      </c:when>

      <c:when test="${pageParam == 'goalDetail'}">
        <jsp:include page="/WEB-INF/views/pages/goalDetail.jsp"/>
      </c:when>

      <c:when test="${pageParam == 'editGoal'}">
        <jsp:include page="/WEB-INF/views/pages/editGoal.jsp"/>
      </c:when>

      <c:when test="${pageParam == 'myPage'}">
        <jsp:include page="/WEB-INF/views/pages/myPage.jsp"/>
      </c:when>

      <c:when test="${pageParam == 'certifyGoal'}">
        <jsp:include page="/WEB-INF/views/pages/certifyGoal.jsp"/>
      </c:when>

      <c:otherwise>
        <jsp:include page="/WEB-INF/views/pages/home.jsp"/>
      </c:otherwise>
    </c:choose>
  </div>
</main>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>

</body>
</html>
