package com.sc.spaceCollection.comments.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentsService{
	private final CommentsDAO commentsDao;
	
	@Override
	public int insertComments(CommentsVO vo) {
		return commentsDao.insertComments(vo);
	}

	@Override
	public List<Map<String, Object>> selectByBoardNum(CommentsVO commentsVo) {
		return commentsDao.selectByBoardNum(commentsVo);
	}

	@Override
	public int countComments(int boardNum) {
		return commentsDao.countComments(boardNum);
	}

	@Override
	public int updateComments(CommentsVO vo) {
		return commentsDao.updateComments(vo);
	}
	@Override
	public int updateCommentsDelFlag(int commentNum) {
		return commentsDao.updateCommentsDelFlag(commentNum);
	}

	@Override
	public List<Map<String, Object>> selectCommentsEachUser(SearchVO vo) {
		List<Map<String, Object>> list = commentsDao.selectCommentsEachUser(vo);
		for(Map<String, Object> map : list) {
			map.put("COMMENT_REG_DATE", (map.get("COMMENT_REG_DATE")+"").substring(0, 10));
		}
		
		return list;
	}

	@Override
	public int getTotalRecordEachUser(SearchVO vo) {
		return commentsDao.getTotalRecordEachUser(vo);
	}

	@Override
	public List<CommentsVO> selectUserComments(int boardNum) {
		return commentsDao.selectUserComments(boardNum);
	}

	@Override
	public List<CommentsVO> selectPaging(int page, int size, int boardNum) {
		 int startRow = (page - 1) * size + 1;  
	     int endRow = page * size;
		return commentsDao.selectPaging(startRow, endRow, boardNum);
	}

	

}
