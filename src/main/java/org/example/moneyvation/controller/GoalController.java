package org.example.moneyvation.controller;

import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.GoalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/goal")
public class GoalController {

    @Autowired
    private GoalMapper goalMapper;

    // ==========================================
    // 1. 화면 이동 기능 (이게 빠져 있었음!)
    // ==========================================

    /**
     * [추가됨] 목표 생성 페이지 보여주기
     * 요청 주소: /goal/create-form
     */
    @GetMapping("/create-form")
    public String moveToCreateForm(Model model) {
        // index.jsp에게 "create-goal.jsp를 끼워넣어라"라고 지시
        // 아까 index.jsp에서 고친 이름("create-goal")과 똑같아야 함!
        model.addAttribute("page", "create-goal");
        return "index";
    }

    /**
     * [추가됨] 목표 수정 페이지 보여주기
     * 요청 주소: /goal/edit-form?goalId=1
     */
    @GetMapping("/edit-form")
    public String moveToEditForm(@RequestParam("goalId") int goalId, Model model) {
        // 수정하려면 원래 내용을 채워놔야 하니까 DB에서 가져옴
        GoalVO goal = goalMapper.getGoal(goalId);

        model.addAttribute("goal", goal);
        model.addAttribute("page", "edit-goal"); // index.jsp의 조건문 이름과 일치
        return "index";
    }

    // ==========================================
    // 2. 데이터 처리 기능 (원래 있던 것들)
    // ==========================================

    // 목표 저장 처리
    // GoalController.java

    @PostMapping("/create")
    public String createGoal(GoalVO vo, HttpSession session) {
        // 1. 로그인 여부 확인
        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/user/login-form";
        }

        // 2. 세션에서 로그인한 사용자 이름(또는 ID) 꺼내기
        String currentUserName = (String) session.getAttribute("userName");

        if (currentUserName == null) {
            currentUserName = (String) session.getAttribute("userId");
        }

        vo.setAuthor(currentUserName);

        // 4. DB 저장
        goalMapper.insertGoal(vo);

        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }


    // 목표 수정 처리
    @PostMapping("/update")
    public String updateGoal(GoalVO vo) {
        goalMapper.updateGoal(vo);
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }

    // 목표 삭제 처리
    @RequestMapping("/delete")
    public String deleteGoal(@RequestParam("goalId") int goalId) {
        goalMapper.deleteGoal(goalId);
        return "redirect:/";
    }

    // 목표 상세 보기
    @GetMapping("/detail")
    public String getGoalDetail(@RequestParam("goalId") int goalId, Model model) {
        GoalVO goal = goalMapper.getGoal(goalId);
        model.addAttribute("goal", goal);

        // index.jsp의 "goal-detail" 부분 실행
        model.addAttribute("page", "goal-detail");

        return "index";
    }
}