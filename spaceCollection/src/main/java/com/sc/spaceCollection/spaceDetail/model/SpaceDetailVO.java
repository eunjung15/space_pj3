package com.sc.spaceCollection.spaceDetail.model;

import com.sc.spaceCollection.space.model.SpaceVO;

import lombok.Data;

@Data
public class SpaceDetailVO extends SpaceVO{
	private int sdNum;	
	private String sdType;
	private int sdPrice;
	private int sdMinPeople;
	private int sdMaxPeople;
	private String sdArea;
	private int spaceNum;
	private int facilityNum;
	private String sdMinTime;
	private int sdCloseTime;
	private int sdOpenTime;
}
