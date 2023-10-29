package com.sc.spaceCollection.qna.model;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class QnaVO {
	private int qnaNum;
	private String qnaContent;
	private String qnaRegdate;
	private String qnaAnswer;
	private String qnaDelflag;
	private Timestamp qnaOutdate;
	private int userNum;
	private int spaceNum;
}
