package org.example.moneyvation.controller;

import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.vo.GoalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private GoalMapper goalMapper;

    @GetMapping("/")
    public String home(@RequestParam(value = "sort", required = false, defaultValue = "recent") String sort,
                       Model model) {

        // ✅ 허용 값만 받기 (안전)
        if (!("recent".equals(sort) || "popular".equals(sort) || "ending".equals(sort) || "highest".equals(sort))) {
            sort = "recent";
        }

        List<GoalVO> list = goalMapper.getGoalListSorted(sort);

        model.addAttribute("goalList", list);
        model.addAttribute("page", "home");
        model.addAttribute("sort", sort); // (선택) JSP에서 param 대신 쓰고 싶으면 사용
        return "index";
    }
}
