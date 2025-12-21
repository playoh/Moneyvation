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

    @GetMapping("/my-page")
    public String myPage(@RequestParam(value = "tab", defaultValue = "my-goals") String tab,
                         HttpSession session,
                         Model model) {

        // 1. 로그인 체크 (로그인 안 했으면 로그인 화면으로 튕기기)
        if (session.getAttribute("isLoggedIn") == null) {
            return "redirect:/user/login-form";
        }

        // 2. 목업 데이터 준비 (나중에는 DB에서 가져오는 코드로 바뀔 예정)
        // 일단 JSP에 있던 변수들을 여기서 모델에 담아줍니다.
        model.addAttribute("nickname", session.getAttribute("userName")); // 세션에 저장된 이름 사용
        model.addAttribute("goalsCreated", 3);
        model.addAttribute("betsPlaced", 12);
        model.addAttribute("winRate", 67);
        model.addAttribute("wins", 8);
        model.addAttribute("losses", 4);

        // 숫자 포맷팅을 위해 미리 문자로 만들어 보내거나, JSP에서 fmt 태그를 써도 됩니다.
        // 여기서는 편의상 숫자로 그냥 보냅니다.
        model.addAttribute("totalProfit", 15000);
        model.addAttribute("totalLoss", 6500);
        model.addAttribute("netProfit", 8500);

        // 3. 현재 선택된 탭 정보 넘기기
        model.addAttribute("activeTab", tab);

        // 4. 페이지 정보 설정 (index.jsp가 알 수 있게)
        model.addAttribute("page", "my-page");

        return "index"; // index.jsp로 이동
    }

    @GetMapping("/signup-form")
    public String showSignupForm(Model model) {
        model.addAttribute("page", "signup"); // index.jsp의 if문 조건("signup")
        return "index";
    }

    // [필수 추가] 가입하기 버튼 눌렀을 때 실행되는 메서드
    @PostMapping("/signup") // JSP의 form action="/user/signup" 과 짝꿍입니다.
    public String processSignup(UserVO vo) {
        // 1. DB에 저장
        userMapper.insertUser(vo);

        System.out.println("회원가입 성공: " + vo.getUserId());

        // 2. 가입 끝나면 로그인 화면으로 이동
        return "redirect:/user/login-form?msg=signupSuccess";
    }

}