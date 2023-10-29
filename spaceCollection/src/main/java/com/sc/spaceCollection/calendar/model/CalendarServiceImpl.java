package com.sc.spaceCollection.calendar.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {
	private final CalendarDAO calendarDao;
	
	
	
	@Override
	public int insertCalendarMemo(CalendarVO vo) {
		return calendarDao.insertCalendarMemo(vo);
	}

	@Override
	public List<CalendarVO> selectMemoByUserNum(int userNum) {
		return calendarDao.selectMemoByUserNum(userNum);
	}

	@Override
	public int deleteMemo(int memoNum) {
		return calendarDao.deleteMemo(memoNum);
	}

}
