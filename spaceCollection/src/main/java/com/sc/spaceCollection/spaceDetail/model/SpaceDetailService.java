package com.sc.spaceCollection.spaceDetail.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.space.model.SpaceVO;

public interface SpaceDetailService {
	Map<SpaceVO, List<Map<String, Object>>> selectDetailByNo(int spaceNo);
	RefundVO selectRefund(int refundNo);
	SpaceDetailVO selectJustDetailByNo(int sdNum);
	List<SpaceDetailVO> selectBySpaceNo(int spaceNo);
	int countReservationBySdNum(int sdNum);
	List<String> selectSpaceImg(String imgName);
	String selectSpaceMainImg(String imgName);
	
}
