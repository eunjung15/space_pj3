package com.sc.spaceCollection.admin.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {
	String selectSaltByAdminId(String adminId);
	String selectPwdByAdminId(String adminId);
}
