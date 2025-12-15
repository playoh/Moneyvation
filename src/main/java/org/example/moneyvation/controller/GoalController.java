package org.example.moneyvation.controller;

import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.GoalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/goal")
public class GoalController {

    @Autowired
    private GoalMapper goalMapper;

    @PostMapping("/create")
    public String createGoal(GoalVO vo, HttpSession session) {
        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/index.jsp?page=home&msg=loginRequired";
        }
        vo.setAuthor("User"); // 임시 작성자 설정
        goalMapper.insertGoal(vo);
        return "redirect:/index.jsp?page=goal-detail&goalId=" + vo.getGoalId();
    }

    @PostMapping("/update")
    public String updateGoal(GoalVO vo) {
        goalMapper.updateGoal(vo);
        return "redirect:/index.jsp?page=goal-detail&goalId=" + vo.getGoalId();
    }

    @RequestMapping("/delete")
    public String deleteGoal(@RequestParam("goalId") int goalId) {
        goalMapper.deleteGoal(goalId);
        return "redirect:/index.jsp?page=my-page&tab=my-goals";
    }

    @GetMapping("/list")
    public String getGoalList(Model model) {
        List<GoalVO> list = goalMapper.getGoalList();
        model.addAttribute("goalList", list);
        return "pages/home";
    }
}
