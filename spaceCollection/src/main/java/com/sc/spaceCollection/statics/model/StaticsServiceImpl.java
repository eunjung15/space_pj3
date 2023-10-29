package com.sc.spaceCollection.statics.model;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaticsServiceImpl implements StaticsService{
	private static final Logger logger = LoggerFactory.getLogger(StaticsServiceImpl.class);
	
	private final StaticsDAO staticsDao;

	@Override
	public List<StaticsVO> lineStatic() {
		List<StaticsVO> list = staticsDao.lineStatic();
		
		for (StaticsVO staticsVo : list) {
	        Date date = staticsVo.getDay(); // 날짜를 가져온다.
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(date);
	        calendar.add(Calendar.DAY_OF_MONTH, 1); // 날짜를 1일씩 늘린다.
	        staticsVo.setDay(calendar.getTime()); // 수정된 날짜를 다시 설정한다.
	    }

		return list;
	}

}
