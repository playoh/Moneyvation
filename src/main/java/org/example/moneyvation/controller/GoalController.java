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

    // 목표 생성
    // 목표 생성
    @PostMapping("/create")
    public String createGoal(GoalVO vo, HttpSession session) {
        // ... (로그인 체크 로직) ...
        goalMapper.insertGoal(vo);

        // 🚨 수정: JSP가 아니라 Controller의 /detail 경로로 보냅니다!
        // 이렇게 해야 getGoalDetail() 메서드가 실행되고 -> DB 조회하고 -> 화면 띄웁니다.
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }

    // 목표 수정
    @PostMapping("/update")
    public String updateGoal(GoalVO vo) {
        goalMapper.updateGoal(vo);
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }

    // 목표 삭제
    @RequestMapping("/delete")
    public String deleteGoal(@RequestParam("goalId") int goalId) {
        goalMapper.deleteGoal(goalId);
        return "redirect:/";
        // 만약 마이페이지 Controller가 있다면 "redirect:/mypage"
    }

    @GetMapping("/detail")
    public String getGoalDetail(@RequestParam("goalId") int goalId, Model model) {
        // 1. DB에서 목표 상세 정보 가져오기
        GoalVO goal = goalMapper.getGoal(goalId);

        // 2. 모델에 담기
        model.addAttribute("goal", goal);

        // 3. 페이지 껍데기 설정 (index.jsp가 'goal-detail'을 include 하도록)
        model.addAttribute("page", "goal-detail");

        // 4. index.jsp 리턴
        return "index";
    }
}