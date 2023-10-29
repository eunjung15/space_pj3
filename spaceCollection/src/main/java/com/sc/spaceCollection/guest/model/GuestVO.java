package com.sc.spaceCollection.guest.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GuestVO {
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
	private String userMarketingSmsOk;
	private String userMarketingEmailOk;
	private String userProfileImage;
}
