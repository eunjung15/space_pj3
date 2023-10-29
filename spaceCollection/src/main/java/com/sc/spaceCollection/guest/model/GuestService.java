package com.sc.spaceCollection.guest.model;

import java.util.List;

public interface GuestService {
	// 아이디 중복확인 관련 상수
	int EXIST_ID = 1; // 이미 해당 아이디가 존재함
	int NONE_EXIST_ID = 2; // 아이디 존재하지 않음 => 사용가능

	// 로그인 처리 관련 상수
	int LOGIN_OK = 1; // 로그인 성공
	int PWD_DISAGREE = 2; // 비밀번호 불일치
	int USERID_NONE = 3; // 해당 아이디가 존재하지 않음

	int guestCheckId(String userId);
	int loginCheck(String userId,String userPwd);
	GuestVO selectUserInfo(String userId);
	int insertGuest(GuestVO guestVo);
	String selectUserSalt(String userId);
	int selectCountEmail(String userEmail);
	List<GuestVO> selectUserIdByEmail(String userEmail);
	int updateUserName(GuestVO guestVo);
	int updateUserHp(GuestVO guestVo);
	int countByUserIdUserEmail(String userId, String userEmail);
	int updateUserProfileImage(GuestVO guestVo);
	int deleteUser(String userId);
	int updateAgreementSms(GuestVO guestVo);
	int updateAgreementEmail(GuestVO guestVo);
	int updateUserPwd(GuestVO guestVo);

	//소셜 로그인 관련
	GuestVO selectSnsUserInfo(GuestVO guestVo);
	int checkedUserIdBySnsCode(String userId);
	//카카오
	int selectKakaoUser(GuestVO guestVo);
	int insertKakaoUser(GuestVO guestVo);
	int updateKakaoUser(GuestVO guestVO);
	//네이버
	int selectNaverUser(GuestVO guestVo);
	int insertNaverUser(GuestVO guestVo);
	int updateNaverUser(GuestVO guestVo);
	
	String selectByUserNum(int userNum);
}
