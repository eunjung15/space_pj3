package com.sc.spaceCollection.guest.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface GuestDAO {
	int guestCheckId(String userId);
	String selectPwd(String userId);
	GuestVO selectUserInfo(String userId);
	int insertGuest(GuestVO guestVo);
	int selectCountEmail(String userEmail);
	String selectUserSalt(String userId);
	List<GuestVO> selectUserIdByEmail(String userEmail);
	int updateUserName(GuestVO guestVo);
	int updateUserHp(GuestVO guestVo);
	int countByUserIdUserEmail(@Param("userId") String userId, @Param("userEmail")String userEmail);
	int updateUserProfileImage(GuestVO guestVo);
	int deleteUser(String userId);
	int updateAgreementSms(GuestVO guestVo);
	int updateAgreementEmail(GuestVO guestVo);
	int updateUserPwd(GuestVO guestVo);
	//소셜 서비스 관련
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
