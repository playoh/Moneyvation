package org.example.moneyvation.controller;

import org.example.moneyvation.dao.BoardMapper;
import org.example.moneyvation.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardMapper boardMapper;

    @GetMapping("/list")
    public String getBoardList(Model model) {
        model.addAttribute("list", boardMapper.getBoardList());
        return "boardList";
    }

    // ... 나머지 메서드들 ...
}