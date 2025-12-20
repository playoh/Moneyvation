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
    private String verificationImageUrl;
    private Integer avgBetAmount;


    // 통계용 필드 (DB 테이블엔 없지만 쿼리 결과로 받아올 값들)
    private int totalParticipants;
    private int totalBetAmount;
    private int successRate;
    private int failureRate;
    private int daysRemaining;


    // Getters and Setters
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

    public int getTotalParticipants() { return totalParticipants; }
    public void setTotalParticipants(int totalParticipants) { this.totalParticipants = totalParticipants; }

    public int getTotalBetAmount() { return totalBetAmount; }
    public void setTotalBetAmount(int totalBetAmount) { this.totalBetAmount = totalBetAmount; }

    public int getSuccessRate() { return successRate; }
    public void setSuccessRate(int successRate) { this.successRate = successRate; }

    public int getFailureRate() { return failureRate; }
    public void setFailureRate(int failureRate) { this.failureRate = failureRate; }

    public int getDaysRemaining() { return daysRemaining; }
    public void setDaysRemaining(int daysRemaining) { this.daysRemaining = daysRemaining; }

    public String getVerificationImageUrl() { return verificationImageUrl; }
    public void setVerificationImageUrl(String verificationImageUrl) { this.verificationImageUrl = verificationImageUrl; }

    public Integer getAvgBetAmount() { return avgBetAmount; }
    public void setAvgBetAmount(Integer avgBetAmount) { this.avgBetAmount = avgBetAmount; }

}
