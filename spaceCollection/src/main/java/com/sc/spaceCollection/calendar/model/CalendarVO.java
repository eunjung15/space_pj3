package com.sc.spaceCollection.calendar.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CalendarVO {
	 	private int memoNum;
	 	private String memoTitle;
	    private String memoContent;
	    private String memoStartDay;
	    private String memoEndDay;
	    private String memoColor;
	    private int userNum;
}
