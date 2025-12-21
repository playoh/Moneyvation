package org.example.moneyvation.dao;

import org.example.moneyvation.vo.UserVO;

public interface UserMapper {
    // 아이디로 회원 정보 가져오기
    UserVO getUser(String userId);
    void insertUser(UserVO vo);
}