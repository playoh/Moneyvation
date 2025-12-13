<%@ page contentType="text/html; charset=UTF-8" %>
<%
  String pageParam = request.getParameter("page");
  if (pageParam == null) pageParam = "home";

  String view;
  switch (pageParam) {
    case "goal-detail":
      view = "/pages/goalDetail.jsp";
      break;
    case "my-page":
      view = "/pages/myPage.jsp";
      break;
    case "create-goal":
      view = "/pages/createGoal.jsp";
      break;
    case "goal-edit":
      view = "/pages/editGoal.jsp";
      break;
    case "goal-certify":
      view = "/pages/certifyGoal.jsp";
      break;g
    case "home":
    default:
      view = "/pages/home.jsp";
      break;
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Moneyvation</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/style.css" />
</head>
<body>
<%@ include file="/layouts/header.jsp" %>

<main>
  <jsp:include page="<%=view%>" />
</main>

<%@ include file="/layouts/footer.jsp" %>
</body>
</html>
