package com.sc.spaceCollection.host.model;

import lombok.Data;

@Data
public class SpaceTypeVO {
	private int spaceTypeNo;
	private String spaceTypeName;
	private int categoryNo;
	private String explanation;
	private String spaceTypeDelFlag;
}
