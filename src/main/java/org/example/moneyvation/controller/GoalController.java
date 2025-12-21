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

        // ✅ 인원수 기반 계산 (한 사람당 1행 구조라 length가 곧 인원수)
        int successCount = (successBets == null) ? 0 : successBets.size();
        int failureCount = (failureBets == null) ? 0 : failureBets.size();
        int total = successCount + failureCount;

        int successRate = 0;
        int failureRate = 0;

        if (total > 0) {
            // 반올림(사람 기준)
            successRate = (int) Math.round(successCount * 100.0 / total);
            failureRate = 100 - successRate; // ✅ 합이 100 되게 보정
        }

        model.addAttribute("goal", goal);
        model.addAttribute("successBets", successBets);
        model.addAttribute("failureBets", failureBets);

        // ✅ 도넛용 값 추가
        model.addAttribute("successRateByCount", successRate);
        model.addAttribute("failureRateByCount", failureRate);
        model.addAttribute("totalBetters", total);

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

        // ============================
        // ✅ 날짜 / 기간 정합성 처리
        // ============================
        java.sql.Date start = vo.getStartDate();
        java.sql.Date end = vo.getEndDate();

        // 1️⃣ startDate 없으면 오늘로
        if (start == null) {
            start = new java.sql.Date(System.currentTimeMillis());
            vo.setStartDate(start);
        }

        // 2️⃣ endDate가 있으면 → duration 재계산
        if (end != null) {
            long diffMillis = end.getTime() - start.getTime();
            int days = (int) Math.ceil(diffMillis / (1000.0 * 60 * 60 * 24));
            vo.setDuration(Math.max(days, 1)); // 최소 1일
        }
        // 3️⃣ endDate 없고 duration만 있으면 → endDate 계산
        else if (vo.getDuration() > 0) {
            long endMillis = start.getTime() + (long) vo.getDuration() * 24 * 60 * 60 * 1000;
            vo.setEndDate(new java.sql.Date(endMillis));
        }
        // 4️⃣ 둘 다 없으면 → 기본 7일
        else {
            vo.setDuration(7);
            long endMillis = start.getTime() + 7L * 24 * 60 * 60 * 1000;
            vo.setEndDate(new java.sql.Date(endMillis));
        }

        goalMapper.insertGoal(vo);
        return "redirect:/goal/detail?goalId=" + vo.getGoalId();
    }


    @PostMapping("/update")
    public String updateGoal(GoalVO vo, HttpSession session) {
        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }

        // ============================
        // ✅ 날짜 / 기간 정합성 처리 (수정에서도 동일 적용)
        // ============================
        java.sql.Date start = vo.getStartDate();
        java.sql.Date end = vo.getEndDate();

        // startDate가 비어있으면: 기존 DB값을 유지하기 위해 조회해서 채움
        if (start == null) {
            GoalVO old = goalMapper.getGoal(vo.getGoalId());
            if (old != null && old.getStartDate() != null) {
                start = old.getStartDate();
            } else {
                start = new java.sql.Date(System.currentTimeMillis());
            }
            vo.setStartDate(start);
        }

        // endDate가 있으면 duration 재계산
        if (end != null) {
            long diffMillis = end.getTime() - start.getTime();
            int days = (int) Math.ceil(diffMillis / (1000.0 * 60 * 60 * 24));
            vo.setDuration(Math.max(days, 1));
        }
        // endDate 없고 duration이 있으면 endDate 계산
        else if (vo.getDuration() > 0) {
            long endMillis = start.getTime() + (long) vo.getDuration() * 24 * 60 * 60 * 1000;
            vo.setEndDate(new java.sql.Date(endMillis));
        }
        // 둘 다 없으면: 기존 값 유지
        else {
            GoalVO old = goalMapper.getGoal(vo.getGoalId());
            if (old != null) {
                vo.setDuration(old.getDuration() > 0 ? old.getDuration() : 7);
                vo.setEndDate(old.getEndDate());
            } else {
                vo.setDuration(7);
                long endMillis = start.getTime() + 7L * 24 * 60 * 60 * 1000;
                vo.setEndDate(new java.sql.Date(endMillis));
            }
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
