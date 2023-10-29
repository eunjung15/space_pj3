package com.sc.spaceCollection.guest.model;

import java.util.List;

import org.springframework.stereotype.Service;

import io.micrometer.observation.annotation.Observed;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GuestServiceImpl implements GuestService {
	private final GuestDAO guestDao;

	@Override
	public int guestCheckId(String userId) {
		int cnt=guestDao.guestCheckId(userId);
		int result=0;
		if(cnt>0) {
			result=GuestService.EXIST_ID;
		}else {
			result=GuestService.NONE_EXIST_ID;
		}
		return result;
	}

	@Override
	public int loginCheck(String userId, String userPwd) {
		String dbUserPwd=guestDao.selectPwd(userId);
		
		int result=0;
		if(dbUserPwd==null || dbUserPwd.isEmpty()) {
			result=GuestService.USERID_NONE;
		}else {
			if(dbUserPwd.equals(userPwd)) {
				result=GuestService.LOGIN_OK;
			}else {
				result=GuestService.PWD_DISAGREE;
			}
		}
		
		return result;
	}

	@Override
	public GuestVO selectUserInfo(String userId) {
		return guestDao.selectUserInfo(userId);
	}

	@Override
	public int insertGuest(GuestVO guestVo) {
		return guestDao.insertGuest(guestVo);
	}

	@Override
	public String selectUserSalt(String userId) {
		return guestDao.selectUserSalt(userId);
	}

	@Override
	public int selectCountEmail(String userEmail) {
		return guestDao.selectCountEmail(userEmail);
	}

	@Override
	public List<GuestVO> selectUserIdByEmail(String userEmail) {
		return guestDao.selectUserIdByEmail(userEmail);
	}

	@Override
	public int selectKakaoUser(GuestVO guestVo) {
		return guestDao.selectKakaoUser(guestVo);
	}

	@Override
	public int insertKakaoUser(GuestVO guestVo) {
		return guestDao.insertKakaoUser(guestVo);
	}

	@Override
	public int checkedUserIdBySnsCode(String userId) {
		return guestDao.checkedUserIdBySnsCode(userId);
	}

	@Override
	public int updateUserName(GuestVO guestVo) {
		return guestDao.updateUserName(guestVo);
	}

	@Override
	public int updateUserHp(GuestVO guestVo) {
		return guestDao.updateUserHp(guestVo);
	}

	@Override
	public int selectNaverUser(GuestVO guestVo) {
		return guestDao.selectNaverUser(guestVo);
	}

	@Override
	public int insertNaverUser(GuestVO guestVo) {
		return guestDao.insertNaverUser(guestVo);
	}

	@Override
	public GuestVO selectSnsUserInfo(GuestVO guestVo) {
		return guestDao.selectSnsUserInfo(guestVo);
	}

	@Override
	public int updateNaverUser(GuestVO guestVo) {
		return guestDao.updateNaverUser(guestVo);
	}

	@Override
	public int countByUserIdUserEmail(String userId, String userEmail) {
		return guestDao.countByUserIdUserEmail(userId, userEmail);
	}

	@Override
	public int updateUserProfileImage(GuestVO guestVo) {
		return guestDao.updateUserProfileImage(guestVo);
	}

	@Override
	public int updateKakaoUser(GuestVO guestVO) {
		return guestDao.updateKakaoUser(guestVO);
	}
	
	@Override
	public String selectByUserNum(int userNum) {
		return guestDao.selectByUserNum(userNum);
	}

	@Override
	public int deleteUser(String userId) {
		return guestDao.deleteUser(userId);
	}

	@Override
	public int updateAgreementSms(GuestVO guestVo) {
		return guestDao.updateAgreementSms(guestVo);
	}

	@Override
	public int updateAgreementEmail(GuestVO guestVo) {
		return guestDao.updateAgreementEmail(guestVo);
	}

	@Override
	public int updateUserPwd(GuestVO guestVo) {
		return guestDao.updateUserPwd(guestVo);
	}

}
