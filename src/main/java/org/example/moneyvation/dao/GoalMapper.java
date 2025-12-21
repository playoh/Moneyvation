package org.example.moneyvation.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.moneyvation.vo.GoalVO;

import java.util.List;

@Mapper
public interface GoalMapper {
    void insertGoal(GoalVO vo);
    void updateGoal(GoalVO vo);
    void deleteGoal(int goalId);
    GoalVO getGoal(int goalId);
    void updateVerificationImage(GoalVO goal);

    // 기존
    List<GoalVO> getGoalList();

    // ✅ 추가: 홈 정렬용(한 방 SQL)
    List<GoalVO> getGoalListSorted(@Param("sort") String sort);

    // (이미 추가했다면 유지)
    List<GoalVO> getGoalsByAuthor(@Param("author") String author);
}
