package com.sc.spaceCollection.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.reservation.model.ReservationVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailService;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reservation")
@RequiredArgsConstructor
public class ReservationController {
	private final static Logger logger = LoggerFactory.getLogger(ReservationController.class);
	private final ReservationService reservationService;
	private final SpaceDetailService sdService;
	
	
	@ResponseBody
	@GetMapping("/ajaxReservation")
	public int ajaxInsertReservation(@RequestParam Map<String, Object> paymentData, Model model) {
		logger.info("예약 화면, 파라미터 paymentData = {}", paymentData);
		ReservationVO vo = new ReservationVO();
		
		String userId = (String) paymentData.get("buyer_name"); 
		int sdNum =Integer.parseInt((String) paymentData.get("custom_data[SD_NUM]"));
		String startDay = (String) paymentData.get("custom_data[START_DAY]");
		String startHour = (String) paymentData.get("custom_data[START_HOUR]");
		String endDay = (String) paymentData.get("custom_data[END_DAY]");
		String endHour = (String) paymentData.get("custom_data[END_HOUR]");
		int reservePrice = Integer.parseInt((String) paymentData.get("paid_amount"));
		int reservePeople = Integer.parseInt((String) paymentData.get("custom_data[RESERVE_PEOPLE]"));
		String paymentType = (String) paymentData.get("pg_provider");
		String reservationUid = (String) paymentData.get("pg_tid");
		
		logger.info("userId = {}, sdNum = {}, startDay = {}, endHour = {}", userId, sdNum, startDay, endHour);
		logger.info("startHour = {}, endDay = {}, reservePrice = {}, paymentType = {}", startHour, endDay, reservePrice, paymentType);
		logger.info("merchant_uid = {}", reservationUid);
		
		
		int paymentNum = 0;
		if(paymentType.equals("kakaopay")) {
			paymentNum = 1;
		}else if(paymentType.equals("kcp")) {
			paymentNum = 2;
		}
		
		
		vo.setUserId(userId);
		vo.setSdNum(sdNum);
		vo.setReserveStartDay(startDay);
		vo.setReserveStartHour(startHour);
		vo.setReserveFinishDay(endDay);
		vo.setReserveFinishHour(endHour);
		vo.setReservePrice(reservePrice);
		vo.setPaymentNum(paymentNum);
		vo.setReservePeople(reservePeople);
		vo.setReservationUid(reservationUid);
		logger.info("vo세팅 결과, vo = {}", vo);
		
		int cnt = reservationService.insertReservation(vo);
		logger.info("예약 처리 결과, cnt = {}", cnt);
		logger.info("예약 처리 후 vo = {}", vo);
		
		return vo.getReservationNum();
	}
	
	@ResponseBody
	@GetMapping("/ajaxSelectRes")
	public Object selectReservationByDayAndNum(@RequestParam String sdNum,
											@RequestParam String selectedDates) {
		logger.info("ajax 예약조회 파라미터 sdNum = {}, selectedDates = {}", sdNum, selectedDates);
		List<Map<String, Object>> resultList = new ArrayList<>();
		Map<String,Object> resultMap = new HashMap<>();
		
		if(reservationService.selectReservationByDayAndNum(Integer.parseInt(sdNum), selectedDates).equals("noData")) {
			logger.info("해당 날짜에 예약내역 없음");
			
			SpaceDetailVO vo = sdService.selectJustDetailByNo(Integer.parseInt(sdNum));
			
			resultMap.put("result", 2);
			resultMap.put("startHour", vo.getSdOpenTime());
			resultMap.put("endHour",vo.getSdCloseTime());
			
			resultList.add(resultMap);
		}else {
			List<ReservationVO> list = (List<ReservationVO>)reservationService.selectReservationByDayAndNum(Integer.parseInt(sdNum), selectedDates);
			
			for(int i = 0; i < list.size(); i++) {
				ReservationVO vo = list.get(i);
				resultMap = new HashMap<>();
				resultMap.put("startHour", Integer.parseInt(vo.getReserveStartHour()));
				resultMap.put("endHour", Integer.parseInt(vo.getReserveFinishHour()));
				logger.info("예약번호 = {}",vo.getReservationNum());
				resultList.add(resultMap);
			}
			logger.info("ajax 예약조회 결과 resultList = {}",resultList);
		}
		return resultList;
	}
	@GetMapping("/showReservation")
	public String showReservation(@RequestParam int reservationNum, HttpSession session,Model model) {
		logger.info("예약 내역 페이지");
		String userId = (String)session.getAttribute("userId");
		
		if(userId == null || userId.isEmpty()) {
			String msg = "잘못된 접근입니다", url = "/";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		logger.info("예약 내역 페이지, id = {}, reservationNum = {}", userId, reservationNum);
		Map<String, Object> map = reservationService.showReservation(reservationNum, userId);
		
		if(map == null || map.isEmpty()) {
			String msg = "잘못된 접근입니다", url = "/";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		boolean isReviewd = reservationService.isReviewd(reservationNum, userId);
		if(isReviewd) {
			model.addAttribute("isReviewed", true);
		}else {
			model.addAttribute("isReviewed", false);
		}

		logger.info("예약 내역 페이지, 조회결과 map.size = {}", map);
		
		model.addAttribute("map", map);
		return "reservation/showReservation";
	}
	
	@GetMapping("/reservationList")
	public String reservationList(@RequestParam(defaultValue = "1") int page,HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		logger.info("예약 내역 조회 파라미터 userId = {}", userId);
		if(userId == null || userId.isEmpty()) {
			
			model.addAttribute("msg","예약 내역은 로그인 후 이용 가능합니다");
			model.addAttribute("url", "/login/login");
			
			return "common/message";
		}
		
		
		List<Map<String,Object>> list = reservationService.reservationList(userId,page);
		int countList = reservationService.countReservationList(userId);
		logger.info("예약 내역 조회 결과 list = {} ", list.size());

		int totalSize = countList;
		int blockPages = 0;
		if(totalSize % 5 != 0) {
			blockPages = totalSize/5 + 1;
		}else {
			blockPages = totalSize/5;
		}
		logger.info("페이지 정보, totalSize = {}, blockPages = {}", totalSize, blockPages);
		
		model.addAttribute("totalSize", totalSize);
		model.addAttribute("blockPages", blockPages);
		model.addAttribute("list", list);
		
		
		
		return "reservation/reservationList";
	}
	
	@GetMapping("/zzim")
	public void zzim(@RequestParam int spaceNum) {
		logger.info("찜, 파라미터 spaceNum = {}", spaceNum);
		
	}
	
	@PostMapping("/showReservation/cancle")
	public String reserve_cancle(@RequestBody Map<String, Object> cancelData) {
		String merchant_uid = (String)cancelData.get("merchant_uid");
		int price = Integer.parseInt((String)cancelData.get("cancel_request_amount"));
		int cancelTaxFreeAmount = 0;
		reservationService.refundPayment(merchant_uid,price,cancelTaxFreeAmount);
		
		int cnt = reservationService.canceledReservation(merchant_uid);
		logger.info("환불하기 결과,cnt = {}", cnt);
		return "reservation/reservationList";
	}
	
}









