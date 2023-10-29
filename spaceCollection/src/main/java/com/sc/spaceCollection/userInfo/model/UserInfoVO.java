package com.sc.spaceCollection.userInfo.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserInfoVO {
	private int userNum;
	private String userName;
	private String userHp;
	private String userId;
	private String userPwd;
	private String userEmail;
	private String userSnsCode;
	private Timestamp userRegDate;
	private String userOutType;
	private Timestamp userOutDate;
	private String zipcode;
	private String address;
	private String addressDetail;
	private String salt;
	private String userMarketingEmailOk;
	private String userMarketingSmsOk;
}
