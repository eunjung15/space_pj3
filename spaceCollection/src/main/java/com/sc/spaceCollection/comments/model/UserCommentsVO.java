package com.sc.spaceCollection.comments.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserCommentsVO {
		private int commentNum;
		private String commentContent;
		private Timestamp commentRegDate;
		private String commentDelFlag;
		private Timestamp commentOutdate;
		private int boardNum;
		private int userNum;
		private int userId;
}
