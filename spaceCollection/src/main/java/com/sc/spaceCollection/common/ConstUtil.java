package com.sc.spaceCollection.common;

public interface ConstUtil {
	//게시판 페이징 처리 관련 상수
	public static final int RECORD_COUNT=20;
	int BLOCK_SIZE=10;
	
	//QNA 페이징 처리 관련 상수
	int QNA_RECORD_COUNT=5;
	//Review 페이징 처리 관련 상수
	int REVIEW_RECORD_COUNT=5;
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE="test";
	//String FILE_UPLOAD_TYPE="deploy";
	
	//자료실 파일 저장 경로
	String FILE_UPLOAD_PATH="board_files";
	String FILE_UPLOAD_PATH_TEST="\\board_files";
	
	//관리자 페이지 - 상품 등록시 상품 이미지 저장 경로
	String IMAGE_FILE_UPLOAD_PATH="board_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST="\\board_images";
	
	//사용자 프로필 이미지 - 사용자 프로필 변경시 이미지 저장 경로
	String USER_IMAGE_FILE_UPLOAD_PATH="user_images";
	String USER_IMAGE_FILE_UPLOAD_PATH_TEST="\\user_images";
	
	//공간 이미지 저장 경로
	String SPACE_IMAGE_FILE_UPLOAD_PATH="space_images";
	String SPACE_IMAGE_FILE_UPLOAD_PATH_TEST="\\space_images";
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1;  //자료실 업로드
	int UPLOAD_IMAGE_FLAG=2; //상품 등록시 이미지 업로드
	int UPLOAD_USER_IMAGE_FLAG=3; //유저 프로필 이미지 업로드
	int UPLOAD_SPACE_IMAGE_FLAG = 4;	//공간 이미지 업로드
	
	
	
}



