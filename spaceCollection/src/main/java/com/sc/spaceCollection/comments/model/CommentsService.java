package com.sc.spaceCollection.comments.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.SearchVO;

public interface CommentsService {

   int insertComments(CommentsVO vo);
   int countComments(int boardNum); 
   List<Map<String, Object>> selectByBoardNum(CommentsVO commentsVo);
   int updateComments(CommentsVO vo);
   int updateCommentsDelFlag(int commentNum);
   List<Map<String, Object>> selectCommentsEachUser(SearchVO vo);
   int getTotalRecordEachUser(SearchVO vo);
   List<CommentsVO> selectUserComments(int boardNum);
   List<CommentsVO> selectPaging(int page, int size, int boardNum);
}
