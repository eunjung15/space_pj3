package com.sc.spaceCollection.spaceType.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.host.model.SpaceTypeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceTypeServiceImpl implements SpaceTypeService{
	private static final Logger logger = LoggerFactory.getLogger(SpaceTypeServiceImpl.class);
	
	private final SpaceTypeDAO spaceTypeDao;

	@Override
	public int getTotalRecord(SearchVO vo) {
		return spaceTypeDao.getTotalRecord(vo);
	}


	@Override
	public int insertSpaceType(SpaceTypeVO vo) {
		int result = 0;
		
		int cnt = spaceTypeDao.spaceTypeNameDubCheck(vo.getSpaceTypeName());
		
		if(cnt>0) {
			result = SpaceTypeService.DUB;
		}else {
			cnt = spaceTypeDao.insertSpaceType(vo);
			if(cnt>0) {
				result = SpaceTypeService.PASS;
			}else {
				result = SpaceTypeService.ERR;
			}
		}
		
		return result;
	}

	@Override
	@Transactional
	public int spaceTypeActivation(SpaceTypeListVO listVo) {
		int cnt = 0;
		try {
			for(SpaceTypeVO vo : listVo.getSpaceTypeItemList()) {
				if(vo.getSpaceTypeNo()>0) {
					cnt = spaceTypeDao.spaceTypeActivation(vo);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	@Transactional
	public int spaceTypeDeactivation(SpaceTypeListVO listVo) {
		int cnt = 0;
		try {
			for(SpaceTypeVO vo : listVo.getSpaceTypeItemList()) {
				if(vo.getSpaceTypeNo()>0) {
					cnt = spaceTypeDao.spaceTypeDeactivation(vo);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public int updateSpaceType(SpaceTypeVO vo) {
		int result = 0;
		int cnt = 0;
		
		Map<String, Object> map = selectBySpaceTypeName(vo.getSpaceTypeName());
		
		cnt = spaceTypeDao.spaceTypeNameDubCheck(vo.getSpaceTypeName());
		logger.info("cnt 얼마냐 = {}", cnt);
		logger.info("voNo = {}, mapNo = {}",vo.getSpaceTypeNo(), map.get("SPACE_TYPE_NO"));
		
		if(cnt>0) {
			if((map.get("SPACE_TYPE_NO")+"").equals(vo.getSpaceTypeNo()+"")) {
				result = SpaceTypeService.PASS;
			}else {
				result = SpaceTypeService.DUB;
				
			}
		}else {
			result = SpaceTypeService.PASS;
		}
			
		if(result == SpaceTypeService.PASS) {
			cnt = spaceTypeDao.updateSpaceType(vo);
			if(cnt<1) {
				result = SpaceTypeService.ERR;
			}
		}
		
		return result;
	}

	@Override
	public Map<String, Object> selectBySpaceTypeName(String spaceTypeName) {
		return spaceTypeDao.selectBySpaceTypeName(spaceTypeName);
	}


	@Override
	public List<Map<String, Object>> selectSpaceType(SearchVO vo) {
		return spaceTypeDao.selectSpaceType(vo);
	}


	@Override
	public SpaceTypeVO selectSpaceTypeBySpaceTypeNo(int spaceTypeNo) {
		return spaceTypeDao.selectSpaceTypeBySpaceTypeNo(spaceTypeNo);
	}

	
}
