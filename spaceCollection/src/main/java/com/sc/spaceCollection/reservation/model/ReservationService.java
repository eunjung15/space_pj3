package com.sc.spaceCollection.reservation.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.SearchVO;

public interface ReservationService {
	int insertReservation(ReservationVO vo);
	Object selectReservationByDayAndNum(int sdNum, String reserveStartDay);
	Map<String, Object> showReservation(int reservationNum, String userId);
	List<Map<String,Object>> reservationList(String userId, int page);
	public void refundPayment(String tid, int cancelAmount,int cancelTaxFreeAmount);
	int canceledReservation(String reservationUid);
	Map<String,Object> reservationReview(int reservationNum);
	boolean isReviewd(int reservationNum, String userId);
	List<Map<String, Object>> selectReservationAll(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	int countReservationList(String userId);
	int getReservationCntByInterverStandard(String intervalStandard);
	int getReservationCntByInterverStandard2(String intervalStandard);
	int getReservationMoneyByInterverStandard(String intervalStandard);
	int getReservationMoneyByInterverStandard2(String intervalStandard);
	Map<String, Object> getReservationTypeByInterverStandard(String intervalStandard);
	List<Map<String, Object>> getRecentReservationList();
	Map<String, Object> getReservationRank(Map<String, Object> map);
}
