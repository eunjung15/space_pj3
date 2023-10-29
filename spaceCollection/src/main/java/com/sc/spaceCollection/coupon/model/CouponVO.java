package com.sc.spaceCollection.coupon.model;

import java.sql.Date;


import lombok.Data;

@Data
public class CouponVO {
	private int couponNum;
	private int couponType;
	private String couponName;
	private Date couponStartDay;
	private Date couponFinishDay;
	private int userNum;
	private int couponDelFlag;
	
}
