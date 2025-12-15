package org.example.moneyvation.vo;

import java.util.Date;

public class GoalVO {
    private int goalId;
    private String title;
    private String description;
    private String author;
    private int duration;
    private String verificationType;
    private int minBet;
    private String allowFailure;
    private Date createdAt;

    public int getGoalId() { return goalId; }
    public void setGoalId(int goalId) { this.goalId = goalId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }
    public String getVerificationType() { return verificationType; }
    public void setVerificationType(String verificationType) { this.verificationType = verificationType; }
    public int getMinBet() { return minBet; }
    public void setMinBet(int minBet) { this.minBet = minBet; }
    public String getAllowFailure() { return allowFailure; }
    public void setAllowFailure(String allowFailure) { this.allowFailure = allowFailure; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}
