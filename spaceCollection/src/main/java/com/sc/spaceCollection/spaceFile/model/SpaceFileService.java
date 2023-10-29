package com.sc.spaceCollection.spaceFile.model;

import java.util.List;

public interface SpaceFileService {
	int insertSpaceFile(SpaceFileVO vo);
	List<SpaceFileVO> selectSpaceFileByBoardNum(String boardNum);
	int deleteSpaceFileByImgeTempName(String imgTempName);
	List<String> selectSpaceImgBySpaceNum(String spaceNum);
	String selectLicenceImgBySpaceNum(String spaceNum);
	SpaceFileVO selectSpaceFileBySpaceNum(String spaceNum);
}
