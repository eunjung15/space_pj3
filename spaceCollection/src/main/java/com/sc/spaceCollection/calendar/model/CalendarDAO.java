package com.sc.spaceCollection.calendar.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarDAO {
	int insertCalendarMemo(CalendarVO vo);
	List<CalendarVO> selectMemoByUserNum(int userNum);
	int deleteMemo(int memoNum);
}
