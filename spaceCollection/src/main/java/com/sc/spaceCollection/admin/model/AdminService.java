package com.sc.spaceCollection.admin.model;

public interface AdminService {
	
	int LOGIN_OK=1; //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int USERID_NONE=3; //아이디 없음
	
	int loginCheck(String adminId, String adminPwd);
}
