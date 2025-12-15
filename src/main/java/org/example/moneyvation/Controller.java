@Controller
@RequestMapping("/goal") // 공통 URL 프리픽스
public class GoalController {

    @Autowired
    private GoalService goalService; // 서비스 주입

    // 1. 목록 조회 (Read)
    @GetMapping("/list")
    public String list(Model model) {
        List<GoalVO> list = goalService.getGoalList();
        model.addAttribute("list", list); // JSP로 데이터 전달
        return "pages/home"; // home.jsp로 이동
    }

    // 2. 작성 페이지 이동 (Create Form)
    @GetMapping("/create")
    public String createForm() {
        return "pages/createGoal";
    }

    // 3. 작성 처리 (Create Action)
    @PostMapping("/createAction")
    public String createAction(GoalVO goal) {
        goalService.insertGoal(goal);
        return "redirect:/goal/list"; // 목록으로 리다이렉트
    }

    // 4. 상세 조회 (Read Detail)
    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id, Model model) {
        GoalVO goal = goalService.getGoal(id);
        model.addAttribute("goal", goal);
        return "pages/goalDetail";
    }

    // ... 수정(Update), 삭제(Delete)도 비슷한 패턴으로 작성
}
