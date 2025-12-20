package org.example.moneyvation.controller;

import org.example.moneyvation.dao.GoalMapper;
import org.example.moneyvation.dao.UserMapper;
import org.example.moneyvation.vo.GoalVO;
import org.example.moneyvation.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    // ✅ 추가
    @Autowired
    private GoalMapper goalMapper;

    @GetMapping("/login-form")
    public String showLoginForm(Model model) {
        model.addAttribute("page", "login");
        return "index";
    }

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

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("로그아웃 완료!");
        return "redirect:/";
    }

    @GetMapping("/signup-form")
    public String showSignUpForm(Model model) {
        model.addAttribute("page", "signup");
        return "index";
    }

    @PostMapping("/signup")
    public String processSignUp(@RequestParam("userId") String userId,
                                @RequestParam("password") String password,
                                @RequestParam("userName") String userName) {

        int count = userMapper.countByUserId(userId);
        if (count > 0) {
            return "redirect:/user/signup-form?error=duplicate";
        }

        UserVO vo = new UserVO();
        vo.setUserId(userId);
        vo.setPassword(password);
        vo.setUserName(userName);

        userMapper.insertUser(vo);
        System.out.println("회원가입 완료: " + userId + " (" + userName + ")");

        return "redirect:/user/login-form?signup=success";
    }

    // ✅ 마이페이지: "내가 만든 목표" DB에서 조회해서 myGoals로 내려줌
    @GetMapping("/myPage")
    public String myPage(@RequestParam(value = "tab", defaultValue = "my-goals") String tab,
                         HttpSession session,
                         Model model) {

        Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (loggedIn == null || !loggedIn) {
            return "redirect:/user/login-form";
        }

        String userName = (String) session.getAttribute("userName");
        String userId = (String) session.getAttribute("userId");

        // author 저장 로직이 "닉네임 우선"이므로 userName 기준으로 조회
        String authorKey = (userName != null && !userName.trim().isEmpty()) ? userName : userId;

        List<GoalVO> myGoals = goalMapper.getGoalsByAuthor(authorKey);

        model.addAttribute("nickname", userName);
        model.addAttribute("myGoals", myGoals); // ✅ JSP가 보는 이름 그대로!

        // (통계는 일단 기존 더미 유지)
        model.addAttribute("goalsCreated", myGoals == null ? 0 : myGoals.size());
        model.addAttribute("betsPlaced", 12);
        model.addAttribute("winRate", 67);
        model.addAttribute("wins", 8);
        model.addAttribute("losses", 4);

        model.addAttribute("totalProfit", 15000);
        model.addAttribute("totalLoss", 6500);
        model.addAttribute("netProfit", 8500);

        model.addAttribute("activeTab", tab);
        model.addAttribute("page", "myPage");

        return "index";
    }
}
