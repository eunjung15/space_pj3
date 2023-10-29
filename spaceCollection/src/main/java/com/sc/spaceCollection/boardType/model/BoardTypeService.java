package com.sc.spaceCollection.boardType.model;

import java.util.List;

public interface BoardTypeService {
	
	List<BoardTypeVO> selectBoardType();
	List<BoardTypeVO> selectBoardTypeUse();
	int createBoard(BoardTypeVO vo);
	BoardTypeVO selectByBoardTypeId(String boardTypeId);
	int updateBoardType(BoardTypeVO vo);
	BoardTypeVO selectByBoardTypeName(String boardTypeName);
}
