package org.example.moneyvation.controller;

import org.example.moneyvation.dao.UserMapper;
import org.example.moneyvation.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    // 로그인 폼
    @GetMapping("/login-form")
    public String showLoginForm(Model model) {
        model.addAttribute("page", "login");
        return "index";
    }

    // 로그인 처리
    @PostMapping("/login")
    public String processLogin(@RequestParam("userId") String userId,
                               @RequestParam("password") String password,
                               HttpSession session) {

        UserVO user = userMapper.getUser(userId);

        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getUserName());
            System.out.println("로그인 성공: " + user.getUserName());
            return "redirect:/";
        } else {
            System.out.println("로그인 실패: 아이디나 비번이 틀림");
            return "redirect:/user/login-form?error=true";
        }
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("로그아웃 완료!");
        return "redirect:/";
    }

    // ✅ 회원가입 폼
    @GetMapping("/signup-form")
    public String showSignUpForm(Model model) {
        model.addAttribute("page", "signup");
        return "index";
    }

    // ✅ 회원가입 처리
    @PostMapping("/signup")
    public String processSignUp(@RequestParam("userId") String userId,
                                @RequestParam("password") String password,
                                @RequestParam("userName") String userName) {

        // 1) 중복 체크
        int count = userMapper.countByUserId(userId);
        if (count > 0) {
            return "redirect:/user/signup-form?error=duplicate";
        }

        // 2) 저장
        UserVO vo = new UserVO();
        vo.setUserId(userId);
        vo.setPassword(password);
        vo.setUserName(userName); // ✅ 닉네임

        userMapper.insertUser(vo);
        System.out.println("회원가입 완료: " + userId + " (" + userName + ")");

        // 3) 로그인 페이지로 이동
        return "redirect:/user/login-form?signup=success";
    }

    // 마이페이지 (기존 유지)
    @GetMapping("/my-page")
    public String myPage(@RequestParam(value = "tab", defaultValue = "my-goals") String tab,
                         HttpSession session,
                         Model model) {

        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/user/login-form";
        }

        model.addAttribute("nickname", session.getAttribute("userName"));
        model.addAttribute("goalsCreated", 3);
        model.addAttribute("betsPlaced", 12);
        model.addAttribute("winRate", 67);
        model.addAttribute("wins", 8);
        model.addAttribute("losses", 4);

        model.addAttribute("totalProfit", 15000);
        model.addAttribute("totalLoss", 6500);
        model.addAttribute("netProfit", 8500);

        model.addAttribute("activeTab", tab);
        model.addAttribute("page", "my-page");

        return "index";
    }
}
