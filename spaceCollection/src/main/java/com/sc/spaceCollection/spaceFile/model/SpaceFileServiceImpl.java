package com.sc.spaceCollection.spaceFile.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceFileServiceImpl implements SpaceFileService{
	private static final Logger logger = LoggerFactory.getLogger(SpaceFileServiceImpl.class);
	
	private final SpaceFileDAO spaceFileDao;

	@Override
	public int insertSpaceFile(SpaceFileVO vo) {
		return spaceFileDao.insertSpaceFile(vo);
	}

	@Override
	public List<SpaceFileVO> selectSpaceFileByBoardNum(String boardNum) {
		return spaceFileDao.selectSpaceFileByBoardNum(boardNum);
	}

	@Override
	public int deleteSpaceFileByImgeTempName(String imgTempName) {
		return spaceFileDao.deleteSpaceFileByImgeTempName(imgTempName);
	}

	@Override
	public List<String> selectSpaceImgBySpaceNum(String spaceNum) {
		return spaceFileDao.selectSpaceImgBySpaceNum(spaceNum);
	}

	@Override
	public String selectLicenceImgBySpaceNum(String spaceNum) {
		List<String> list = spaceFileDao.selectSpaceImgBySpaceNum(spaceNum);
		String str = list.get(0);
		return str;
	}
	
	@Override
	public SpaceFileVO selectSpaceFileBySpaceNum(String spaceNum) {
		
		List<SpaceFileVO> list = spaceFileDao.selectSpaceFileByBoardNum(spaceNum);
		SpaceFileVO vo = list.get(0);
		return vo;
	}
	
	
}
