package com.sc.spaceCollection.reservation.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationVO {
	private int reservationNum;
	private String userId;
	private int sdNum;
	private String reserveStartDay;
	private String reserveStartHour;
	private String reserveFinishDay;
	private String reserveFinishHour;
	private int reservePrice;
	private Timestamp reserverPayDay;
	private int reservePeople; 
	private int paymentNum;
	private String reservationUid;
}
