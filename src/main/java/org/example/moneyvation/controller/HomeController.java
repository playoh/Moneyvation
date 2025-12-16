package org.example.moneyvation.controller;

import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.GoalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private GoalMapper goalMapper;

    // 1. 사용자가 메인 주소("/")로 접속하면
    @GetMapping("/")
    public String home(Model model) {
        // 1. 접속 로그
        System.out.println("============== HOME 접속 요청 ==============");

        // 2. DB 조회 시도
        List<GoalVO> list = goalMapper.getGoalList();

        // 3. 결과 확인 (콘솔창을 보세요!)
        if (list == null) {
            System.out.println("❌ [오류] 리스트가 NULL입니다. (MyBatis 설정 문제)");
        } else if (list.isEmpty()) {
            System.out.println("⚠️ [알림] 리스트가 비어있습니다. (데이터 0개 or 커밋 안됨)");
        } else {
            System.out.println("✅ [성공] 가져온 목표 개수: " + list.size() + "개");
            System.out.println("   첫 번째 목표 제목: " + list.get(0).getTitle());
        }
        System.out.println("============================================");

        model.addAttribute("goalList", list);
        model.addAttribute("page", "home");
        return "index";
    }
}