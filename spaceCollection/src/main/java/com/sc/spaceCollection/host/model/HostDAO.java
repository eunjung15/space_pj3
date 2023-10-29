package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.board.model.BoardVO;
import com.sc.spaceCollection.facility.model.FacilityVO;
import com.sc.spaceCollection.facility.model.SpaceToTalFacilityVO;
import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileVO;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

@Mapper
public interface HostDAO {
	//공간 등록
	List<SpaceCategoryAllVO> selectSpaceCategory();
	SpaceTypeVO selectSpaceTypeBySpaceTypeName(String spaceTypeName);
	int insertSpace(SpaceVO spaceVo);
	int insertRefund(RefundVO refundVo);
	int insertSpaceTotalFacility(SpaceToTalFacilityVO spaceTotalFacilityVo);
	
	//세부공간 등록
	int insertFacility(FacilityVO facilityVo);
	int insertSpaceDetail(SpaceDetailVO spaceDetailVo);
	
	//조회
	SpaceFileVO selectSpaceFile(int spaceNum);
	List<SpaceVO> selectSpaceByUserNum(int userNum);
	List<SpaceDetailVO> selectSpaceDetailBySpaceNum(int spaceNum);
	SpaceDetailVO selectSpaceDetailBySdNum(int sdNum);
	FacilityVO selectFacilityByFaNum(int facilityNum);
	
	//공간 삭제
	int deleteSpace(int spaceNum);
	int deleteSpaceDetail(int sdNum);
	
	//공간 수정
	SpaceVO selectSpaceByspaceNum(int spaceNum);
	SpaceTypeVO selectSpaceTypeBySpaceTypeNo(int spaceTypeNo);
	SpaceToTalFacilityVO selectTotalFacilityBySpaceNum(int spaceNum);
	RefundVO selectRefundByRefundNum(int refundNum);
	int updateSpace(SpaceVO spaceVo);
	int updateTotalFacility(SpaceToTalFacilityVO spaceTotalFacilityVo);
	int updateRefund(RefundVO refundVo);
	int deleteLicenseImg(int spaceNum);
	int deleteMainImg(int spaceNum);
	int deleteSubImg(int spaceNum);
	
	//세부공간 수정
	int updateSpaceDetail(SpaceDetailVO spaceDetailVo);
	int updateFacility(FacilityVO facilityVo);
	
	//공지사항
	List<BoardVO> selectNotice(String boardTypeId);
	
	List<Map<String, Object>> selectHostReservation(@Param("startRow") int startRow, @Param("endRow") int endRow,
													@Param("userNum")int userNum,@Param("status") String status,
													@Param("order")String order,@Param("keyword")String keyword);
	List<Map<String, Object>> HostReservationCalendar(@Param("userNum")int userNum);
	UserInfoVO selectUserById (String userId);
	List<Integer> getDataByDate(@Param("date") String date,@Param("userNum") int userNum);
}
