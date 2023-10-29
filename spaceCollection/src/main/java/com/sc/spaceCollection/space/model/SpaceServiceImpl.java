package com.sc.spaceCollection.space.model;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.sc.spaceCollection.common.ExcelVO;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.controller.UserMainController;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceServiceImpl implements SpaceService{
	private static final Logger logger = LoggerFactory.getLogger(UserMainController.class);
	private final SpaceDAO spaceDao;


	@Override
	public List<SpaceVO> selectBySpaceNum() {
		return spaceDao.selectBySpaceNum();
	}


	@Override
	public List<Map<String, Object>> selectBySpaceType(int page, int size, int spaceTypeNo,
			String region,int maxPeople,
			int minPrice, int maxPrice,
			List<String> filterList,
			String order) {
		int startRow = (page - 1) * size + 1;  
		int endRow = page * size;
		logger.info("typeNo page = {}, size = {}, startRow = {}, endRow = {}, order = {}", page,size,startRow,endRow,order);
		return spaceDao.selectBySpaceType(startRow, endRow, spaceTypeNo, region,maxPeople,minPrice,maxPrice,filterList,order);
	}


	@Override
	public List<Map<String, Object>> selectBySpaceName(int page, int size, String spaceName,
			String region,int maxPeople,
			int minPrice, int maxPrice,
			List<String> filterList,
			String order) {
		int startRow = (page - 1) * size + 1;  
		int endRow = page * size;
		logger.info("name page = {}, size = {}, startRow = {}, endRow = {}, order = {}", page,size,startRow,endRow,order);
		return spaceDao.selectBySpaceName(startRow, endRow, spaceName, region,maxPeople,minPrice,maxPrice,filterList,order);
	}

	@Override
	public List<Map<String, Object>> selectAll(int page, int size,
			String region,int maxPeople,
			int minPrice, int maxPrice,
			List<String> filterList,
			String order) {
		int startRow = (page - 1) * size + 1;  
		int endRow = page * size;
		logger.info("name page = {}, size = {}, startRow = {}, endRow = {}", page,size,startRow,endRow);
		return spaceDao.selectAll(startRow, endRow, region,maxPeople,minPrice,maxPrice,filterList,order);
	}


	@Override
	public List<SpaceVO> selectBySpaceTypeMap(int spaceTypeNo) {
		return spaceDao.selectBySpaceTypeMap(spaceTypeNo);
	}


	@Override
	public List<SpaceVO> selectBySpaceNameMap(String spaceName) {
		return spaceDao.selectBySpaceNameMap(spaceName);
	}


	@Override
	public Map<String, Object> usercount() {
		return spaceDao.usercount();
	}


	@Override
	public List<Map<String, Object>> selectSpaceListViewByUserId(SearchVO vo) {
		List<Map<String, Object>> list = spaceDao.selectSpaceListViewByUserId(vo);
		for(Map<String, Object> map : list) {
			if(map.get("SPACE_REQUEST_DATE")!=null) {
				map.put("SPACE_REQUEST_DATE", (map.get("SPACE_REQUEST_DATE")+"").substring(0,10));
			}else {
				map.put("SPACE_REQUEST_DATE", "");
			}

			if(map.get("SPACE_REG_DATE")!=null) {
				map.put("SPACE_REG_DATE", (map.get("SPACE_REG_DATE")+"").substring(0,10));
			}else {
				map.put("SPACE_REG_DATE", "");
			}

			if(map.get("SPACE_OUT_DATE")!=null) {
				map.put("SPACE_OUT_DATE", (map.get("SPACE_OUT_DATE")+"").substring(0,10));
			}else {
				map.put("SPACE_OUT_DATE", "");
			}

			if(map.get("SPACE_REQUEST_STATUS").equals("Y")) {
				map.put("SPACE_REQUEST_STATUS", "승인");
			}else if(map.get("SPACE_REQUEST_STATUS").equals("N")){
				map.put("SPACE_REQUEST_STATUS", "거절");
			}else if(map.get("SPACE_REQUEST_STATUS").equals("R")) {
				map.put("SPACE_REQUEST_STATUS", "요청");
			}
		}

		return list;
	}


	@Override
	public int getTotalRecordSpaceListViewByUserId(SearchVO vo) {
		return spaceDao.getTotalRecordSpaceListViewByUserId(vo);
	}


	@Override
	public int isAcceptSpace(SpaceVO vo) {
		return spaceDao.isAcceptSpace(vo);
	}


	@Override
	public List<Map<String, Object>> selectSpaceConfirmList(SearchVO vo) {
		List<Map<String, Object>> list = spaceDao.selectSpaceConfirmList(vo);
		for(Map<String, Object> map : list) {
				map.put("SPACE_REQUEST_DATE", (map.get("SPACE_REQUEST_DATE")+"").substring(0, 10));
			if(map.get("SPACE_OUT_DATE") != null) {
				map.put("SPACE_OUT_DATE", (map.get("SPACE_OUT_DATE")+"").substring(0, 10));
			}else {
				map.put("SPACE_REQUEST_DATE", "");
			}
		}
		return list;
	}


	@Override
	public int getTotalRecordSpaceConfrimList(SearchVO vo) {
		return spaceDao.getTotalRecordSpaceConfrimList(vo);
	}


	@Override
	@Transactional
	public int spaceConfirm(SpaceListVO listVo) {
		int cnt = 0;
		try {
			for(SpaceVO vo : listVo.getSpaceItemList()) {
				if(vo.getSpaceNum() > 0) {
					cnt = spaceDao.spaceConfirm(vo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			cnt = -1;
		}

		return cnt;
	}


	@Override
	@Transactional
	public int spaceDenine(SpaceListVO listVo) {
		int cnt = 0;

		try {

			for(SpaceVO vo : listVo.getSpaceItemList()) {
				if(vo.getSpaceNum() > 0) {
					cnt = spaceDao.spaceDenine(vo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			cnt = -1;
		}

		return cnt;
	}


	@Override
	public List<Map<String, Object>> selectSpaceConfirmHistoryList(SearchVO searchVo, String order, String status) {
		List<Map<String, Object>> list = spaceDao.selectSpaceConfirmHistoryList(searchVo, order, status);
		logger.info("serviceImpl 파라미터 searchVO = {}, order = {}, status = {}", searchVo, order, status);
		for(Map<String, Object> map : list) {
			if(map.get("SPACE_REG_DATE") !=null && map.get("SPACE_REG_DATE") != "") {
				map.put("SPACE_REG_DATE", (map.get("SPACE_REG_DATE")+"").substring(0,10));
			}else {
				map.put("SPACE_REG_DATE", "");
			}
			map.put("SPACE_REQUEST_DATE", (map.get("SPACE_REQUEST_DATE")+"").substring(0,10));
			
			if(map.get("SPACE_OUT_DATE") != null) {
				map.put("SPACE_OUT_DATE", (map.get("SPACE_OUT_DATE")+"").substring(0, 10));
			}else {
				map.put("SPACE_REQUEST_DATE", "");
			}
				
			}
			return list;
		}

	@Override
	public int getTotalRecordSpaceConfirmHistoryList(SearchVO searchVo, String order, String status) {
		return spaceDao.getTotalRecordSpaceConfirmHistoryList(searchVo, order, status);
	}


	@Override
	public List<Map<String, Object>> selectSpaceForExcel() {
		List<Map<String, Object>> list = spaceDao.selectSpaceForExcel();
		List<Map<String, Object>> listtrans = new ArrayList<>();
		for(int i=0; i<list.size(); i++) {
			String address = "";

			Map<String, Object> map = list.get(i);
			Map<String, Object> map2 = new HashMap<>();

			map2.put("SPACE_NUM", map.get("SPACE_NUM"));
			map2.put("SPACE_NAME", map.get("SPACE_NAME"));
			map2.put("SPACE_BUSINESS_NUM", map.get("SPACE_BUSINESS_NUM"));
			address = map.get("SPACE_ZIPCODE") + " " + map.get("SPACE_ADDRESS") + " " + map.get("SPACE_ADDRESS_DETAIL");
			if(map.get("SPACE_LOCATION")!=null) {
				address += " " + map.get("SPACE_LOCATION");
			}
			map2.put("SPACE_ADDRESS", address);
			map2.put("SPACE_TAG", map.get("SPACE_TAG"));
			map2.put("SPACE_PHONE_NUM", map.get("SPACE_PHONE_NUM"));
			if((map.get("DEL_FLAG")+"").equals("Y")) {
				map2.put("DEL_FLAG", "삭제");
			}else {
				map2.put("DEL_FLAG", "정상");
			}
			if((map.get("SPACE_REQUEST_STATUS")+"").equals("Y")) {
				map2.put("SPACE_REQUEST_STATUS", "승인");
			}else if((map.get("SPACE_REQUEST_STATUS")+"").equals("N")) {
				map2.put("SPACE_REQUEST_STATUS", "거절");
			}else {
				map2.put("SPACE_REQUEST_STATUS", "요청");
			}
			map2.put("SPACE_REQUEST_DATE", (map.get("SPACE_REQUEST_DATE")+"").substring(0, 10));
			if(map.get("SPACE_REG_DATE") != null) {
				map2.put("SPACE_REG_DATE", (map.get("SPACE_REG_DATE")+"").substring(0, 10));
			}else {
				map2.put("SPACE_REG_DATE", "");
			}
			if(map.get("SPACE_OUT_DATE") != null) {
				map2.put("SPACE_OUT_DATE", (map.get("SPACE_OUT_DATE")+"").substring(0, 10));
			}else {
				map2.put("SPACE_OUT_DATE", "");
			}
			map2.put("SPACE_TYPE_NAME", map.get("SPACE_TYPE_NAME"));
			map2.put("USER_ID", map.get("USER_ID"));
			map2.put("USER_EMAIL", map.get("USER_EMAIL"));
			map2.put("SD_TYPE", map.get("SD_TYPE"));
			map2.put("SD_PRICE", map.get("SD_PRICE"));
			map2.put("SD_PEOPLE", map.get("SD_MIN_PEOPLE") + " ~ " + map.get("SD_MAX_PEOPLE"));
			map2.put("SD_MIN_TIME", map.get("SD_MIN_TIME"));
			map2.put("SD_TIME", map.get("SD_OPEN_TIME") + " ~ " + map.get("SD_CLOSE_TIME"));
			String fac = "";
			if(map.get("FAC_WIFI") != null) {
				fac += "WIFI : O/";
			}else{
				fac += "WIFI : X/";
			}
			if(map.get("FAC_PRINTER") != null) {
				fac += "프린터 : O/";
			}else{
				fac += "프린터 : X/";
			}
			if(map.get("FAC_CHAIR_TABLE") != null) {
				fac += "의자,테이블 : O/";
			}else{
				fac += "의자,테이블 : X/";
			}
			if(map.get("FAC_SMOKE") != null) {
				fac += "흡연 : O/";
			}else{
				fac += "흡연 : X/";
			}
			if(map.get("FAC_REST_ROOM") != null) {
				fac += "화장실 : O/";
			}else{
				fac += "화장실 : X/";
			}
			if(map.get("FAC_PC") != null) {
				fac += "PC : O/";
			}else{
				fac += "PC : X/";
			}
			if(map.get("FAC_TV") != null) {
				fac += "TV : O/";
			}else{
				fac += "TV : X/";
			}
			if(map.get("FAC_WHITE_BOARD") != null) {
				fac += "화이트보드 : O/";
			}else{
				fac += "화이트보드 : X/";
			}
			if(map.get("FAC_ELEVATOR") != null) {
				fac += "엘리베이터 : O/";
			}else{
				fac += "엘리베이터 : X/";
			}
			if(map.get("FAC_PARKING") != null) {
				fac += "주차 : O/";
			}else{
				fac += "주차 : X/";
			}
			if(map.get("FAC_FOOD") != null) {
				fac += "취식 : O/";
			}else{
				fac += "취식 : X/";
			}
			if(map.get("FAC_DRINK") != null) {
				fac += "주류반입 : O/";
			}else{
				fac += "주류반입 : X/";
			}
			if(map.get("FAC_COOK") != null) {
				fac += "취사 : O/";
			}else{
				fac += "취사 : X/";
			}
			if(map.get("FAC_PET") != null) {
				fac += "반려동물반입 : O/";
			}else{
				fac += "반려동물반입 : X/";
			}
			if(map.get("FAC_AUDIO") != null) {
				fac += "오디오시설 : O/";
			}else{
				fac += "오디오시설 : X/";
			}

			map2.put("FACILITY", fac);
			listtrans.add(map2);
		}

		return listtrans;
	}

	public List<SpaceVO> selectAllMap() {
		return spaceDao.selectAllMap();

	}


	@Override
	public int spaceConfirmOne(int spaceNum) {
		return spaceDao.spaceConfirmOne(spaceNum);
	}


	@Override
	public int spaceDenineOne(int spaceNum) {
		return spaceDao.spaceDenineOne(spaceNum);
	}
	@Override
	public String selectSpaceTypeName(int spaceTypeNo) {
		return spaceDao.selectSpaceTypeName(spaceTypeNo);

	}


	@Override
	public Map<String, Object> selectSpaceConfirmDetailBySpaceNum(int spaceNum) {
		String address = "";

		Map<String, Object> map = spaceDao.selectSpaceConfirmDetailBySpaceNum(spaceNum);
		Map<String, Object> map2 = new HashMap<>();

		map2.put("SPACE_NUM", map.get("SPACE_NUM"));
		map2.put("SPACE_NAME", map.get("SPACE_NAME"));
		map2.put("SPACE_BUSINESS_NUM", map.get("SPACE_BUSINESS_NUM"));
		map2.put("SPACE_ZIPCODE", map.get("SPACE_ZIPCODE"));
		address = map.get("SPACE_ADDRESS") + " " + map.get("SPACE_ADDRESS_DETAIL");
		if(map.get("SPACE_LOCATION")!=null) {
			address += " " + map.get("SPACE_LOCATION");
		}
		map2.put("SPACE_INTRO", map.get("SPACE_INTRO"));
		map2.put("SPACE_INFO", (map.get("SPACE_INFO")+"").replace("<br>", "\n"));
		map2.put("SPACE_ADDRESS", address);
		map2.put("SPACE_TAG", map.get("SPACE_TAG"));
		map2.put("SPACE_WARN", map.get("SPACE_WARN"));
		map2.put("SPACE_PHONE_NUM", map.get("SPACE_PHONE_NUM"));
		if((map.get("DEL_FLAG")+"").equals("Y")) {
			map2.put("DEL_FLAG", "삭제");
		}else {
			map2.put("DEL_FLAG", "정상");
		}
		if((map.get("SPACE_REQUEST_STATUS")+"").equals("Y")) {
			map2.put("SPACE_REQUEST_STATUS", "승인");
		}else if((map.get("SPACE_REQUEST_STATUS")+"").equals("N")) {
			map2.put("SPACE_REQUEST_STATUS", "거절");
		}else {
			map2.put("SPACE_REQUEST_STATUS", "요청중");
		}
		map2.put("SPACE_REQUEST_DATE", (map.get("SPACE_REQUEST_DATE")+"").substring(0, 10));
		if(map.get("SPACE_REG_DATE") != null) {
			map2.put("SPACE_REG_DATE", (map.get("SPACE_REG_DATE")+"").substring(0, 10));
		}else {
			map2.put("SPACE_REG_DATE", "");
		}
		if(map.get("SPACE_OUT_DATE") != null) {
			map2.put("SPACE_OUT_DATE", (map.get("SPACE_OUT_DATE")+"").substring(0, 10));
		}else {
			map2.put("SPACE_OUT_DATE", "");
		}
		map2.put("SPACE_TYPE_NAME", map.get("SPACE_TYPE_NAME"));
		map2.put("SD_AREA", map.get("SD_AREA"));
		map2.put("USER_ID", map.get("USER_ID"));
		map2.put("USER_EMAIL", map.get("USER_EMAIL"));
		map2.put("USER_NAME", map.get("USER_NAME"));
		map2.put("USER_HP", map.get("USER_HP"));
		
		
		map2.put("CATEGORY_NAME", map.get("CATEGORY_NAME"));
		
		
		
		map2.put("REFUND_7_DAY", map.get("REFUND_7_DAY"));
		map2.put("REFUND_6_DAY", map.get("REFUND_6_DAY"));
		map2.put("REFUND_5_DAY", map.get("REFUND_5_DAY"));
		map2.put("REFUND_4_DAY", map.get("REFUND_4_DAY"));
		map2.put("REFUND_3_DAY", map.get("REFUND_3_DAY"));
		map2.put("REFUND_2_DAY", map.get("REFUND_2_DAY"));
		map2.put("REFUND_1_DAY", map.get("REFUND_1_DAY"));
		map2.put("REFUND_DAY", map.get("REFUND_DAY"));
		
		return map2;
	}


	@Override
	public List<Map<String, Object>> selectSpaceDtailViewBySpaceNum(int spaceNum) {
		List<Map<String, Object>> list = spaceDao.selectSpaceDtailViewBySpaceNum(spaceNum);
		List<Map<String, Object>> listtrans = new ArrayList<>();
		
		DecimalFormat df = new DecimalFormat("#,###");
		
		for(Map<String, Object> map : list) {
			if(map != null) {
				Map<String, Object> map2 = new HashMap<>();
				
				map2.put("SD_TYPE", map.get("SD_TYPE"));
				map2.put("SD_PRICE", df.format(map.get("SD_PRICE"))+"원");
				map2.put("SD_PEOPLE", "최소 " + map.get("SD_MIN_PEOPLE") + "명 ~ 최대 " + map.get("SD_MAX_PEOPLE")+"명");
				map2.put("SD_MIN_TIME", map.get("SD_MIN_TIME"));
				map2.put("SD_TIME", map.get("SD_OPEN_TIME") + ":00 ~ " + map.get("SD_CLOSE_TIME")+":00");
				
				if(map.get("FAC_WIFI") != null) {
					map2.put("FAC_WIFI", "O");
				}else{
					map2.put("FAC_WIFI", "X");
				}
				if(map.get("FAC_PRINTER") != null) {
					map2.put("FAC_PRINTER", "O");
				}else{
					map2.put("FAC_PRINTER", "X");
				}
				if(map.get("FAC_CHAIR_TABLE") != null) {
					map2.put("FAC_CHAIR_TABLE", "O");
				}else{
					map2.put("FAC_CHAIR_TABLE", "X");
				}
				if(map.get("FAC_SMOKE") != null) {
					map2.put("FAC_SMOKE", "O");
				}else{
					map2.put("FAC_SMOKE", "X");
				}
				if(map.get("FAC_REST_ROOM") != null) {
					map2.put("FAC_REST_ROOM", "O");
				}else{
					map2.put("FAC_REST_ROOM", "X");
				}
				if(map.get("FAC_PC") != null) {
					map2.put("FAC_PC", "O");
				}else{
					map2.put("FAC_PC", "X");
				}
				if(map.get("FAC_TV") != null) {
					map2.put("FAC_TV", "O");
				}else{
					map2.put("FAC_TV", "X");
				}
				if(map.get("FAC_WHITE_BOARD") != null) {
					map2.put("FAC_WHITE_BOARD", "O");
				}else{
					map2.put("FAC_WHITE_BOARD", "X");
				}
				if(map.get("FAC_ELEVATOR") != null) {
					map2.put("FAC_ELEVATOR", "O");
				}else{
					map2.put("FAC_ELEVATOR", "X");
				}
				if(map.get("FAC_PARKING") != null) {
					map2.put("FAC_PARKING", "O");
				}else{
					map2.put("FAC_PARKING", "X");
				}
				if(map.get("FAC_FOOD") != null) {
					map2.put("FAC_FOOD", "O");
				}else{
					map2.put("FAC_FOOD", "X");
				}
				if(map.get("FAC_DRINK") != null) {
					map2.put("FAC_DRINK", "O");
				}else{
					map2.put("FAC_DRINK", "X");
				}
				if(map.get("FAC_COOK") != null) {
					map2.put("FAC_COOK", "O");
				}else{
					map2.put("FAC_COOK", "X");
				}
				if(map.get("FAC_PET") != null) {
					map2.put("FAC_PET", "O");
				}else{
					map2.put("FAC_PET", "X");
				}
				if(map.get("FAC_AUDIO") != null) {
					map2.put("FAC_AUDIO", "O");
				}else{
					map2.put("FAC_AUDIO", "X");
				}
				
				listtrans.add(map2);
			}
		}
		
		return listtrans;
	}


	@Override
	public Map<String, Object> selectSpaceFileViewBySpaceNum(String spaceNum) {
		return spaceDao.selectSpaceFileViewBySpaceNum(spaceNum);
	}

}
