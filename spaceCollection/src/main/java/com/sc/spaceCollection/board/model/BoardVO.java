package com.sc.spaceCollection.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO{
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private int boardViews;
	private int boardGroupNo;
	private int boardStep;
	private String boardDelFlag;
	private Timestamp boardOutDate;
	private int boardSortNo;
	private String boardTypeId;
	private int userNum;
	private Timestamp boardRegDate;
}
