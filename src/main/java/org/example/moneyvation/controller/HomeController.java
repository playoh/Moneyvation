package org.example.moneyvation.controller;

import org.example.moneyvation.dao.BetMapper;
import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.GoalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private GoalMapper goalMapper;

    @Autowired
    private BetMapper betMapper; // ✅ 추가

    @GetMapping("/")
    public String home(Model model) {
        System.out.println("============== HOME 접속 요청 ==============");

        List<GoalVO> list = goalMapper.getGoalList();

        if (list == null) {
            System.out.println("❌ [오류] 리스트가 NULL입니다. (MyBatis 설정 문제)");
        } else if (list.isEmpty()) {
            System.out.println("⚠️ [알림] 리스트가 비어있습니다. (데이터 0개)");
        } else {
            System.out.println("✅ [성공] 가져온 목표 개수: " + list.size() + "개");
        }

        // ✅ 여기 핵심: 인원수 기반 퍼센트를 각 goal에 세팅
        if (list != null) {
            for (GoalVO g : list) {
                int goalId = g.getGoalId();

                int successCount = betMapper.countBetsByGoalAndType(goalId, "SUCCESS");
                int failCount = betMapper.countBetsByGoalAndType(goalId, "FAIL");
                int total = successCount + failCount;

                int successRate = 0;
                int failureRate = 0;

                if (total > 0) {
                    successRate = (int) Math.round(successCount * 100.0 / total);
                    failureRate = 100 - successRate;
                }

                // ✅ home.jsp가 쓰는 값 그대로 채우기
                g.setSuccessRate(successRate);
                g.setFailureRate(failureRate);

                // (선택) 참가자 수를 “베팅 인원수”로 쓰고 싶으면 아래를 사용
                // g.setTotalParticipants(total);
            }
        }

        model.addAttribute("goalList", list);
        model.addAttribute("page", "home");
        return "index";
    }
}
