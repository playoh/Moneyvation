<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                    <option value="true">Allow</option>
                    <option value="false">Not Allow</option>
                </select>
            </div>
        </div>

        <div style="display:flex; gap:10px; flex-wrap:wrap; margin-top:4px;">
            <button class="btn btn--primary btn--lg" type="submit">Create</button>
            <a class="btn btn--outline btn--lg" href="<c:url value='/user/my-page'/>">Cancel</a>
        </div>
    </form>
</div>
