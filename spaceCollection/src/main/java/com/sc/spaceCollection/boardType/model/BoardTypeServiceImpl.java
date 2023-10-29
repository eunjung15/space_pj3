package com.sc.spaceCollection.boardType.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardTypeServiceImpl implements BoardTypeService{
	
	private final BoardTypeDAO boardTypeDao;

	@Override
	public List<BoardTypeVO> selectBoardType() {
		return boardTypeDao.selectBoardType();
	}

	@Override
	public int createBoard(BoardTypeVO vo) {
		int result = 0;
		int dupResult = boardTypeDao.boardTypeNameDupCheck(vo.getBoardTypeName());
		if(dupResult < 1) {
			result = boardTypeDao.insertBoardType(vo);
		}else {
			result = -1;
		}
		return result;
	}

	@Override
	public BoardTypeVO selectByBoardTypeId(String boardTypeId) {
		return boardTypeDao.selectByBoardTypeId(boardTypeId);
	}

	@Override
	public int updateBoardType(BoardTypeVO vo) {
		return boardTypeDao.updateBoardType(vo);
	}

	@Override
	public BoardTypeVO selectByBoardTypeName(String boardTypeName) {
		return boardTypeDao.selectByBoardTypeName(boardTypeName);
	}

	@Override
	public List<BoardTypeVO> selectBoardTypeUse() {
		return boardTypeDao.selectBoardTypeUse();
	}
	
}
