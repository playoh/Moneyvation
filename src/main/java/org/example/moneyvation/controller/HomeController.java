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

    // 홈 화면에도 목표 리스트가 필요하다면 Mapper 주입 (필요 없으면 삭제 가능)
    @Autowired
    private GoalMapper goalMapper;

    // 1. 루트 경로 ("/") 접속 시 처리
    @GetMapping("/")
    public String home(Model model) {
        // 홈 화면에 데이터를 뿌려줘야 한다면 여기서 DB 조회
        List<GoalVO> list = goalMapper.getGoalList();
        model.addAttribute("goalList", list);

        // 2. 리턴 경로 설정
        // viewResolver 설정에 따라 다르지만, 보통 'pages/home' 또는 'home' 입니다.
        // index.jsp 껍데기를 씌워서 보여줘야 한다면 리다이렉트를 써야 할 수도 있습니다.

        // CASE A: index.jsp가 메인 프레임 역할을 하는 경우 (추천)
        // return "redirect:/index.jsp?page=home";

        // CASE B: pages/home.jsp를 직접 보여주는 경우 (ViewResolver 사용 시)
        return "pages/home";
    }
}
