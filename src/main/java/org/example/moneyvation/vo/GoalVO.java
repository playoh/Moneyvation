package org.example.moneyvation.vo;

import java.util.Date;

public class GoalVO {
    private int goalId;

    // ✅ 10개 항목
    private String title;
    private String description;
    private String author;

    private java.sql.Date startDate; // DB: start_date (DATE)
    private java.sql.Date endDate;   // DB: end_date (DATE)

    private Integer duration;        // (유지) DB: duration
    private String verificationType; // DB: verification_type
    private Integer minBet;          // DB: min_bet
    private String allowFailure;     // DB: allow_failure

    private String category;         // DB: category
    private String difficulty;       // DB: difficulty

    // 기타 기존 필드
    private Date createdAt;
    private String verificationImageUrl;

    // ✅ [추가됨] 인증글 내용 (DB: verification_note)
    private String verificationNote;

    private Integer avgBetAmount;

    // 통계용 필드
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

    public java.sql.Date getStartDate() { return startDate; }
    public void setStartDate(java.sql.Date startDate) { this.startDate = startDate; }

    public java.sql.Date getEndDate() { return endDate; }
    public void setEndDate(java.sql.Date endDate) { this.endDate = endDate; }

    public Integer getDuration() { return duration; }
    public void setDuration(Integer duration) { this.duration = duration; }

    public String getVerificationType() { return verificationType; }
    public void setVerificationType(String verificationType) { this.verificationType = verificationType; }

    public Integer getMinBet() { return minBet; }
    public void setMinBet(Integer minBet) { this.minBet = minBet; }

    public String getAllowFailure() { return allowFailure; }
    public void setAllowFailure(String allowFailure) { this.allowFailure = allowFailure; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public String getVerificationImageUrl() { return verificationImageUrl; }
    public void setVerificationImageUrl(String verificationImageUrl) { this.verificationImageUrl = verificationImageUrl; }

    // ✅ [추가됨] verificationNote Getter/Setter
    public String getVerificationNote() { return verificationNote; }
    public void setVerificationNote(String verificationNote) { this.verificationNote = verificationNote; }

    public Integer getAvgBetAmount() { return avgBetAmount; }
    public void setAvgBetAmount(Integer avgBetAmount) { this.avgBetAmount = avgBetAmount; }

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
}