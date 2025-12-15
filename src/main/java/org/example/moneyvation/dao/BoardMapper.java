package org.example.moneyvation.dao;

import org.example.moneyvation.vo.BoardVO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface BoardMapper {
    void insertBoard(BoardVO vo);
    void updateBoard(BoardVO vo);
    void deleteBoard(int seq);
    BoardVO getBoard(int seq);
    List<BoardVO> getBoardList();
    int getBoardCnt();
}
