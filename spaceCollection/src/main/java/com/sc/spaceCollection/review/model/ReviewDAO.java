package com.sc.spaceCollection.review.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.guest.model.GuestVO;

@Mapper
public interface ReviewDAO {
	int insertReview(ReviewVO vo);
	List<Map<String,Object>> selectMyReview(@Param("userId") String userId,
			@Param("startRow") int startRow,@Param("endRow") int endRow,@Param("searchKeyword") String searchKeyword);
	List<Map<String, Object>> selectReviewEachUser(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	List<Map<String, Object>> selectNewReview();
	List<Map<String, Object>> spaceDetailReview(@Param("spaceNum") int spaceNum,
												@Param("startRow") int startRow, @Param("endRow") int endRow);
	int deleteReview(int reviewNum);
	int getTotalRecordByUserId(String userId);
	Map<String, Object> getTotalRecordBySpaceNum(int spaceNum);
	
}
