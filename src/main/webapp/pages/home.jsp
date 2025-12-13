<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // 목업 목표 데이터
    class Goal {
        int id; String title; String author; String description;
        int daysRemaining; int participants; int successRate; int failureRate;
        Goal(int id,String t,String a,String d,int day,int p,int s,int f){
            this.id=id; title=t; author=a; description=d;
            daysRemaining=day; participants=p; successRate=s; failureRate=f;
        }
    }
    java.util.List<Goal> goals = new java.util.ArrayList<>();
    goals.add(new Goal(1,"3개월 동안 마라톤 훈련 완주하기","Sarah Kim","3개월 동안 주 5회 이상 달리며 풀코스 마라톤을 완주할 체력을 만든다.",45,24,65,35));
    goals.add(new Goal(2,"올해 책 50권 읽기","John Park","한 해 동안 소설, 논픽션, 자기계발 등 다양한 장르의 책 50권을 읽는다.",180,18,55,45));
    goals.add(new Goal(3,"자바스크립트 배우고 5개 프로젝트 만들기","Mike Lee","JS 기본기를 다지고 개인 프로젝트 5개를 완성해 포트폴리오를 만든다.",120,32,72,28));
    goals.add(new Goal(4,"식단+운동으로 10kg 감량하기","Emily Chen","꾸준한 식단 관리와 근력+유산소 운동으로 목표 체중에 도달한다.",90,41,48,52));
    goals.add(new Goal(5,"꿈의 여행자금 1만 달러 모으기","David Kim","매달 저축해 1만 달러를 모아 원하는 여행을 떠난다.",240,15,60,40));
    goals.add(new Goal(6,"100일 동안 매일 아침 6시 기상","Lisa Wang","아침 루틴을 만들기 위해 100일간 6시에 기상하고 기록을 남긴다.",67,28,42,58));
%>

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
           href="<%=request.getContextPath()%>/index.jsp?page=create-goal">
            목표 만들기
        </a>
    </div>

    <div class="card mb-24">
        <div class="grid-2">
            <div>
                <div class="small" style="margin-bottom:8px;">상태</div>
                <select class="input">
                    <option>모든 목표</option><option>진행중</option><option>완료</option><option>실패</option>
                </select>
            </div>
            <div>
                <div class="small" style="margin-bottom:8px;">정렬 기준</div>
                <select class="input">
                    <option>최신순</option><option>인기순</option><option>마감 임박</option><option>베팅액 높은 순</option>
                </select>
            </div>
        </div>
    </div>

    <div class="grid-2">
        <%
            for (Goal g : goals) {
                String desc = g.description;
                if (desc.length() > 100) desc = desc.substring(0,100) + "...";
        %>
        <a class="card" href="<%=request.getContextPath()%>/index.jsp?page=goal-detail&goalId=<%=g.id%>"
           style="display:block;cursor:pointer;">
            <div style="display:flex;flex-direction:column;gap:14px;">
                <div>
                    <h3 style="margin-bottom:6px;"><%=g.title%></h3>
                    <div class="small">작성자 <%=g.author%></div>
                </div>
                <div class="muted"><%=desc%></div>

                <div class="flex gap-12 small">
                    <div>D-<%=g.daysRemaining%></div>
                    <div><%=g.participants%>명 참여</div>
                </div>

                <div>
                    <div class="flex-between small" style="margin-bottom:8px;">
                        <span style="color:var(--color-success);font-weight:700;">성공 <%=g.successRate%>%</span>
                        <span style="color:var(--color-danger);font-weight:700;">실패 <%=g.failureRate%>%</span>
                    </div>
                    <div style="position:relative;height:10px;background:#f1f5f9;border-radius:999px;overflow:hidden;">
                        <div style="position:absolute;left:0;top:0;height:100%;width:<%=g.successRate%>%;background:var(--color-success);"></div>
                        <div style="position:absolute;right:0;top:0;height:100%;width:<%=g.failureRate%>%;background:var(--color-danger);"></div>
                    </div>
                </div>
            </div>
        </a>
        <% } %>
    </div>
</div>
