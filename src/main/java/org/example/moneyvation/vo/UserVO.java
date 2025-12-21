package org.example.moneyvation.vo;

public class UserVO {
    private String userId;
    private String password;
    private String userName; // 사용자 이름 (필요하면 추가)
    private String nickname;

    // 기본 생성자
    public UserVO() {}

    // Getter & Setter (필수! 없으면 에러 납니다)
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }
}