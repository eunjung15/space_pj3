package com.sc.spaceCollection.spaceTypeCategory.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceTypeCategoryServiceImpl implements SpaceTypeCategoryService{
	private static final Logger logger = LoggerFactory.getLogger(SpaceTypeCategoryServiceImpl.class);
	
	private final SpaceTypeCategoryDAO spaceTypeCategoryDao;
	
	@Override
	public List<SpaceTypeCategoryVO> selectSpaceTypeCategory(SearchVO vo) {
		return spaceTypeCategoryDao.selectSpaceTypeCategory(vo);
	}

	@Override
	public int getTotalRecord(SearchVO vo) {
		return spaceTypeCategoryDao.getTotalRecord(vo);
	}

	@Override
	public int insertSpaceTypeCategory(SpaceTypeCategoryVO vo) {
		int result = ERR;
		
		int cnt = spaceTypeCategoryDao.spaceTypeCategoryNameDupCheck(vo);
		
		if(cnt>0) {
			result = DUB; 
		}else {
			cnt = spaceTypeCategoryDao.insertSpaceTypeCategory(vo);
			if(cnt>0) {
				result = PASS;
			}
		}
		
		return result;
	}

	@Override
	@Transactional
	public int spaceTypeCategoryActivation(SpaceTypeCategoryListVO listVo) {
		int cnt = 0;
		try {
			for(SpaceTypeCategoryVO vo : listVo.getSpaceTypeCategoryItemList()) {
				if(vo.getCategoryNo()!=0) {
					logger.info("vo = {}",vo);
					cnt = spaceTypeCategoryDao.spaceTypeCategoryActivation(vo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int spaceTypeCategoryDeactivation(SpaceTypeCategoryListVO listVo) {
		int cnt = 0;
		
		try {
			for(SpaceTypeCategoryVO vo : listVo.getSpaceTypeCategoryItemList()) {
				if(vo.getCategoryNo()!=0) {
					cnt = spaceTypeCategoryDao.spaceTypeCategoryDeactivation(vo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public List<SpaceTypeCategoryVO> selectSpaceTypeCategoryAll() {
		return spaceTypeCategoryDao.selectSpaceTypeCategoryAll();
	}

}
