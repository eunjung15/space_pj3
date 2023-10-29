package com.sc.spaceCollection.space.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.ExcelVO;
import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface SpaceDAO {
	List<Map<String, Object>> selectBySpaceType(@Param("startRow")int startRow,
												@Param("endRow") int endRow,
												@Param("spaceTypeNo") int spaceTypeNo,
												@Param("region") String region,
												@Param("maxPeople") int maxPeople,
												@Param("minPrice") int minPrice,
												@Param("maxPrice") int maxPrice,
												@Param("filterList") List<String> filterList,
												@Param("order") String order);
	
	List<Map<String, Object>> selectBySpaceName(@Param("startRow")int startRow,
												@Param("endRow") int endRow,
												@Param("spaceName") String spaceName,
												@Param("region") String region,
												@Param("maxPeople") int maxPeople,
												@Param("minPrice") int minPrice,
												@Param("maxPrice") int maxPrice,
												@Param("filterList") List<String> filterList,
												@Param("order") String order);
	List<Map<String, Object>> selectAll(@Param("startRow")int startRow,
										@Param("endRow") int endRow,
										@Param("region") String region,
										@Param("maxPeople") int maxPeople,
										@Param("minPrice") int minPrice,
										@Param("maxPrice") int maxPrice,
										@Param("filterList") List<String> filterList,
										@Param("order") String order);
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
	int spaceConfirm(SpaceVO vo);
	int spaceDenine(SpaceVO vo);
	int spaceConfirmOne(int spaceNum);
	int spaceDenineOne(int spaceNum);
	List<Map<String, Object>> selectSpaceConfirmHistoryList(@Param("searchVo")SearchVO searchVo,
															@Param("order")String order,
															@Param("status")String status);
	int getTotalRecordSpaceConfirmHistoryList(@Param("searchVo")SearchVO searchVo,
															@Param("order")String order,
															@Param("status")String status);
	List<Map<String, Object>> selectSpaceForExcel();
	String selectSpaceTypeName(int spaceTypeNo);
	Map<String, Object> selectSpaceConfirmDetailBySpaceNum(int spaceNum);
	List<Map<String, Object>> selectSpaceDtailViewBySpaceNum(int spaceNum);
	Map<String,Object> selectSpaceFileViewBySpaceNum(String spaceNum);
}
