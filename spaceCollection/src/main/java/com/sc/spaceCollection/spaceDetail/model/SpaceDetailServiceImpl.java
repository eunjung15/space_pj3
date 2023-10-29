package com.sc.spaceCollection.spaceDetail.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.space.model.SpaceDAO;
import com.sc.spaceCollection.space.model.SpaceVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceDetailServiceImpl implements SpaceDetailService{
	private final SpaceDetailDAO spaceDetailDao;
	
	@Override
	public Map<SpaceVO, List<Map<String, Object>>> selectDetailByNo(int spaceNo) {
		SpaceVO vo = spaceDetailDao.selectByNo(spaceNo);
		
		List<Map<String, Object>> list = spaceDetailDao.selectDetailByNo(vo.getSpaceNum());
		
		Map<SpaceVO, List<Map<String,Object>>> resultMap = new HashMap<>();
		resultMap.put(vo, list);
		
		return resultMap;
	}

	public RefundVO selectRefund(int refundNo) {
		return spaceDetailDao.selectRefund(refundNo);
	}

	@Override
	public SpaceDetailVO selectJustDetailByNo(int sdNum) {
		return spaceDetailDao.selectJustDetailByNo(sdNum);
	}

	@Override
	public List<SpaceDetailVO> selectBySpaceNo(int spaceNo) {
		return spaceDetailDao.selectBySpaceNo(spaceNo);
	}

	@Override
	public int countReservationBySdNum(int sdNum) {
		return spaceDetailDao.countReservationBySdNum(sdNum);
	}

	@Override
	public List<String> selectSpaceImg(String imgName) {
		return spaceDetailDao.selectSpaceImg(imgName);
	}

	@Override
	public String selectSpaceMainImg(String imgName) {
		return spaceDetailDao.selectSpaceMainImg(imgName);
	}

	


}
