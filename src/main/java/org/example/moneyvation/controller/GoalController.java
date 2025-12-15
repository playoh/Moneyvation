package org.example.moneyvation.controller;

import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.GoalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model; // 리스트 조회 기능 뺐으니 Model도 필요 없음
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
// import java.util.List; // 리스트도 필요 없음

@Controller
@RequestMapping("/goal")
public class GoalController {

    @Autowired
    private GoalMapper goalMapper;

    // 목표 생성
    @PostMapping("/create")
    public String createGoal(GoalVO vo, HttpSession session) {
        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/index.jsp?page=home&msg=loginRequired";
        }
        vo.setAuthor("User");
        goalMapper.insertGoal(vo);
        return "redirect:/index.jsp?page=goal-detail&goalId=" + vo.getGoalId();
    }

    // 목표 수정
    @PostMapping("/update")
    public String updateGoal(GoalVO vo) {
        goalMapper.updateGoal(vo);
        return "redirect:/index.jsp?page=goal-detail&goalId=" + vo.getGoalId();
    }

    // 목표 삭제
    @RequestMapping("/delete")
    public String deleteGoal(@RequestParam("goalId") int goalId) {
        goalMapper.deleteGoal(goalId);
        return "redirect:/index.jsp?page=my-page&tab=my-goals";
    }
}
