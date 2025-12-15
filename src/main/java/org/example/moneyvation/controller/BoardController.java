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

    // 1. 게시글 목록 조회 (R)
    @GetMapping("/list")
    public String getBoardList(Model model) {
        model.addAttribute("list", boardMapper.getBoardList());
        // 전체 게시글 수도 함께 보냄
        model.addAttribute("count", boardMapper.getBoardCnt());
        return "boardList"; // /WEB-INF/views/boardList.jsp
    }

    // 2. 게시글 상세 조회 (R)
    @GetMapping("/detail")
    public String getBoardDetail(@RequestParam("seq") int seq, Model model) {
        BoardVO board = boardMapper.getBoard(seq);
        model.addAttribute("board", board);
        return "boardDetail"; // /WEB-INF/views/boardDetail.jsp
    }

    // 3. 글쓰기 폼 페이지 이동 (C - Form)
    @GetMapping("/write")
    public String writeForm() {
        return "boardWrite"; // /WEB-INF/views/boardWrite.jsp
    }

    // 4. 글쓰기 처리 (C - Action)
    @PostMapping("/write")
    public String insertBoard(BoardVO vo) {
        // 실제로는 세션에서 작성자 정보를 가져와야 함
        // vo.setWriter(session.getAttribute("userName"));
        boardMapper.insertBoard(vo);
        return "redirect:/board/list"; // 처리 후 목록으로 이동
    }

    // 5. 글 수정 폼 페이지 이동 (U - Form)
    @GetMapping("/edit")
    public String editForm(@RequestParam("seq") int seq, Model model) {
        BoardVO board = boardMapper.getBoard(seq);
        model.addAttribute("board", board);
        return "boardEdit"; // /WEB-INF/views/boardEdit.jsp
    }

    // 6. 글 수정 처리 (U - Action)
    @PostMapping("/edit")
    public String updateBoard(BoardVO vo) {
        boardMapper.updateBoard(vo);
        // 수정 후 해당 글의 상세 페이지로 이동
        return "redirect:/board/detail?seq=" + vo.getSeq();
    }

    // 7. 글 삭제 처리 (D)
    @RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteBoard(@RequestParam("seq") int seq) {
        boardMapper.deleteBoard(seq);
        return "redirect:/board/list"; // 삭제 후 목록으로 이동
    }
}
