package com.sc.spaceCollection.space.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.ExcelVO;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

public interface SpaceService {
	List<Map<String, Object>> selectBySpaceType(int page, int size, int spaceTypeNo,
												String region,int maxPeople,
												int minPrice, int MaxPrice,
												List<String> filterList,
												String order);
	
	List<Map<String, Object>> selectBySpaceName(int page, int size, String spaceName,
												String region,int maxPeople,
												int minPrice, int MaxPrice,
												List<String> filterList,
												String order);
	List<Map<String, Object>> selectAll(int page, int size,
										String region,int maxPeople,
										int minPrice, int MaxPrice,
										List<String> filterList,
										String order);
	List<SpaceVO> selectAllMap();
	List<SpaceVO> selectBySpaceTypeMap(int spaceTypeNo);
	List<SpaceVO> selectBySpaceNameMap(String spaceName);
	List<SpaceVO> selectBySpaceNum();
	Map<String, Object> usercount();
	List<Map<String, Object>> selectSpaceListViewByUserId(SearchVO vo);
	int getTotalRecordSpaceListViewByUserId(SearchVO vo);
	int isAcceptSpace(SpaceVO vo);
	List<Map<String, Object>> selectSpaceConfirmList(SearchVO vo);
	int getTotalRecordSpaceConfrimList(SearchVO vo);
	int spaceConfirm(SpaceListVO listVo);
	int spaceDenine(SpaceListVO listVo);
	int spaceConfirmOne(int spaceNum);
	int spaceDenineOne(int spaceNum);
	List<Map<String, Object>> selectSpaceConfirmHistoryList(SearchVO searchVo, String order, String status);
	int getTotalRecordSpaceConfirmHistoryList(SearchVO searchVo, String order, String status);
	List<Map<String, Object>> selectSpaceForExcel();
	String selectSpaceTypeName(int spaceTypeNo);
	Map<String, Object> selectSpaceConfirmDetailBySpaceNum(int spaceNum);
	List<Map<String, Object>> selectSpaceDtailViewBySpaceNum(int spaceNum);
	Map<String,Object> selectSpaceFileViewBySpaceNum(String spaceNum);
}
