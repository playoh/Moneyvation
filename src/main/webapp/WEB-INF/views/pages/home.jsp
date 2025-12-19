<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<div class="container" style="padding:64px 24px;">
    <div class="center mb-48">
        <div class="small" style="letter-spacing:.12em;text-transform:uppercase;margin-bottom:10px;">베팅형 목표 관리</div>
        <h1 style="margin-bottom:16px;background:linear-gradient(90deg,var(--color-primary),var(--color-primary-hover));-webkit-background-clip:text;color:transparent;">
            머니베이션과 함께 목표를 이루세요
        </h1>
        <p class="muted" style="font-size:18px;max-width:720px;margin:0 auto 22px;">
            목표를 흥미로운 도전으로 바꾸세요. 친구들이 성공/실패를 예측하도록 하고,
            베팅을 이겨내며 동기부여를 유지해보세요!
        </p>

        <a class="btn btn-primary"
           href="<c:url value='/goal/create-form'/>">
            목표 만들기
        </a>
    </div>

    <div class="card mb-24">
        <div class="grid-2">
            <c:if test="${empty goalList}">
                <div class="card" style="grid-column:1/-1;text-align:center;">
                    등록된 목표가 없습니다. 첫 목표를 만들어보세요!
                </div>
            </c:if>

            <c:forEach var="g" items="${goalList}">
                <a class="card" href="${pageContext.request.contextPath}/goal/detail?goalId=${g.goalId}"
                   style="display:block;cursor:pointer;">
                    <div style="display:flex;flex-direction:column;gap:14px;">
                        <div>
                            <h3 style="margin-bottom:6px;">${g.title}</h3>
                            <div class="small">작성자 ${g.author}</div>
                        </div>
                        <div class="muted">${g.description}</div>

                        <div class="flex gap-12 small">
                            <div>D-${g.daysRemaining}</div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>