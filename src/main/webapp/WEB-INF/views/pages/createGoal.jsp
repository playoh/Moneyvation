<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card card-pad" style="max-width: 760px; margin: 0 auto;">
    <div class="kicker">CREATE</div>
    <h2 class="h2" style="margin-top: 8px;">Create Goal</h2>
    <p class="p" style="margin-top: 8px;">목표를 만들고 친구들의 베팅을 받아보세요.</p>

    <form class="form section" action="/goal/create" method="post">
        <div class="field">
            <div class="label">Title</div>
            <input class="input" name="title" placeholder="예) 30일 동안 1일 1커밋" required/>
        </div>

        <div class="field">
            <div class="label">Description</div>
            <textarea class="textarea" name="description" placeholder="목표 설명을 적어주세요."></textarea>
        </div>

        <!-- ✅ 추가: Start / End Date -->
        <div class="form-grid">
            <div class="field">
                <div class="label">Start Date</div>
                <input class="input" type="date" name="startDate"/>
                <div class="help">목표 시작일</div>
            </div>

            <div class="field">
                <div class="label">End Date</div>
                <input class="input" type="date" name="endDate"/>
                <div class="help">목표 종료일</div>
            </div>
        </div>

        <div class="form-grid">
            <div class="field">
                <div class="label">Duration (days)</div>
                <input class="input" type="number" name="duration" placeholder="30" min="1"/>
                <div class="help">예: 7, 14, 30</div>
            </div>

            <div class="field">
                <div class="label">Min Bet</div>
                <div class="suffix-wrap">
                    <input class="input has-suffix" type="number" name="minBet" placeholder="1000" min="0"/>
                    <span class="suffix">₩</span>
                </div>
                <div class="help">최소 베팅 금액</div>
            </div>
        </div>

        <!-- ✅ 추가: category / difficulty -->
        <div class="form-grid">
            <div class="field">
                <div class="label">Category</div>
                <select class="select" name="category">
                    <option value="study">Study</option>
                    <option value="exercise">Exercise</option>
                    <option value="habit">Habit</option>
                    <option value="health">Health</option>
                    <option value="etc" selected>Etc</option>
                </select>
            </div>

            <div class="field">
                <div class="label">Difficulty</div>
                <select class="select" name="difficulty">
                    <option value="EASY">EASY</option>
                    <option value="NORMAL" selected>NORMAL</option>
                    <option value="HARD">HARD</option>
                </select>
            </div>
        </div>

        <div class="form-grid">
            <div class="field">
                <div class="label">Verification Type</div>
                <select class="select" name="verificationType">
                    <option value="photo">Photo</option>
                    <option value="text">Text</option>
                    <option value="checkin">Check-in</option>
                </select>
            </div>

            <div class="field">
                <div class="label">Allow Failure</div>
                <select class="select" name="allowFailure">
                    <!-- 너 DB 기본값이 yes/no라서 여기 값도 맞춰주는 걸 추천 -->
                    <option value="yes">Allow</option>
                    <option value="no">Not Allow</option>
                </select>
            </div>
        </div>

        <div style="display:flex; gap:10px; flex-wrap:wrap; margin-top:4px;">
            <button class="btn btn--primary btn--lg" type="submit">Create</button>
            <a class="btn btn--outline btn--lg" href="<c:url value='/'/>">Cancel</a>
        </div>
    </form>
</div>
