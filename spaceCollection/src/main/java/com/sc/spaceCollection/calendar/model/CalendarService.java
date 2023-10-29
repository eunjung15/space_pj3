package com.sc.spaceCollection.calendar.model;

import java.util.List;

public interface CalendarService {
	int insertCalendarMemo(CalendarVO vo);
	List<CalendarVO> selectMemoByUserNum(int userNum);
	int deleteMemo(int memoNum);
}
