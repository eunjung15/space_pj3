package com.sc.spaceCollection.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.qna.model.QnaService;
import com.sc.spaceCollection.qna.model.QnaVO;
import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.review.model.ReviewService;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailService;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;
import com.sc.spaceCollection.zzim.model.ZzimServiceImpl;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SpaceDetailController {
	private static final Logger logger = LoggerFactory.getLogger(SpaceDetailController.class);
	private final SpaceDetailService spaceDetailService;
	private final ReviewService reviewService;
	private final QnaService qnaService;
	
	@GetMapping("/detail")
	public String test2(@RequestParam int spaceNum,Model model, HttpServletResponse response) {
		logger.info("공간 상세 페이지, 파라미터 no = {}", spaceNum);
		
		Map<SpaceVO, List<Map<String, Object>>> resultMap = spaceDetailService.selectDetailByNo(spaceNum);
		SpaceVO vo = new SpaceVO();
		String spaceOwnerId="";
		for (Entry<SpaceVO, List<Map<String, Object>>> entry : resultMap.entrySet()) {
			vo = entry.getKey();
			spaceOwnerId = (String)entry.getValue().get(0).get("USER_ID");
		}
		
		RefundVO refundVo = spaceDetailService.selectRefund(vo.getRefundNum());
		
		Map<String, Object> reviewCnt = reviewService.getTotalRecordBySpaceNum(spaceNum);
		int QnACnt = qnaService.getTotalRecordBySpaceNum(spaceNum);
		
		logger.info("reviewCnt.size = {}", reviewCnt.size());
		String avgReview = "후기 없음";
		if(reviewCnt.get("AVG") != null) {
			float avg = Float.parseFloat(String.valueOf(reviewCnt.get("AVG")))/2.0F;
			avgReview = Float.toString(avg).substring(0,3) + "점";
			logger.info("공간 상세 페이지, 4 = {}", avgReview);

		}
		String imgName = "S" + Integer.toString(spaceNum) + "Sub";
		String mainImgName = "S" + Integer.toString(spaceNum) + "Main";
		logger.info("공간 상세 페이지 imgName = {}", imgName);
		
		List<String> imgList = spaceDetailService.selectSpaceImg(imgName);
		String imgMain = spaceDetailService.selectSpaceMainImg(mainImgName);
		
		
		logger.info("공간 상세 페이지 imgList = {}", imgList);
		logger.info("공간 상세 페이지 reviewCnt = {}", reviewCnt);
		logger.info("공간 상세 페이지 resultMap = {}", resultMap.size());
		logger.info("공간 상세 페이지 resultMap.get(vo) = {}", resultMap.get(vo));
		logger.info("공간 상세 페이지 refundVO vo = {}", refundVo);
		
		model.addAttribute("mainImg", imgMain);
		model.addAttribute("imgList", imgList);
		model.addAttribute("user_id", spaceOwnerId);
		model.addAttribute("totalQnA", QnACnt);
		model.addAttribute("totalReview", reviewCnt);
		model.addAttribute("avgReview", avgReview);
		model.addAttribute("vo", vo);
		model.addAttribute("map", resultMap.get(vo));
		model.addAttribute("refundVo", refundVo);
		
		//today+spaceNum으로 오늘본 쿠키 저장
		Cookie todaySd = new Cookie("today"+spaceNum,Integer.toString(spaceNum));
		todaySd.setMaxAge(60*60*24);
		response.addCookie(todaySd);
		
		return "spaceDetail/detail";
	}
	
	@GetMapping("/callReview")
	@ResponseBody
	public List<Map<String, Object>> callReview(@RequestParam int spaceNum,@RequestParam int page ,Model model){
		logger.info("page = {}", page);
		List<Map<String, Object>> reviewList = reviewService.spaceDetailReview(spaceNum, page);
		
		if(reviewList.size() != 0) {
			for(Map<String, Object> map : reviewList) {
				map.put("REVIEW_REG_DATE",map.get("REVIEW_REG_DATE")+"");
			}
		}
		
		
		logger.info("공간 상세 페이지 reviewList = {}", reviewList);
		
		return reviewList;
	}
	
	@GetMapping("/reviewPage")
	@ResponseBody
	public Map<String,Integer> reviewPage(@RequestParam int spaceNum,@RequestParam int page){
		
		int reviewTotalSize = Integer.parseInt(String.valueOf(reviewService.getTotalRecordBySpaceNum(spaceNum).get("COUNT")));
		int reviewBlockPages = 0;
		if(reviewTotalSize % 5 != 0) {
			reviewBlockPages = reviewTotalSize/5 + 1;
		}else {
			reviewBlockPages = reviewTotalSize/5;
		}
		
		Map<String, Integer> reviewPage = new HashMap<>();
		reviewPage.put("reviewBlockPages", reviewBlockPages);
		reviewPage.put("currentPage", page);
		return reviewPage;
	}
	
	
	@GetMapping("/callQnA")
	@ResponseBody
	public List<Map<String, Object>> callQnA(@RequestParam int spaceNum,@RequestParam int page ,Model model){
		logger.info("page = {}", page);
		List<Map<String, Object>> QnAList = qnaService.selectQnaBySpaceNum(spaceNum, page);
		
		if(QnAList.size() != 0) {
			for(Map<String, Object> map : QnAList) {
				map.put("QNA_REG_DATE",map.get("QNA_REG_DATE")+"");
			}
		}
		
		logger.info("공간 상세 페이지 reviewList = {}", QnAList);
		
		return QnAList;
	}
	
	@GetMapping("/QnAPage")
	@ResponseBody
	public Map<String,Integer> QnAPage(@RequestParam int spaceNum,@RequestParam int page){
		
		int QnATotalSize = qnaService.getTotalRecordBySpaceNum(spaceNum);
		int QnABlockPages = 0;
		if(QnATotalSize % 5 != 0) {
			QnABlockPages = QnATotalSize/5 + 1;
		}else {
			QnABlockPages = QnATotalSize/5;
		}
		
		Map<String, Integer> QnAPage = new HashMap<>();
		QnAPage.put("QnABlockPages", QnABlockPages);
		QnAPage.put("currentPage", page);
		return QnAPage;
	}
	
}
