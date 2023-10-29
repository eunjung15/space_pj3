package com.sc.spaceCollection.zzim.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ZzimDAO {
	ZzimVO selectZzimBySpaceNum(@Param("spaceNum") int spaceNum, @Param("userNum") int userNum);
	List<Map<String,Object>> showZzimList(@Param("startRow")int startRow, @Param("endRow") int endRow,@Param("userNum")int userNum);
	int selectZzim(int spaceNum, int userNum);
	int insertZzim(ZzimVO vo);
	int deleteZzim(ZzimVO vo);
}
