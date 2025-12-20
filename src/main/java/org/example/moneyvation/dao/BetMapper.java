package org.example.moneyvation.dao;

import org.apache.ibatis.annotations.Mapper;
import org.example.moneyvation.vo.BetVO;

import java.util.List;

@Mapper
public interface BetMapper {
    void insertBet(BetVO bet);
    List<BetVO> getBetsByGoalAndType(int goalId, String betType);
}
