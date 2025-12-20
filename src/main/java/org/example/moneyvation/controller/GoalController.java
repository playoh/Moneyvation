package org.example.moneyvation.controller;

import org.example.moneyvation.dao.BetMapper;
import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.BetVO;
import org.example.moneyvation.vo.GoalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/goal")
public class GoalController {

    @Autowired
    private GoalMapper goalMapper;

    @Autowired
    private BetMapper betMapper;

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

    /**
     * ✅ goalDetail.jsp에 필요한 데이터:
     * - goal
     * - successBets (성공 베팅 목록)
     * - failureBets (실패 베팅 목록)  ← 이름 통일!
     */
    @GetMapping("/detail")
    public String getGoalDetail(@RequestParam("goalId") int goalId, Model model) {
        GoalVO goal = goalMapper.getGoal(goalId);

        List<BetVO> successBets = betMapper.getBetsByGoalAndType(goalId, "SUCCESS");
        List<BetVO> failureBets = betMapper.getBetsByGoalAndType(goalId, "FAIL");

        model.addAttribute("goal", goal);
        model.addAttribute("successBets", successBets);
        model.addAttribute("failureBets", failureBets); // ✅ failBets → failureBets

        model.addAttribute("page", "goalDetail");
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
        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }
        goalMapper.updateGoal(vo);
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }

    @PostMapping("/delete")
    public String deleteGoal(@RequestParam("goalId") int goalId, HttpSession session) {
        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
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

        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }

        // TODO: photo 저장 + DB 반영(추후)
        return "redirect:/goal/detail?goalId=" + goalId + "&certified=true";
    }

    /**
     * ✅ goalDetail.jsp의 Place Bet Now 폼 action="/goal/bet"
     * - betType: SUCCESS / FAIL
     * - amount: 양수
     */
    @PostMapping("/bet")
    public String placeBet(@RequestParam("goalId") int goalId,
                           @RequestParam("betType") String betType,
                           @RequestParam("amount") int amount,
                           HttpSession session) {

        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }

        if (!"SUCCESS".equals(betType) && !"FAIL".equals(betType)) {
            return "redirect:/goal/detail?goalId=" + goalId + "&betError=type";
        }
        if (amount <= 0) {
            return "redirect:/goal/detail?goalId=" + goalId + "&betError=amount";
        }

        String userId = (String) session.getAttribute("userId");

        BetVO bet = new BetVO();
        bet.setGoalId(goalId);
        bet.setUserId(userId);
        bet.setBetType(betType);
        bet.setAmount(amount);

        betMapper.insertBet(bet);

        return "redirect:/goal/detail?goalId=" + goalId + "&betSaved=true";
    }
}
