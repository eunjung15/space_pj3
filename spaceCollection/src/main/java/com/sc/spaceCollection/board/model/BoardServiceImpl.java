package com.sc.spaceCollection.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileDAO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private final BoardDAO boardDao;

	@Override
	public List<BoardVO> selectByBoardTypeId(String boardTypeName) {
		return boardDao.selectByBoardTypeId(boardTypeName);
	}

	@Override
	public List<Map<String, Object>> selectBoardAll(SearchVO searchVo) {
		return boardDao.selectBoardAll(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return boardDao.getTotalRecord(searchVo);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		return boardDao.insertBoard(vo);
	}

	@Override
	public Map<String, Object> selectByBoardNum(int boardNum) {
		return boardDao.selectByBoardNum(boardNum);
	}

	@Override
	public int updateBoardDelFlag(BoardListVO listVo) {
		int cnt = 0;
		
		try {
			for(BoardVO vo : listVo.getBoardItemList()) {
				if(vo.getBoardNum() != 0) {
					cnt = boardDao.updateBoardDelFlag(vo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectByeventBoard() {
		return boardDao.selectByeventBoard();
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return boardDao.updateBoard(vo);
	}

	@Override
	public Map<String, Object> selectByeventBoardNum(int boardNum) {
		return  boardDao.selectByeventBoardNum(boardNum) ;
	}

	@Override
	public List<BoardVO> selectNoticeBoard() {
        return boardDao.selectNoticeBoard();
	}

	@Override
	public List<Map<String, Object>> selectNotice(int page, int size,String boardTitle, String boardContent, String searchKeyword) {
		
		int startRow = (page - 1) * size;
		int endRow = (page * size) - 1;
		
		return boardDao.selectNotice(startRow, endRow, boardTitle,boardContent,searchKeyword);
	}

	@Override
	public List<BoardVO> selectFocus() {
		return boardDao.selectFocus();
	}

	

}
