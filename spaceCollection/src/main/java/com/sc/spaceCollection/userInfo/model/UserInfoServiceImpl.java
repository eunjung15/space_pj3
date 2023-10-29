package com.sc.spaceCollection.userInfo.model;

import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl implements UserInfoService{
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(UserInfoServiceImpl.class);
	
	private final UserInfoDAO userInfoDao;

	@Override
	public List<UserInfoVO> selectMember(SearchVO vo) {
		return userInfoDao.selectMember(vo);
	}

	@Override
	public int getTotalRecord(SearchVO vo) {
		return userInfoDao.getTotalRecord(vo);
	}


	@Override
	public int memberWithdrawal(String userId) {
		return userInfoDao.memberWithdrawal(userId);
	}

	@Override
	public Map<String, Object> selectByUserId(String userId) {
		Map<String, Object> map = userInfoDao.selectByUserId(userId);
		if(map.get("USER_REG_DATE") != null && map.get("USER_REG_DATE") != "") {
			map.put("USER_REG_DATE", (map.get("USER_REG_DATE")+"").substring(0, 10));
		}
		
		if(map.get("USER_OUT_DATE") != null && map.get("USER_OUT_DATE") != "") {
			map.put("USER_OUT_DATE", (map.get("USER_OUT_DATE")+"").substring(0, 10));
		}
		
		return map;
	}

	@Override
	public List<UserInfoVO> selectWithdrawalMember(SearchVO vo) {
		return userInfoDao.selectWithdrawalMember(vo);
	}

	@Override
	public int getWithdrawalTotalRecord(SearchVO vo) {
		return userInfoDao.getWithdrawalTotalRecord(vo);
	}

	@Override
	public int memberReturn(String userId) {
		return userInfoDao.memberReturn(userId);
	}

	@Override
	public List<UserInfoVO> selectUserInfoForExcel() {
		return userInfoDao.selectUserInfoForExcel();
	}
}
