package com.sc.spaceCollection.qna.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.SearchVO;

public interface QnaService {
	int insertQna(QnaVO vo);
	List<Map<String, Object>> selectQnaBySpaceNum(int spaceNum,int page);
	int deleteQna(int qnaNum);
	List<Map<String,Object>> selectQnaByUserId(SearchVO searchVo);
	int totalQnaByUserId(SearchVO searchVo);
	int deleteMultiQna(List<Integer> qnaNum);
	int getTotalRecordBySpaceNum(int spaceNum);
	int editQna(QnaVO qnaVo);
	int qnaAnswer(QnaVO vo);
}
