<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card card-pad" style="max-width: 760px; margin: 0 auto;">
    <div class="kicker">EDIT</div>
    <h2 class="h2" style="margin-top: 8px;">Edit Goal</h2>
    <p class="p" style="margin-top: 8px;">목표 정보를 수정합니다.</p>

    <form class="form section" action="/goal/update" method="post">
        <input type="hidden" name="goalId" value="${goal.goalId}"/>

        <div class="field">
            <div class="label">Title</div>
            <input class="input" name="title" value="${goal.title}" required/>
        </div>

        <div class="field">
            <div class="label">Description</div>
            <textarea class="textarea" name="description">${goal.description}</textarea>
        </div>

        <div class="form-grid">
            <div class="field">
                <div class="label">Duration (days)</div>
                <input class="input" type="number" name="duration" value="${goal.duration}" min="1"/>
            </div>

            <div class="field">
                <div class="label">Min Bet</div>
                <div class="suffix-wrap">
                    <input class="input has-suffix" type="number" name="minBet" value="${goal.minBet}" min="0"/>
                    <span class="suffix">₩</span>
                </div>
            </div>
        </div>

        <div style="display:flex; gap:10px; flex-wrap:wrap; margin-top:4px;">
            <button class="btn btn--primary btn--lg" type="submit">Save</button>
            <a class="btn btn--outline btn--lg" href="<c:url value='/goal/detail?goalId=${goal.goalId}'/>">Back</a>
        </div>
    </form>
</div>
