package com.sc.spaceCollection.zzim.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ZzimService {
	int selectZzimBySpaceNum(int spaceNum, int userNum);
	int selectZzim(int spaceNum, int userNum);
	List<Map<String,Object>> showZzimList(int page,int size,int userNum);
}
