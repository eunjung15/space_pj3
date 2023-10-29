package com.sc.spaceCollection.statics.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StaticsDAO {
	List<StaticsVO> lineStatic();

}
