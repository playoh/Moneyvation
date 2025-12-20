<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="stack" style="gap:16px;">
    <div class="card card-pad-lg">
        <div class="row-between">
            <div class="stack" style="gap:4px;">
                <h1 class="h1">My Page</h1>
                <p class="small">내가 만든 목표를 관리하고 인증을 업로드할 수 있어요.</p>
            </div>
            <a class="btn btn--primary btn--md" href="<c:url value='/goal/create-form'/>">+ 목표 생성</a>
        </div>
    </div>

    <div class="stack" style="gap:10px;">
        <c:choose>
            <c:when test="${not empty myGoals}">
                <c:forEach var="g" items="${myGoals}">
                    <div class="table-row">
                        <div class="left">
                            <div class="title">
                                <a href="<c:url value='/goal/detail?goalId=${g.goalId}'/>">
                                    <c:out value="${g.title}"/>
                                </a>
                            </div>
                            <div class="meta">
                                D-<c:out value="${g.daysRemaining}"/> · 참여자 <c:out value="${g.totalParticipants}"/>명
                            </div>
                        </div>

                        <div class="actions">
                            <a class="btn btn--outline btn--md" href="<c:url value='/goal/edit-form?goalId=${g.goalId}'/>">수정</a>
                            <a class="btn btn--danger btn--md"
                               href="<c:url value='/goal/delete?goalId=${g.goalId}'/>"
                               onclick="return confirm('정말 삭제할까요?');">삭제</a>
                            <a class="btn btn--ghost btn--md"
                               href="<c:url value='/goal/certify-form?goalId=${g.goalId}'/>">인증</a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="card card-pad-lg">
                    <h3 class="h3">아직 만든 목표가 없어요</h3>
                    <p class="p" style="margin-top:6px;">첫 목표를 만들어 친구들의 예상을 뒤집어보세요.</p>
                    <div style="margin-top:14px;">
                        <a class="btn btn--primary btn--md" href="<c:url value='/goal/create-form'/>">+ 목표 생성</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
