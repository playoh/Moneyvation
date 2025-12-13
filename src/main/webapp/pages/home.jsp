<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // Mock goals
    class Goal {
        int id; String title; String author; String description;
        int daysRemaining; int participants; int successRate; int failureRate;
        Goal(int id,String t,String a,String d,int day,int p,int s,int f){
            this.id=id; title=t; author=a; description=d;
            daysRemaining=day; participants=p; successRate=s; failureRate=f;
        }
    }
    java.util.List<Goal> goals = new java.util.ArrayList<>();
    goals.add(new Goal(1,"Complete Marathon Training for 3 Months","Sarah Kim","I will complete a full marathon training program over the next 3 months...",45,24,65,35));
    goals.add(new Goal(2,"Read 50 Books This Year","John Park","Challenge myself to read 50 books across various genres...",180,18,55,45));
    goals.add(new Goal(3,"Learn JavaScript and Build 5 Projects","Mike Lee","Master JavaScript fundamentals and build 5 complete web projects...",120,32,72,28));
    goals.add(new Goal(4,"Lose 10kg Through Diet and Exercise","Emily Chen","Reach my target weight through consistent healthy eating...",90,41,48,52));
    goals.add(new Goal(5,"Save $10,000 for Dream Vacation","David Kim","Set aside money each month to save up for a dream trip...",240,15,60,40));
    goals.add(new Goal(6,"Wake Up at 6 AM Every Day for 100 Days","Lisa Wang","Build a morning routine by waking up at 6 AM consistently...",67,28,42,58));
%>

<div class="container" style="padding:64px 24px;">
    <div class="center mb-48">
        <div class="small" style="letter-spacing:.12em;text-transform:uppercase;margin-bottom:10px;">Betting-style Goal Management</div>
        <h1 style="margin-bottom:16px;background:linear-gradient(90deg,var(--color-primary),var(--color-primary-hover));-webkit-background-clip:text;color:transparent;">
            Achieve Your Goals with Moneyvation
        </h1>
        <p class="muted" style="font-size:18px;max-width:720px;margin:0 auto 22px;">
            Turn your goals into exciting challenges. Let your friends bet on your success or failure,
            and prove them wrong while staying motivated!
        </p>

        <form action="<%=request.getContextPath()%>/pages/createGoalAction.jsp" method="post" style="display:inline;">
            <button class="btn btn-primary" type="submit">Create Goal</button>
        </form>
    </div>

    <div class="card mb-24">
        <div class="grid-2">
            <div>
                <div class="small" style="margin-bottom:8px;">Status</div>
                <select class="input">
                    <option>All Goals</option><option>Active</option><option>Completed</option><option>Failed</option>
                </select>
            </div>
            <div>
                <div class="small" style="margin-bottom:8px;">Sort By</div>
                <select class="input">
                    <option>Most Recent</option><option>Most Popular</option><option>Ending Soon</option><option>Highest Stakes</option>
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
                    <div class="small">by <%=g.author%></div>
                </div>
                <div class="muted"><%=desc%></div>

                <div class="flex gap-12 small">
                    <div>D-<%=g.daysRemaining%></div>
                    <div><%=g.participants%> people</div>
                </div>

                <div>
                    <div class="flex-between small" style="margin-bottom:8px;">
                        <span style="color:var(--color-success);font-weight:700;">Success <%=g.successRate%>%</span>
                        <span style="color:var(--color-danger);font-weight:700;">Failure <%=g.failureRate%>%</span>
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
