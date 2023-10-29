package com.sc.spaceCollection.boardType.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardTypeDAO {
	List<BoardTypeVO> selectBoardType();
	List<BoardTypeVO> selectBoardTypeUse();
	int boardTypeNameDupCheck(String boardTypeName);
	int insertBoardType(BoardTypeVO vo);
	BoardTypeVO selectByBoardTypeId(String boardTypeId);
	int updateBoardType(BoardTypeVO vo);
	BoardTypeVO selectByBoardTypeName(String boardTypeName);
}
