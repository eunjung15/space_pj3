package com.sc.spaceCollection.coupon.model;

import java.util.List;


public interface CouponService {
	int EXIST_NAME =1;  //이미 등록된 쿠폰
	int NONE_EXIST_NAME=0;
	
	int insertCoupon(CouponVO vo);
	int countCoupon(int userNum);
	List<CouponVO> selectUserCoupon(int userNum);
	int selectCheckCoupon(String couponName);
	
}
