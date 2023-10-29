package com.sc.spaceCollection.spaceTypeCategory.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface SpaceTypeCategoryDAO {
	List<SpaceTypeCategoryVO> selectSpaceTypeCategory(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	int insertSpaceTypeCategory(SpaceTypeCategoryVO vo);
	int spaceTypeCategoryNameDupCheck(SpaceTypeCategoryVO vo);
	int spaceTypeCategoryActivation(SpaceTypeCategoryVO vo);
	int spaceTypeCategoryDeactivation(SpaceTypeCategoryVO vo);
	List<SpaceTypeCategoryVO> selectSpaceTypeCategoryAll();
}
