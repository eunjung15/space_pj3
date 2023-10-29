package com.sc.spaceCollection.review.model;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class ReviewVO {
	
	private int reviewNum;
	private int reviewRate;
	private String reviewContent;
	private String reviewDelFlag;
	private Timestamp reviewRegdate;
	private Timestamp reviewOutdate;
	private int userNum;
	private int reservationNum;
}
