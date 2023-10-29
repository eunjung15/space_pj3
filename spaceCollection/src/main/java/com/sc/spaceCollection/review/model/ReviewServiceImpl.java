package com.sc.spaceCollection.review.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	private final ReviewDAO reviewDao;
	
	@Override
	public int insertReview(ReviewVO vo) {
		return reviewDao.insertReview(vo);
	}

	@Override
	public List<Map<String, Object>> selectMyReview(String userId, int size, int page, String searchKeyword) {
		int startRow = 1;
		int endRow = page * size;
		return reviewDao.selectMyReview(userId, startRow, endRow,searchKeyword);
	}

	@Override
	public List<Map<String, Object>> selectReviewEachUser(SearchVO vo) {
		List<Map<String, Object>> reviewList = reviewDao.selectReviewEachUser(vo);
		for(Map<String, Object> map : reviewList) {
			map.put("REVIEW_REG_DATE", (map.get("REVIEW_REG_DATE")+"").substring(0, 10));
			map.put("RESERVER_PAY_DAY", (map.get("RESERVER_PAY_DAY")+"").substring(0, 10));
		}
		
		return reviewList;
	}

	@Override
	public int getTotalRecord(SearchVO vo) {
		return reviewDao.getTotalRecord(vo);
	}
	@Override
	public List<Map<String, Object>> selectNewReview() {
		return reviewDao.selectNewReview();
	}

	@Override
	public List<Map<String, Object>> spaceDetailReview(int spaceNum,int page) {
		
		int startRow = (page - 1) * 5 + 1; 
		int endRow = page * 5;
		return reviewDao.spaceDetailReview(spaceNum,startRow, endRow);
	}

	@Override
	public int deleteReview(int reviewNum) {
		return reviewDao.deleteReview(reviewNum);
	}

	@Override
	public int getTotalRecordByUserId(String userId) {
		return reviewDao.getTotalRecordByUserId(userId);
	}

	@Override
	public Map<String,Object> getTotalRecordBySpaceNum(int spaceNum) {
		return reviewDao.getTotalRecordBySpaceNum(spaceNum);
	}

}
