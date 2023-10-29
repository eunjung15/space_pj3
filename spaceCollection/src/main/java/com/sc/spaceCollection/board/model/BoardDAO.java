package com.sc.spaceCollection.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface BoardDAO {
	List<BoardVO> selectByBoardTypeId(String boardTypeName);
	List<Map<String, Object>> selectBoardAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	int insertBoard(BoardVO vo);
	Map<String, Object> selectByBoardNum(int boardNum);
	int updateBoardDelFlag(BoardVO vo);
	List<Map<String, Object>> selectByeventBoard();
	Map<String, Object> selectByeventBoardNum(int boardNum);
	int updateBoard(BoardVO vo);
	List<BoardVO> selectNoticeBoard();
	List<Map<String, Object>> selectNotice(@Param("startRow") int startRow, @Param("endRow") int endRow,
											@Param("boardTitle") String boardTitle,
											@Param("boardContent")String boardContent,@Param("searchKeyword")String searchKeyword);
	List<BoardVO> selectFocus();
}