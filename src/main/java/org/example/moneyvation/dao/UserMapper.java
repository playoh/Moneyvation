package org.example.moneyvation.dao;

import org.apache.ibatis.annotations.Mapper;
import org.example.moneyvation.vo.UserVO;

@Mapper
public interface UserMapper {
    UserVO getUser(String userId);
}
