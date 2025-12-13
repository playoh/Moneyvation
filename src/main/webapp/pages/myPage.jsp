<% if ("my-goals".equals(activeTab)) { %>
<div class="flex-between mb-16">
    <h2>My Goals</h2>
    <a class="btn btn-primary" href="<%=request.getContextPath()%>/index.jsp?page=create-goal">
        Create Goal
    </a>
</div>

<%
    // ✅ 목업 데이터(나중에 DB로 교체)
    class MyGoal {
        int id; String title; String status; Integer daysRemaining; int participants;
        MyGoal(int id, String t, String s, Integer d, int p){
            this.id=id; title=t; status=s; daysRemaining=d; participants=p;
        }
    }
    java.util.List<MyGoal> myGoals = new java.util.ArrayList<>();
    myGoals.add(new MyGoal(1,"Complete Marathon Training for 3 Months","active",45,24));
    myGoals.add(new MyGoal(2,"Read 30 Books This Year","completed",null,15));
    myGoals.add(new MyGoal(3,"Learn Python Programming","failed",null,8));

    String badgeClass = "badge badge-primary";
    String badgeText = "In Progress";
%>

<div style="display:flex;flex-direction:column;gap:12px;">
    <% for (MyGoal g : myGoals) {
        if ("active".equals(g.status)) { badgeClass="badge badge-primary"; badgeText="In Progress"; }
        else if ("completed".equals(g.status)) { badgeClass="badge badge-success"; badgeText="Success"; }
        else if ("failed".equals(g.status)) { badgeClass="badge badge-danger"; badgeText="Failed"; }
    %>
    <div class="card">
        <div class="flex-between" style="gap:12px;">
            <div style="display:flex;align-items:center;gap:12px;flex:1;">
                <span class="<%=badgeClass%>"><%=badgeText%></span>

                <div style="flex:1;">
                    <h4 style="margin-bottom:6px;">
                        <a href="<%=request.getContextPath()%>/index.jsp?page=goal-detail&goalId=<%=g.id%>">
                            <%=g.title%>
                        </a>
                    </h4>
                    <div class="small">
                        <% if ("active".equals(g.status)) { %>
                        D-<%=g.daysRemaining%> ·
                        <% } %>
                        <%=g.participants%> participants
                    </div>
                </div>
            </div>

            <!-- ✅ 버튼 3종: 인증/수정/삭제 -->
            <div class="flex gap-8" style="align-items:center;">
                <% if ("active".equals(g.status)) { %>
                <a class="btn btn-outline"
                   href="<%=request.getContextPath()%>/index.jsp?page=goal-certify&goalId=<%=g.id%>">
                    인증(사진)
                </a>

                <a class="btn btn-ghost"
                   href="<%=request.getContextPath()%>/index.jsp?page=goal-edit&goalId=<%=g.id%>">
                    수정
                </a>
                <% } else { %>
                <!-- 완료/실패도 수정 허용할거면 여기서 수정 링크 열어도 됨 -->
                <a class="btn btn-ghost"
                   href="<%=request.getContextPath()%>/index.jsp?page=goal-edit&goalId=<%=g.id%>">
                    수정
                </a>
                <% } %>

                <form action="<%=request.getContextPath()%>/pages/deleteGoalAction.jsp"
                      method="post"
                      onsubmit="return confirm('정말 삭제할까요?');">
                    <input type="hidden" name="goalId" value="<%=g.id%>"/>
                    <button class="btn btn-ghost" type="submit" style="color:var(--color-danger);">
                        삭제
                    </button>
                </form>
            </div>
        </div>
    </div>
    <% } %>
</div>

<% } %>
