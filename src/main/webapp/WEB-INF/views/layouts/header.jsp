<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
            <span class="chip">
              <span class="avatar">${fn:substring(sessionScope.loginUser.userName,0,1)}</span>
              ${sessionScope.loginUser.userName}
            </span>

                        <a class="btn btn--outline btn--md" href="<c:url value='/user/my-page'/>">My Page</a>
                        <a class="btn btn--ghost btn--md" href="<c:url value='/user/logout'/>">Logout</a>
                    </c:when>

                    <c:otherwise>
                        <a class="btn btn--ghost btn--md" href="<c:url value='/user/login-form'/>">Login</a>
                        <a class="btn btn--primary btn--md" href="<c:url value='/user/signup-form'/>">Sign Up</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</header>
