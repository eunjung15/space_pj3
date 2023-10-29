package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.reservation.model.ReservationVO;
import com.sc.spaceCollection.review.model.ReviewService;
import com.sc.spaceCollection.review.model.ReviewVO;
import com.sc.spaceCollection.space.model.SpaceService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	private final ReviewService reviewService;
	private final ReservationService reservationService;
	private final SpaceService spaceService;
	private final GuestService guestService;
	
	@GetMapping("/writeReview")
	public String writeReview_get(@RequestParam int spaceNum,@RequestParam int reservationNum,
									@RequestParam String userId,@RequestParam(defaultValue = "0") int result,
									Model model) {
		logger.info("리뷰작성페이지, 파라미터 spaceNum = {}, userId = {}, reservationNum = {}, result = {}",
				spaceNum,userId,reservationNum,result);
		Map<String,Object> reservationMap = reservationService.reservationReview(reservationNum);
		logger.info("리뷰, 에약정보 조회, reservationMap = {}", reservationMap);
		
		model.addAttribute("reservMap", reservationMap);
		return "review/writeReview";
	}
	@PostMapping("/ajaxWriteReview")
	@ResponseBody
	public int writeReview_post(@ModelAttribute ReviewVO vo,HttpSession session,Model model) {
		logger.info("리뷰 처리, 파라미터 content = {}",vo);
		String userId = (String)session.getAttribute("userId");
		
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		
		String resultContent = vo.getReviewContent().replace("\n", "<br>");
		
		vo.setReviewContent(resultContent);
		vo.setUserNum(userNum);
		int cnt = 0;
		cnt = reviewService.insertReview(vo);
		
		model.addAttribute("result", cnt);
		
		return cnt;
	}
	
	@GetMapping("/deleteReview")
	public String deleteReview(@RequestParam int reviewNum,@RequestParam int spaceNum) {
		logger.info("리뷰삭제, 파라미터 reviewNum = {}, spaceNum = {}",reviewNum ,spaceNum);
		
		int cnt = reviewService.deleteReview(reviewNum);
		logger.info("리뷰삭제, 결과 cnt = {}", cnt);
		
		return "redirect:/detail?spaceNum="+spaceNum;
	}
	
	@GetMapping("/deleteMyReview")
	public String deleteMyReview(@RequestParam int reviewNum) {
		logger.info("나의 리뷰삭제, 파라미터 reviewNum={}",reviewNum);
		
		int cnt = reviewService.deleteReview(reviewNum);
		logger.info("리뷰삭제 결과, cnt={}",cnt);
		
		return "redirect:/myReview";
	}
	
	
	
	
	@RequestMapping("/myReview")
	@Transactional
	public String myReview(@RequestParam(defaultValue = "1") int page,
			@RequestParam(name="searchKeyword", defaultValue ="")String searchKeyword,HttpSession session,Model model ) {
		String userId = (String)session.getAttribute("userId");
		logger.info("나의 리뷰 페이지, 파라미터 userId={},page={},searchKeyword={}",userId,page,searchKeyword);
		
		List<Map<String,Object>> reviewMap=reviewService.selectMyReview(userId, ConstUtil.REVIEW_RECORD_COUNT, page, searchKeyword);
		int total=reviewService.getTotalRecordByUserId(userId);
		
		logger.info("나의 리뷰 불러오기 결과, map.size={}",reviewMap.size());
		logger.info("총 리뷰 레코드 갯수={}",total);
		model.addAttribute("reviewMap",reviewMap);	
		model.addAttribute("total",total);
		return "review/myReview";
	}
}
