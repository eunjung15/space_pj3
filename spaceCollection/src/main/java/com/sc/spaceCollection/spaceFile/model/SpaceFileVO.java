package com.sc.spaceCollection.spaceFile.model;

import lombok.Data;

@Data
public class SpaceFileVO {
	private int imgNum;
	private String imgOriginalName;
	private long imgSize;
	private String imgTempName; 
	private String imgForeignKey;
}
