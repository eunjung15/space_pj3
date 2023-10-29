package com.sc.spaceCollection.spaceType.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.host.model.SpaceTypeVO;

@Mapper
public interface SpaceTypeDAO {
	List<Map<String, Object>> selectSpaceType(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	Map<String, Object> selectBySpaceTypeName(String spaceTypeName);
	int insertSpaceType(SpaceTypeVO vo);
	int spaceTypeActivation(SpaceTypeVO vo);
	int spaceTypeDeactivation(SpaceTypeVO vo);
	int updateSpaceType(SpaceTypeVO vo);
	int spaceTypeNameDubCheck(String spaceTypeName);
	SpaceTypeVO selectSpaceTypeBySpaceTypeNo(int spaceTypeNo);
}
