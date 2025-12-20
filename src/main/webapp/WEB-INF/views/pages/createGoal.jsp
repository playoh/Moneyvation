<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="card card-pad">
    <h2 class="page-title">Create Goal</h2>
    <p class="subtle">목표를 만들고 친구들의 베팅을 받아보세요.</p>

    <form action="/goal/create" method="post" class="section">
        <div class="field">
            <div class="label">Title</div>
            <input class="input" name="title" placeholder="예) 한 달 동안 매일 운동" required />
        </div>

        <div class="field">
            <div class="label">Description</div>
            <textarea class="textarea" name="description" placeholder="목표 설명을 적어주세요."></textarea>
        </div>

        <div class="form-grid">
            <div class="field">
                <div class="label">Duration (days)</div>
                <input class="input" type="number" name="duration" placeholder="30" min="1" />
            </div>
            <div class="field">
                <div class="label">Min Bet</div>
                <input class="input" type="number" name="minBet" placeholder="1000" min="0" />
            </div>
        </div>

        <div class="form-actions">
            <button class="btn btn--primary btn--md" type="submit">Create</button>
            <a class="btn btn--outline btn--md" href="/user/my-page">Back to MyPage</a>
        </div>
    </form>
</div>
