package org.example.moneyvation.controller;

import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.GoalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/goal")
public class GoalController {

    @Autowired
    private GoalMapper goalMapper;

    @GetMapping("/create-form")
    public String moveToCreateForm(Model model) {
        model.addAttribute("page", "create-goal");
        return "index";
    }

    @GetMapping("/edit-form")
    public String moveToEditForm(@RequestParam("goalId") int goalId, Model model) {
        GoalVO goal = goalMapper.getGoal(goalId);
        model.addAttribute("goal", goal);
        model.addAttribute("page", "edit-goal");
        return "index";
    }

    @GetMapping("/detail")
    public String getGoalDetail(@RequestParam("goalId") int goalId, Model model) {
        GoalVO goal = goalMapper.getGoal(goalId);
        model.addAttribute("goal", goal);
        model.addAttribute("page", "goal-detail");
        return "index";
    }

    // ✅ [수정] 목표 저장 처리: author 세션에서 자동 세팅
    @PostMapping("/create")
    public String createGoal(GoalVO vo, HttpSession session) {
        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }

        // 작성자 자동 세팅 (userName이 없으면 userId라도)
        String userName = (String) session.getAttribute("userName");
        String userId = (String) session.getAttribute("userId");
        vo.setAuthor(userName != null ? userName : userId);

        goalMapper.insertGoal(vo); // useGeneratedKeys로 goalId가 vo에 들어옴
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }

    @PostMapping("/update")
    public String updateGoal(GoalVO vo, HttpSession session) {
        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }

        goalMapper.updateGoal(vo);
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }

    // ✅ delete는 GET보다 POST가 안전하지만, 지금 구조 유지하려면 GET도 가능
    @PostMapping("/delete")
    public String deleteGoal(@RequestParam("goalId") int goalId, HttpSession session) {
        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }
        goalMapper.deleteGoal(goalId);
        return "redirect:/";
    }

    // ✅ [추가] 인증 업로드 처리 (지금은 저장 로직 없이 redirect만)
    @PostMapping("/certify")
    public String certifyGoal(@RequestParam("goalId") int goalId,
                              @RequestParam(value = "note", required = false) String note,
                              @RequestParam("photo") MultipartFile photo,
                              HttpSession session) {

        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }

        // TODO: 파일 저장 + 인증 테이블 저장
        // 지금은 “처리 완료” 흐름만 유지
        return "redirect:/goal/detail?goalId=" + goalId + "&certified=true";
    }
}
