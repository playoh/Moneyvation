package org.example.moneyvation.controller;

import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.BetVO;
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
        model.addAttribute("page", "createGoal");
        return "index";
    }

    @GetMapping("/edit-form")
    public String moveToEditForm(@RequestParam("goalId") int goalId, Model model) {
        GoalVO goal = goalMapper.getGoal(goalId);
        model.addAttribute("goal", goal);
        model.addAttribute("page", "editGoal");
        return "index";
    }

    @GetMapping("/detail")
    public String getGoalDetail(@RequestParam("goalId") int goalId, Model model) {
        GoalVO goal = goalMapper.getGoal(goalId);
        model.addAttribute("goal", goal);
        model.addAttribute("page", "goalDetail"); // ✅ 여기 핵심
        return "index";
    }

    @PostMapping("/create")
    public String createGoal(GoalVO vo, HttpSession session) {
        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }

        String userName = (String) session.getAttribute("userName");
        String userId = (String) session.getAttribute("userId");
        vo.setAuthor(userName != null ? userName : userId);

        goalMapper.insertGoal(vo);
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }

    @PostMapping("/update")
    public String updateGoal(GoalVO vo, HttpSession session) {
        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/user/login-form";
        }
        goalMapper.updateGoal(vo);
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }

    @PostMapping("/delete")
    public String deleteGoal(@RequestParam("goalId") int goalId, HttpSession session) {
        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/user/login-form";
        }
        goalMapper.deleteGoal(goalId);
        return "redirect:/";
    }

    @PostMapping("/certify")
    public String certifyGoal(@RequestParam("goalId") int goalId,
                              @RequestParam(value = "note", required = false) String note,
                              @RequestParam("photo") MultipartFile photo,
                              HttpSession session) {

        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/user/login-form";
        }

        return "redirect:/goal/detail?goalId=" + goalId + "&certified=true";
    }
    @Autowired
    private org.example.moneyvation.dao.BetMapper betMapper;

    @PostMapping("/bet")
    public String placeBet(@RequestParam int goalId,
                           @RequestParam String betType,
                           @RequestParam int amount,
                           HttpSession session) {

        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/user/login-form";
        }

        String userId = (String) session.getAttribute("userId");

        BetVO bet = new BetVO();
        bet.setGoalId(goalId);
        bet.setUserId(userId);
        bet.setBetType(betType); // SUCCESS or FAIL
        bet.setAmount(amount);

        betMapper.insertBet(bet);

        return "redirect:/goal/detail?goalId=" + goalId;
    }

}

