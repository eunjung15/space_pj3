package com.sc.spaceCollection.coupon.model;

import java.util.List;


import org.springframework.stereotype.Service;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CouponServiceImpl implements CouponService {
	private final CouponDAO couponDAO ;
	
	@Override
	public int insertCoupon(CouponVO vo) {
		return couponDAO.insertCoupon(vo);
	}

	@Override
	public int countCoupon(int userNum) {
		return couponDAO.countCoupon(userNum);
	}

	@Override
	public List<CouponVO> selectUserCoupon(int userNum) {
		return couponDAO.selectUserCoupon(userNum);
	}

	@Override
	public int selectCheckCoupon(String couponName) {
		return couponDAO.selectCheckCoupon(couponName);
	}


}
