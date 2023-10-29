package com.sc.spaceCollection.space.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SpaceVO {
	private int spaceNum;
	private String spaceName;
	private String spaceBusinessNum;
	private String spaceZipcode;
	private String spaceAddress;
	private String spaceAddressDetail;
	private String spaceLocation;
	private String spaceIntro;
	private String spaceInfo;
	private String spaceTag;
	private String spaceFacility;
	private String spacePhoneNum;
	private String spaceWarn;
	private double latitude;
	private double longitude;
	private String delFlag;
	private int refundNum;
	private int userNum;
	private int spaceTypeNo;
	private String spaceRequestStatus;
	private Timestamp spaceRequestDate;
	private Timestamp spaceRegDate;
	private Timestamp spaceOutDate;
	
	//확인용
	private String userId;
}
