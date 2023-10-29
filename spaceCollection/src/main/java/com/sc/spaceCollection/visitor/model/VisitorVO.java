package com.sc.spaceCollection.visitor.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class VisitorVO {
	private int visitId;
	private String visitIp;
	private Timestamp visitTime;
}
