<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // TODO: 실제 인증 파일 업로드 처리는 Multipart로 구현 필요 (commons-fileupload 또는 @MultipartConfig)
    String goalId = request.getParameter("goalId");
    if (goalId == null) goalId = "1";
%>

<script>
    alert("인증 사진 업로드가 완료되었습니다! (파일 저장 로직은 추후 구현 예정)");
    location.href = "../../../index.jsp";
</script>
