<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // TODO: 실제 파일 저장은 Multipart 처리 필요(commons-fileupload 또는 @MultipartConfig 서블릿)
    String goalId = request.getParameter("goalId");
%>

<script>
    alert("인증 업로드(목업) 완료!  ※ 실제 파일 저장은 Multipart 설정 후 구현해야 함");
    location.href = "<%=request.getContextPath()%>/index.jsp?page=my-page&tab=my-goals";
</script>
