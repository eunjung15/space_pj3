package com.sc.spaceCollection.spaceType.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.host.model.SpaceTypeVO;

public interface SpaceTypeService {
	int ERR = 0;
	int DUB = 1;
	int PASS = 2;
	
	List<Map<String, Object>> selectSpaceType(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	Map<String, Object> selectBySpaceTypeName(String spaceTypeName);
	int insertSpaceType(SpaceTypeVO vo);
	int spaceTypeActivation(SpaceTypeListVO listVo);
	int spaceTypeDeactivation(SpaceTypeListVO listVo);
	int updateSpaceType(SpaceTypeVO vo);
	SpaceTypeVO selectSpaceTypeBySpaceTypeNo(int spaceTypeNo);
	
}
