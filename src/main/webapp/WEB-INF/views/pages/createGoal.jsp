<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value='/resources/assets/my.css'/>">

<div class="page">
    <div class="container">

        <div class="card card-pad-lg" style="max-width: 760px; margin: 0 auto;">

            <div class="kicker" style="color:#6366f1; margin-bottom:6px;">CREATE</div>
            <h2 class="h2" style="margin-bottom:8px;">Create Goal</h2>
            <p class="p" style="margin-bottom:24px;">목표를 만들고 친구들의 베팅을 받아보세요.</p>

            <form class="stack" action="<c:url value='/goal/create'/>" method="post">

                <div class="field">
                    <label class="label">Title</label>
                    <input class="input" name="title" placeholder="예) 30일 동안 1일 1커밋" required/>
                </div>

                <div class="field">
                    <label class="label">Description</label>
                    <textarea class="textarea" name="description" placeholder="목표 설명을 적어주세요."></textarea>
                </div>

                <div class="grid grid-2">
                    <div class="field">
                        <label class="label">Duration (days)</label>
                        <input class="input" type="number" name="duration" placeholder="30" min="1"/>
                        <div class="help">예: 7, 14, 30</div>
                    </div>

                    <div class="field">
                        <label class="label">Min Bet</label>
                        <div class="row" style="gap:8px;">
                            <input class="input" type="number" name="minBet" placeholder="1000" min="0" style="flex:1;"/>
                            <span style="font-weight:900; color:#94a3b8;">₩</span>
                        </div>
                        <div class="help">최소 베팅 금액</div>
                    </div>
                </div>

                <div class="grid grid-2">
                    <div class="field">
                        <label class="label">Verification Type</label>
                        <select class="select" name="verificationType">
                            <option value="photo">Photo</option>
                            <option value="text">Text</option>
                            <option value="checkin">Check-in</option>
                        </select>
                    </div>

                    <div class="field">
                        <label class="label">Allow Failure</label>
                        <select class="select" name="allowFailure">
                            <option value="true">Allow</option>
                            <option value="false">Not Allow</option>
                        </select>
                    </div>
                </div>

                <div class="row" style="margin-top:12px;">
                    <button class="btn btn--primary btn--lg" type="submit">Create</button>
                    <a class="btn btn--outline btn--lg" href="<c:url value='/user/my-page'/>">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>