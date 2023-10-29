package com.sc.spaceCollection.admin.model;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.Encryption;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	private final AdminDAO adminDao;

	@Override
	public int loginCheck(String adminId, String adminPwd) {
		String salt = adminDao.selectSaltByAdminId(adminId);
		String standardPwd = adminDao.selectPwdByAdminId(adminId);
		
		Encryption encryption = new Encryption();
		String inputPwd = encryption.getEncryption(salt, adminPwd);
		
		int loginResult = 0;
		if(standardPwd==null || standardPwd.isEmpty()) {
			loginResult = AdminService.USERID_NONE;
		}else {
			if(standardPwd.equals(inputPwd)) {
				loginResult = AdminService.LOGIN_OK;
			}else {
				loginResult = AdminService.PWD_DISAGREE;
			}
		}
		
		return loginResult;
	}

}
