package org.example.moneyvation.vo;

import java.util.Date;

public class BetVO {
    private int betId;
    private int goalId;
    private String userId;
    private String betType;   // "SUCCESS" or "FAIL"
    private int amount;
    private Date createdAt;

    // 화면용(Join으로 가져올 닉네임)
    private String userName;

    public int getBetId() { return betId; }
    public void setBetId(int betId) { this.betId = betId; }

    public int getGoalId() { return goalId; }
    public void setGoalId(int goalId) { this.goalId = goalId; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getBetType() { return betType; }
    public void setBetType(String betType) { this.betType = betType; }

    public int getAmount() { return amount; }
    public void setAmount(int amount) { this.amount = amount; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
}
