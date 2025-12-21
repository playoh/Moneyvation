<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card card-pad" style="max-width: 760px; margin: 0 auto;">
    <div class="kicker">EDIT</div>
    <h2 class="h2" style="margin-top: 8px;">Edit Goal</h2>
    <p class="p" style="margin-top: 8px;">목표 내용을 수정할 수 있어요.</p>

    <form class="form section" action="<c:url value='/goal/update'/>" method="post">

        <!-- ✅ goalId는 반드시 hidden -->
        <input type="hidden" name="goalId" value="${goal.goalId}" />

        <div class="field">
            <div class="label">Title</div>
            <input class="input" name="title" value="${goal.title}" required/>
        </div>

        <div class="field">
            <div class="label">Description</div>
            <textarea class="textarea" name="description">${goal.description}</textarea>
        </div>

        <!-- ✅ start/end date -->
        <div class="form-grid">
            <div class="field">
                <div class="label">Start Date</div>
                <input class="input" type="date" name="startDate" value="${goal.startDate}" />
            </div>

            <div class="field">
                <div class="label">End Date</div>
                <input class="input" type="date" name="endDate" value="${goal.endDate}" />
            </div>
        </div>

        <div class="form-grid">
            <div class="field">
                <div class="label">Duration (days)</div>
                <input class="input" type="number" name="duration" value="${goal.duration}" min="1"/>
                <div class="help">endDate가 있으면 duration은 자동 재계산될 수 있어요.</div>
            </div>

            <div class="field">
                <div class="label">Min Bet</div>
                <div class="suffix-wrap">
                    <input class="input has-suffix" type="number" name="minBet" value="${goal.minBet}" min="0"/>
                    <span class="suffix">₩</span>
                </div>
            </div>
        </div>

        <div class="form-grid">
            <div class="field">
                <div class="label">Category</div>
                <select class="select" name="category">
                    <option value="study" <c:if test="${goal.category == 'study'}">selected</c:if>>Study</option>
                    <option value="exercise" <c:if test="${goal.category == 'exercise'}">selected</c:if>>Exercise</option>
                    <option value="habit" <c:if test="${goal.category == 'habit'}">selected</c:if>>Habit</option>
                    <option value="health" <c:if test="${goal.category == 'health'}">selected</c:if>>Health</option>
                    <option value="etc" <c:if test="${goal.category == 'etc' || empty goal.category}">selected</c:if>>Etc</option>
                </select>
            </div>

            <div class="field">
                <div class="label">Difficulty</div>
                <select class="select" name="difficulty">
                    <option value="EASY" <c:if test="${goal.difficulty == 'EASY'}">selected</c:if>>EASY</option>
                    <option value="NORMAL" <c:if test="${goal.difficulty == 'NORMAL' || empty goal.difficulty}">selected</c:if>>NORMAL</option>
                    <option value="HARD" <c:if test="${goal.difficulty == 'HARD'}">selected</c:if>>HARD</option>
                </select>
            </div>
        </div>

        <div class="form-grid">
            <div class="field">
                <div class="label">Verification Type</div>
                <select class="select" name="verificationType">
                    <option value="photo" <c:if test="${goal.verificationType == 'photo'}">selected</c:if>>Photo</option>
                    <option value="text" <c:if test="${goal.verificationType == 'text'}">selected</c:if>>Text</option>
                    <option value="checkin" <c:if test="${goal.verificationType == 'checkin'}">selected</c:if>>Check-in</option>
                </select>
            </div>

            <div class="field">
                <div class="label">Allow Failure</div>
                <select class="select" name="allowFailure">
                    <option value="yes" <c:if test="${goal.allowFailure == 'yes'}">selected</c:if>>Allow</option>
                    <option value="no" <c:if test="${goal.allowFailure == 'no'}">selected</c:if>>Not Allow</option>
                </select>
            </div>
        </div>

        <div style="display:flex; gap:10px; flex-wrap:wrap; margin-top:4px;">
            <button class="btn btn--primary btn--lg" type="submit">Save</button>
            <a class="btn btn--outline btn--lg" href="<c:url value='/goal/detail?goalId=${goal.goalId}'/>">Cancel</a>
        </div>
    </form>
</div>
