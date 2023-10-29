package com.sc.spaceCollection.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utility {
	public static String getFileInfo(String originalFileName,long fileSize) {
		String result="";
		double size=fileSize/1000.0; //3.15789
		size=Math.round(size*100)/100.0;
		result=originalFileName+"( "+size+" KB)";

		return result;
	}
	
	
	public static String getDateTimeStamp() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddmmHHssSSS");
		String result = sdf.format(new Date());
		return result;
	}
}
