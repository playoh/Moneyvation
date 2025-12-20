<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header">
    <div class="container header-inner">
        <div class="row-between">
            <a class="logo" href="<c:url value='/'/>">
                <span class="logo-badge"></span>
                <span>Moneyvation</span>
            </a>

            <div class="row">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
            <span class="badge">
              <span class="avatar">${fn:substring(sessionScope.loginUser.userName,0,1)}</span>
              ${sessionScope.loginUser.userName}
            </span>
                        <a class="btn btn-ghost" href="<c:url value='/user/my-page'/>">마이페이지</a>
                        <a class="btn" href="<c:url value='/user/logout'/>">로그아웃</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-ghost" href="<c:url value='/user/login-form'/>">로그인</a>
                        <a class="btn btn-primary" href="<c:url value='/user/login-form'/>">회원가입</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</header>
