package com.sc.spaceCollection.collection.model;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class CollectionVO {
	private int scNum;
	private String scType;
	private String scContent;
	private Timestamp scStartDay;
	private Timestamp scFinishDay;
	private int spaceNum;
	private int scCode;
}
