package com.sc.spaceCollection.zzim.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ZzimServiceImpl implements ZzimService{
	private final ZzimDAO zzimDao;
	private static final Logger logger = LoggerFactory.getLogger(ZzimServiceImpl.class);
	
	public static final int NOT_LOGIN = 0;
	public static final int ZZIM_EXIST = 1;
	public static final int ZZIM_NONE_EXIST = 2;
	
	public static final int ZZIM_OK = 4;
	public static final int ZZIM_DELETE = 5;
	
	
	@Override
	public int selectZzimBySpaceNum(int spaceNum, int userNum) {
		ZzimVO vo = zzimDao.selectZzimBySpaceNum(spaceNum, userNum);
		int result = 0;

		if(vo == null) {
			vo = new ZzimVO();
			vo.setSpaceNum(spaceNum);
			vo.setUserNum(userNum);
			
			result = zzimDao.insertZzim(vo);

			if(result > 0) {
				result = ZzimServiceImpl.ZZIM_OK;
			}
		}else if(vo != null) {
			result = zzimDao.deleteZzim(vo);
			if(result > 0) {
				result = ZzimServiceImpl.ZZIM_DELETE;
			}
		}
		return result;
	}


	@Override
	public int selectZzim(int spaceNum, int userNum) {
		ZzimVO vo = zzimDao.selectZzimBySpaceNum(spaceNum, userNum);
		
		int result = 0;
		if(vo == null) {
			 result = ZZIM_NONE_EXIST;
		}else if(vo != null) {
			result = ZZIM_EXIST;
		}
		return result;
	}

	@Override
	public List<Map<String,Object>> showZzimList(int page, int size, int userNum) {
		
		int startRow = (page - 1) * size + 1;  
		int endRow = page * size;
		return zzimDao.showZzimList(startRow, endRow, userNum);
	}
	
}
