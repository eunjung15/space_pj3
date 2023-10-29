package com.sc.spaceCollection.boardType.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardTypeVO {
	private String boardTypeId; 
	private String boardTypeName; 
	private String boardTypeCommentOk;  
	private String boardTypeFileOk;  
	private int boardTypeFileNum;       
	private int boardTypeFileSize; 
	private String boardTypeUse;  
	private Timestamp boardTypeRegdate;  
}
