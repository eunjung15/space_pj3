package com.sc.spaceCollection.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.calendar.model.CalendarService;
import com.sc.spaceCollection.calendar.model.CalendarVO;
import com.sc.spaceCollection.guest.model.GuestService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CalendarController {
	private final CalendarService calendarService;
	private final GuestService guestService; 
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

	@RequestMapping("/insertMemo")
	@ResponseBody
	public int insertMemo(@RequestParam Map<String, Object> map, HttpSession session) {
		logger.info("캘린더 일정 추가, 파라미터 map = {}", map);
		String userId = (String)session.getAttribute("userId");
		
		CalendarVO vo = new CalendarVO();
		
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		String memoContent = (String)map.get("content");
		String memoTitle = (String)map.get("title");
		String memoStartDay = (String)map.get("start");
		String memoEndDay = (String)map.get("end");
		String memoColor = (String)map.get("color");
		
		
		vo.setMemoContent(memoContent);
		vo.setMemoTitle(memoTitle);
		vo.setMemoStartDay(memoStartDay);
		vo.setMemoEndDay(memoEndDay);
		vo.setMemoColor(memoColor);
		vo.setUserNum(userNum);
		
		int cnt = calendarService.insertCalendarMemo(vo);
		
		return cnt;
	}
	
}
