package org.example.moneyvation.dao;

import org.example.moneyvation.vo.GoalVO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface GoalMapper {
    void insertGoal(GoalVO vo);
    void updateGoal(GoalVO vo);
    void deleteGoal(int goalId);
    GoalVO getGoal(int goalId);
    List<GoalVO> getGoalList();
}
