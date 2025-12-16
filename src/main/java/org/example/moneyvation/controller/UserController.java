package org.example.moneyvation.controller;

import org.example.moneyvation.dao.UserMapper; // 추가됨
import org.example.moneyvation.vo.UserVO;     // 추가됨
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    // ▼▼▼ DB 작업을 도와줄 친구 주입 ▼▼▼
    @Autowired
    private UserMapper userMapper;

    @GetMapping("/login-form")
    public String showLoginForm(Model model) {
        model.addAttribute("page", "login");
        return "index";
    }

    // ★★★ 진짜 로그인 처리 부분 ★★★
    @PostMapping("/login")
    public String processLogin(@RequestParam("userId") String userId,
                               @RequestParam("password") String password,
                               HttpSession session) {

        // 1. DB에서 아이디로 사용자 조회
        UserVO user = userMapper.getUser(userId);

        // 2. 검사 (유저가 존재하고 && 비밀번호가 맞다면)
        if (user != null && user.getPassword().equals(password)) {
            // 로그인 성공!
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getUserName());
            System.out.println("로그인 성공: " + user.getUserName());
            return "redirect:/";
        } else {
            // 로그인 실패!
            System.out.println("로그인 실패: 아이디나 비번이 틀림");
            // 다시 로그인 페이지로 보내기 (실패했다는 신호도 주면 좋음)
            return "redirect:/user/login-form?error=true";
        }
    }

    @GetMapping("/logout") // 사용자가 /user/logout 주소를 치면 이 메소드가 "액션"을 수행함
    public String logout(HttpSession session) {

        session.invalidate();

        System.out.println("로그아웃 완료!");

        return "redirect:/";
    }
}