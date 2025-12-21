package org.example.moneyvation.dao;

import org.apache.ibatis.annotations.Mapper;
import org.example.moneyvation.vo.UserVO;

@Mapper
public interface UserMapper {
    // 로그인
    UserVO getUser(String userId);

    // 회원가입
    void insertUser(UserVO user);

    // 아이디 중복 체크
    int countByUserId(String userId);
}
