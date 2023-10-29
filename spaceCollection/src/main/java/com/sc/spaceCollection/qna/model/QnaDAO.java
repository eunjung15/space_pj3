package com.sc.spaceCollection.qna.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface QnaDAO {
	int insertQna(QnaVO vo);
	List<Map<String, Object>> selectQnaBySpaceNum(@Param("spaceNum") int spaceNum, @Param("startRow") int startRow, @Param("endRow") int endRow);
	int deleteQna(int qnaNum);
	List<Map<String,Object>> selectQnaByUserId(SearchVO searchVo);
	int totalQnaByUserId(SearchVO searchVo);
	int getTotalRecordBySpaceNum(int spaceNum);
	int editQna(QnaVO qnaVo);
	int qnaAnswer(QnaVO vo);
}
