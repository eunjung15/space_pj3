package com.sc.spaceCollection.coupon.model;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CouponDAO {

	int insertCoupon(CouponVO vo);
	int countCoupon(int userNum);
	List<CouponVO> selectUserCoupon(int userNum);
	int selectCheckCoupon(String couponName);
	
}
