package com.sc.spaceCollection.email;

import lombok.Data;

@Data
public class EmailVO {
	private int spaceNum;
	private String userEmail;
	private String reason;
	private String spaceTypeName;
	private String spaceName;
	private String spaceRequestDate;
	private String spaceRequestStatus;
	private String spaceRegDate;
	
}
