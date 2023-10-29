package com.sc.spaceCollection.comments.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface CommentsDAO {
   int insertComments(CommentsVO vo);
   int countComments(int boardNum); 
   List<Map<String, Object>> selectByBoardNum(CommentsVO commentsVo);
   int updateComments(CommentsVO vo);
   int updateCommentsDelFlag(int commentNum);
   List<Map<String, Object>> selectCommentsEachUser(SearchVO vo);
   int getTotalRecordEachUser(SearchVO vo);
   List<CommentsVO> selectUserComments(int boardNum);
   List<CommentsVO> selectPaging(@Param("startRow") int startRow, 
		   						@Param("endRow")int endRow, 
		   						@Param("boardNum") int boardNum);
}
