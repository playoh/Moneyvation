package org.example.moneyvation.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.moneyvation.vo.BetVO;

import java.util.List;

@Mapper
public interface BetMapper {

    // 베팅 저장
    void insertBet(BetVO bet);

    // 목표 + 성공/실패별 베팅 목록
    List<BetVO> getBetsByGoalAndType(@Param("goalId") int goalId,
                                     @Param("betType") String betType);

    // ✅ 홈/디테일 퍼센트 계산용 (인원수)
    int countBetsByGoalAndType(@Param("goalId") int goalId,
                               @Param("betType") String betType);
}
