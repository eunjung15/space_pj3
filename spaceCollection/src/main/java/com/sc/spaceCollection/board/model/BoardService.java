package com.sc.spaceCollection.board.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileVO;

public interface BoardService {
	List<BoardVO> selectByBoardTypeId(String boardTypeName);
	List<Map<String, Object>> selectBoardAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	int insertBoard(BoardVO vo);
	Map<String, Object> selectByBoardNum(int boardNum);
	int updateBoardDelFlag(BoardListVO listVo);
	List<Map<String, Object>> selectByeventBoard();
	Map<String, Object> selectByeventBoardNum(int boardNum);
	int updateBoard(BoardVO vo);
	List<BoardVO> selectNoticeBoard();
	List<Map<String, Object>> selectNotice(int page, int size, String boardTitle, String boardContent,String searchKeyword);
	List<BoardVO> selectFocus();

}
