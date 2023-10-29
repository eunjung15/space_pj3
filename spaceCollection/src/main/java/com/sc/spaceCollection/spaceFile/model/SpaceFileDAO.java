package com.sc.spaceCollection.spaceFile.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpaceFileDAO {
	int insertSpaceFile(SpaceFileVO vo);
	List<SpaceFileVO> selectSpaceFileByBoardNum(String boardNum);
	int deleteSpaceFileByImgeTempName(String imgTempName);
	List<String> selectSpaceImgBySpaceNum(String spaceNum);
}
