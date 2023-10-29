package com.sc.spaceCollection.spaceTypeCategory.model;

import java.util.List;

import com.sc.spaceCollection.common.SearchVO;

public interface SpaceTypeCategoryService {
	int ERR = 0;
	int DUB = 1;
	int PASS = 2;
	
	List<SpaceTypeCategoryVO> selectSpaceTypeCategory(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	int insertSpaceTypeCategory(SpaceTypeCategoryVO vo);
	int spaceTypeCategoryActivation(SpaceTypeCategoryListVO listVo);
	int spaceTypeCategoryDeactivation(SpaceTypeCategoryListVO listVo);
	List<SpaceTypeCategoryVO> selectSpaceTypeCategoryAll();
}
